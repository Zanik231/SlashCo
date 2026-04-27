local SLASHER = {}

SLASHER.Name = "Hulk"
SLASHER.Aliases = {
	"Green man",
	"Revenger",
	"Strong man"
}
SLASHER.Class = SlashCo.SlasherClass.Cryptid
SLASHER.DangerLevel = SlashCo.DangerLevel.Considerable
SLASHER.IsSelectable = true
SLASHER.Model = "models/slashco/slashers/hulk/hulk_avenger.mdl"
SLASHER.GasCanMod = 0
SLASHER.KillDelay = 0
SLASHER.ProwlSpeed = 150
SLASHER.ChaseSpeed = 290
SLASHER.Perception = 0.7
SLASHER.Eyesight = 5
SLASHER.KillDistance = 99999
SLASHER.ChaseRange = 900
SLASHER.ChaseRadius = 0.9 -- CHECK
SLASHER.ChaseDuration = 12.0 -- Длительность погони
SLASHER.ChaseCooldown = 3 -- Перезарядка погони
SLASHER.JumpscareDuration = 2
SLASHER.ChaseMusic = "slashco/slasher/hulk/hulk_chase.wav"
SLASHER.KillSound = "slashco/slasher/hulk/rooar.wav" -- Звук убийства
SLASHER.Description = "Hulk_desc" -- Описание (локализация)
SLASHER.ProTip = "Hulk_tip" -- Совет (локализация)
SLASHER.SpeedRating = "★★★★☆" -- Оценка скорости
SLASHER.EyeRating = "★★★☆☆" -- Оценка зрения
SLASHER.DiffRating = "★★★☆☆" -- Оценка сложности
SLASHER.AngerIncreaseForKill = 15 -- Увеличение ярости
SLASHER.AngerIncrease = 7 -- Увеличение ярости
SLASHER.AngerPassiveGain = 0.05 -- Пассивный набор ярости
SLASHER.AngerChaseGain = 0.001 -- Набор ярости в погоне
-- Balancement Vars
SLASHER.BasePunchDamage = 30


function SLASHER.OnBalanceForPlayers(totalSurvivors, additionalSurvivors) -- SERVER
	-- если игроков > 7 additionalSurvivors
	local SO = SlashCo.CurRound.OfferingData.Singularity

	SLASHER.BasePunchDamage = 30 + (SO * 20) + (1.5 * additionalSurvivors)
	SLASHER.ChaseDuration = 12.0 + (1 * additionalSurvivors)

	if additionalSurvivors > 0 then
		SLASHER.ProwlSpeed = 150 + (3 * additionalSurvivors)
		SLASHER.ChaseSpeed = 290 + (0.5 * additionalSurvivors)
	end
end
function SLASHER.OnSpawn(slasher) --SERVER
	slasher:SetViewOffset(Vector(0, 0, 85)) --Поменять
	slasher:SetCurrentViewOffset(Vector(0, 0, 85))
	slasher:SetNWBool("CanChase", true)
	slasher:SetNWBool("CanMute", true  )
	slasher:SetModelScale(0.8)

	slasher.TimeChasing = 0
	slasher.PunchCooldown = 0
	slasher.LastAngerBetter = 0
	slasher.hulk_in_mute = false
	slasher.PunchDamage = SLASHER.BasePunchDamage
end

local function PlayBreath(slasher)
	if !slasher.hulk_in_mute then		
		SlashCo.AudioSystem.StopSound("HulkChaseBreath", 0.5, slasher)
		SlashCo.AudioSystem.PlaySound({
			soundPath = "slashco/slasher/hulk/breath.wav",
			identifier = "HulkBreathBase",
			minDistance = 200 * SlashCo.MapSize,
			maxDistance = 500 * SlashCo.MapSize,
			looping = true,
			entity = slasher,
			volume = 0.6,
			fadeIn = 0,
		})
	end
end

local function PlayChaseBreath(slasher)
	if !slasher.hulk_in_mute then		
		SlashCo.AudioSystem.StopSound("HulkBreathBase", 0.5, slasher)
		SlashCo.AudioSystem.PlaySound({
			soundPath = "slashco/slasher/hulk/breath_chase.wav",
			identifier = "HulkChaseBreath",
			minDistance = 200 * SlashCo.MapSize,
			maxDistance = 500 * SlashCo.MapSize,
			looping = true,
			entity = slasher,
			volume = 0.9,
			fadeIn = 0,
		})
	end
end
function SLASHER.OnTickBehaviour(slasher) -- SERVER
	local ChaseTime = slasher.TimeChasing
	local PunchCD = slasher.PunchCooldown

	if PunchCD > 0 then
		slasher.PunchCooldown = PunchCD - FrameTime()
	end

	local anger = SlashCo.GetSlasherAnger(slasher)
	

	slasher.PunchDamage = SLASHER.BasePunchDamage + 0.25*anger

	local ang_better = math.floor(anger)
	if ang_better % 25 == 0 and slasher.LastAngerBetter ~= ang_better then
		slasher.LastAngerBetter = ang_better
		
		SlashCo.AudioSystem.PlaySound({
			soundPath = "slashco/slasher/hulk/upgrade_stage.mp3",
			identifier = "HulkBetter",
			minDistance = 500,
			maxDistance = 99999999999,
			entity = slasher,
			volume = 1,
			fadeIn = 0,
		})
		timer.Simple(2.5, function()
			SlashCo.AudioSystem.PlaySound({
				soundPath = "slashco/slasher/hulk/gettinstronger.wav",
				identifier = "HulkBetterPhrase",
				minDistance = 500,
				maxDistance = 800,
				entity = slasher,
				volume = 1,
				fadeIn = 0,
			})
		end)
	end
	
	if not slasher:GetNWBool("InSlasherChaseMode") then
		slasher.ChaseSound = nil

		slasher.TimeChasing = 0
		if slasher.IdleSound == nil then
			slasher.IdleSound = true
			PlayBreath(slasher)
			print("BREATH")
		end
		slasher:SetRunSpeed(SLASHER.ProwlSpeed + 0.3*anger )
		slasher:SetWalkSpeed(SLASHER.ProwlSpeed + 0.3*anger )
	else
		slasher.IdleSound = nil

		slasher.TimeChasing = ChaseTime + FrameTime()
		if slasher.ChaseSound == nil then
			slasher.ChaseSound = true
			PlayChaseBreath(slasher)
			print("CHASE_BREATH")
		end
		
		slasher:SetRunSpeed(SLASHER.ChaseSpeed + 0.3*anger )
		slasher:SetWalkSpeed(SLASHER.ChaseSpeed + 0.3*anger )
		SlashCo.AddSlasherAnger(slasher, SLASHER.AngerChaseGain)
	end
	

	if slasher:GetNWInt("HulkAnger") ~= math.floor(anger) then
		slasher:SetNWInt("HulkAnger", math.floor(anger))
	end

	slasher:SetEyeSight(SLASHER.Eyesight)
	slasher:SetPerception(SLASHER.Perception)
end

function SLASHER.OnKillPlayer(slasher, target)
	SlashCo.AddSlasherAnger(slasher, SLASHER.AngerIncreaseForKill)
	slasher:SetNWBool("CanKill",true)
	timer.Simple(2,function()
		
	local ind = math.random(1,15)
	SlashCo.AudioSystem.PlaySound({
		soundPath = "slashco/slasher/hulk/onenemydown/onenemydown".. ind .. ".wav",
		identifier = "HulkEnemyDown" .. ind,
		minDistance = 500,
		maxDistance = 800,
		entity = slasher,
		volume = 1,
		fadeIn = 0,
	})
	end
	)
end

function SLASHER.OnPrimaryFire(slasher, target1) --SERVER
	if slasher.PunchCooldown < 0.01 then
		slasher:SetNWBool("HulkPunch", false)
		timer.Remove("HulkPunchDecay")
		slasher.PunchCooldown = 1

		timer.Simple(0.3, function()
			if not IsValid(slasher) then return end

			SlashCo.AudioSystem.PlaySound({
				soundPath = "slashco/slasher/hulk/punch_miss.wav",
				identifier = "HulkSwing",
				minDistance = 600,
				maxDistance = 800,
				entity = slasher,
				volume = 1,
				fadeIn = 0,
			})

				if false and target:GetPos():DistToSqr(slasher:GetPos()) < 10000 then
					if target:IsPlayer() and target:Team() == TEAM_SURVIVOR and target:Health() - slasher.PunchDamage <= 0 then
					slasher:Freeze(true)
					target:Freeze(true)

					target:SetEyeAngles((slasher:WorldSpaceCenter() - target:GetShootPos()):Angle())
						SlashCo.AudioSystem.PlaySound({
						soundPath = "slashco/slasher/hulk/hulk_angry/smash.wav",
						identifier = "HulkSmash",
						minDistance = 600,
						maxDistance = 800,
						entity = slasher,
						volume = 1,
						fadeIn = 0,
						})
						timer.Simple(1.0, function()
							slasher:Freeze(false)
							
							if not IsValid(target) then return end
							target:Freeze(false)
							slasher:SetNWBool("CanKill",true)
							if SlashCo.Jumpscare(slasher, target) then
							slasher:SetNWBool("CanKill",false )
								SlashCo.AudioSystem.PlaySound({
								soundPath = "slashco/slasher/hulk/smash.wav",
								identifier = "HulkSmashLOUD",
								minDistance = 500,
								maxDistance = 2000,
								entity = slasher,
								volume = 1,
								fadeIn = 0,
								})
								SlashCo.AudioSystem.PlaySound({
								soundPath = "slashco/slasher/hulk/chain_frost_impact_lf.wav",
								identifier = "HulkSmashLOUD1",
								minDistance = 2000,
								maxDistance = 99999,
								entity = slasher,
								volume = 1,
								fadeIn = 0,
								})
							end
						end)
						return
					else
			    		local dmgInfo = DamageInfo()
			    		dmgInfo:SetAttacker(slasher)
			    		dmgInfo:SetInflictor(slasher)
			    		dmgInfo:SetDamage(slasher.PunchDamage)
			    		dmgInfo:SetDamageType(DMG_SLASH)
			    		dmgInfo:SetDamagePosition(target:GetPos())
			    		dmgInfo:SetDamageForce(slasher:GetForward() * 25000) -- имитация силы удара (5 из оригинала)

			    		target:TakeDamageInfo(dmgInfo)
					end

				end
				if false and target:GetClass() == "prop_door_rotating" then
					SlashCo.BustDoor(slasher, target, 60000)
				end

			local target = slasher:TraceHullAttack(slasher:EyePos(), slasher:LocalToWorld(Vector(50, 0, 50)),
					Vector(-35, -45, -60), Vector(35, 45, 60), slasher.PunchDamage, DMG_SLASH, 5, false)

					print(slasher:EyePos())
					debugoverlay.Sphere(slasher:EyePos(), 10)
					print(target)

			if not target:IsValid() then return end

			SlashCo.BustDoor(slasher, target, 60000)
					
			if (target:IsPlayer() and target:Team() == TEAM_SURVIVOR) or target:GetClass() == "prop_ragdoll" then
				local o = Vector(0, 0, 0)

				if (target:IsPlayer() and target:Team() == TEAM_SURVIVOR) then
					o = Vector(0, 0, 50)
				end

				local vPoint = target:GetPos() + o
				local bloodfx = EffectData()
				bloodfx:SetOrigin(vPoint)
				util.Effect("BloodImpact", bloodfx)

				local idx = math.random(1, 8)
				SlashCo.AudioSystem.PlaySound({
					soundPath = "slashco/slasher/hulk/punch/punch" .. idx .. ".wav",
					identifier = "SurvivorHitHulk" .. idx,
					minDistance = 600,
					maxDistance = 800,
					entity = target,
					volume = 1,
					fadeIn = 0,
				})
				SlashCo.AddSlasherAnger(slasher, SLASHER.AngerIncrease)
			end

		end)

		timer.Simple(0.05, function()
			if not IsValid(slasher) then return end

			slasher:SetNWBool("HulkPunch", true)

			timer.Create("HulkPunchDecay", 1.5, 1, function()
				if not IsValid(slasher) then return end

				slasher:SetNWBool("HulkPunch", false)
			end)
		end)
	end
end

function SLASHER.OnSecondaryFire(slasher) --SERVER
	timer.Simple(3.0, function()
		if !IsValid(slasher) then return end
		SlashCo.AudioSystem.PlaySound({
			soundPath = "slashco/slasher/hulk/roar.wav",
			identifier = "HulkRoar",
			minDistance = 600,
			maxDistance = 800,
			entity = target,
			volume = 1,
			fadeIn = 0,
		})
	end)
	
	SlashCo.StartChaseMode(slasher)
end
function SLASHER.OnMainAbilityFire(slasher) -- SERVER
	if slasher:GetNWBool("CanMute") then
		slasher:SetNWBool("CanMute", false )
		slasher.hulk_in_mute = true
		SlashCo.AudioSystem.StopSound("HulkBreathBase", 0, slasher)
		SlashCo.AudioSystem.StopSound("HulkChaseBreath", 0, slasher)

		timer.Create("HulkUnMute", 30, 1, function()
			if not IsValid(slasher) then return end

			slasher.hulk_in_mute = false
			if slasher:GetNWBool("InSlasherChaseMode") then
				PlayChaseBreath(slasher)
			else
				PlayBreath(slasher)
			end
		end)
		timer.Simple(120,function()
			if not IsValid(slasher) then return end
			slasher:SetNWBool("CanMute", true)
		end)
	end
end

function SLASHER.OnHitByPocketSand(slasher, ply) -- SERVER
	SlashCo.StopChase(slasher)

	slasher:SetNWBool("HulkStunned", true)
	local idx = math.random(1, 26)
	SlashCo.AudioSystem.PlaySound({
		soundPath = "slashco/slasher/hulk/hits/hit" .. idx .. ".wav",
		identifier = "HulkGetHit" .. idx,
		minDistance = 600,
		maxDistance = 800,
		entity = target,
		volume = 1,
		fadeIn = 0,
	})
	slasher:Freeze(true)
	timer.Simple(5, function()
		if not IsValid(slasher) then return end

		local idx = math.random(1, 14)
		SlashCo.AudioSystem.PlaySound({
			soundPath = "slashco/slasher/hulk/hulk_angry/alert" .. idx .. ".wav",
			identifier = "HulkUnstun" .. idx,
			minDistance = 600,
			maxDistance = 800,
			entity = target,
			volume = 1,
			fadeIn = 0,
		})
		slasher:SetNWBool("HulkStunned", false)
		slasher:Freeze(false)
	end)
end
SLASHER.OnHitByBeerKeg = SLASHER.OnHitByPocketSand
SLASHER.OnHitByTeslaCoil = SLASHER.OnHitByPocketSand

function SLASHER.Animator(ply) --SHARED
	local chase = ply:GetNWBool("InSlasherChaseMode")
	local hulk_punch = ply:GetNWBool("HulkPunch")
	local hulk_stun = ply:GetNWBool("HulkStunned")

	if not hulk_punch then
		ply.anim_antispam = false
	end

	if ply:IsOnGround() then
		if ply:GetVelocity():Length() > 30 then
			if not chase then
				ply.CalcIdeal = ACT_HL2MP_WALK
				ply.CalcSeqOverride = ply:LookupSequence("Walk")
			else
				ply.CalcIdeal = ACT_HL2MP_RUN
				ply.CalcSeqOverride = ply:LookupSequence("Run")
			end
		else
			ply.CalcIdeal = ACT_HL2MP_IDLE
			ply.CalcSeqOverride = ply:LookupSequence("idle")
		end
	else
		ply.CalcSeqOverride = ply:LookupSequence("JUMP NEW LOOP")
	end

	if hulk_punch and (ply.anim_antispam == nil or ply.anim_antispam == false) then
		local PunchAnim = "Attack" .. math.random(1,8)

		ply:AddVCDSequenceToGestureSlot(1, ply:LookupSequence(PunchAnim), 0, true)
		ply.anim_antispam = true
	end

	if hulk_stun then
		ply.CalcSeqOverride = ply:LookupSequence("Big Stun")
	end

	return ply.CalcIdeal, ply.CalcSeqOverride
end

function SLASHER.Footstep(ply) --SHARED
	if SERVER and !ply.hulk_in_mute then
		local idx = math.random(1, 5)
		SlashCo.AudioSystem.PlaySound({
			soundPath = "slashco/slasher/hulk/step" .. idx .. ".wav",
			identifier = "HulkFootstep" .. idx,
			group = "SlasherFootstep",
			minDistance = 400,
			maxDistance = 1350,
			entity = ply,
			volume = 0.5,
			fadeIn = 0
		})
	end
	
	return true -- т.к. кастомный звук false - для стандартного звука
end

function SLASHER.InitHud(_, hud) --CLIENT
	hud:SetAvatar(Material("slashco/ui/icons/slasher/hulk"))
	hud:SetTitle("Hulk")

	hud:AddControl("LMB", "punch", Material("slashco/ui/icons/slasher/punch"))
	hud:ChaseAndKill(nil, true)
	hud:AddControl("R", "mute_hulk", Material("slashco/ui/icons/slasher/kick"))
	
	hud:AddMeter("anger", 100, "", nil, true)
	hud:TieMeterInt("anger", "HulkAnger")
	function hud.AlsoThink()
		local CanMute = GameData.LocalPlayer:GetNWBool("CanMute")
		hud:SetControlEnabled("R", CanMute)
		hud:SetControlVisible("R", CanMute)
	end
end

if CLIENT then
	hook.Add("SlashCo:DrawHUD", SLASHER.Name .. "_Jumpscare", function()
		if GameData.LocalPlayer:GetNWBool("SurvivorJumpscare_Hulk") == true then
			if GameData.LocalPlayer.hulk_f == nil then
				GameData.LocalPlayer.hulk_f = 0
			end
			GameData.LocalPlayer.hulk_f = GameData.LocalPlayer.hulk_f + (FrameTime() * 40)
			if GameData.LocalPlayer.hulk_f >= 2 then
				GameData.LocalPlayer.hulk_f = 0
			end

			local Overlay = Material("slashco/ui/overlays/jumpscare_hulk")
			Overlay:SetInt("$frame", math.floor(GameData.LocalPlayer.hulk_f))

			surface.SetDrawColor(255, 255, 255, 255)
			surface.SetMaterial(Overlay)
			surface.DrawTexturedRect(0, 0, ScrW(), ScrH())
		else
			GameData.LocalPlayer.hulk_f = nil
		end
	end)
end

SlashCo.RegisterSlasher(SLASHER, "Hulk")