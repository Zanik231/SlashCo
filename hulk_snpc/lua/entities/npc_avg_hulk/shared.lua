if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "drgbase_nextbot" -- DO NOT TOUCH (obviously)

-- Misc --
ENT.PrintName = "Hulk"
ENT.Category = "Avengers"
ENT.Models = {"models/Hulk_Avenger.mdl"}
ENT.Skins = {0}
ENT.ModelScale = 1
ENT.BloodColor = BLOOD_COLOR_RED
ENT.RagdollOnDeath = false

ENT.SightRange = 32000
ENT.Omniscient = true

ENT.CollisionBounds = Vector(60, 60, 160)
ENT.StepHeight = 100
ENT.VJ_IsHugeMonster = true

//ENT.OnIdleSounds

-- Weapons --
ENT.Weapons = {""}
ENT.WeaponAccuracy = 0.01

ENT.HealthRegen = 15

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)

-- Stats --
ENT.FallDamage = false

-- AI --
ENT.RangeAttackRange = 32000
ENT.MeleeAttackRange = 90

ENT.ReachEnemyRange = 80

//ENT.AvoidEnemyRange = 0
ENT.SpotDuration = 5

ENT.Factions = { "FACTION_GOOD_GUYS_DRG" }
ENT.Frightening = false
ENT.AllyDamageTolerance = 0.001
ENT.AfraidDamageTolerance = 0.02
ENT.NeutralDamageTolerance = 0.1

ENT.SpawnHealth = 25000

 

-- Movements/animations --
ENT.UseWalkframes = false

ENT.WalkSpeed = 100
ENT.RunSpeed = 800
 
ENT.CrouchSpeed = 0
ENT.CrouchWalkAnimRate = 1
ENT.CrouchIdleAnimRate = 1
ENT.IdleAnimRate = 1

 
ENT.WalkAnimation = ACT_WALK
ENT.WalkAnimRate = 1
ENT.RunAnimation = ACT_RUN
ENT.RunAnimRate = 1.5
ENT.IdleAnimation = ACT_IDLE
ENT.IdleAnimRate = 1
ENT.JumpAnimation = ACT_JUMP
ENT.JumpAnimRate = 0

ENT.OnSpawnSounds = {""}
ENT.OnIdleSounds = {""}
ENT.IdleSoundDelay = 1

 

ENT.OnDamageSounds = {""}
					
 
ENT.OnDeathSounds = {""}
ENT.OnDownedSounds = {}
ENT.Footsteps = {}

-- Climbing --
ENT.ClimbLadders = false

-- Weapons --
ENT.UseWeapons = false
ENT.DropWeaponOnDeath = false
ENT.AcceptPlayerWeapons = false

-- Detection --
ENT.EyeBone = ""
 
ENT.FollowPlayer = true  
ENT.FriendsWithAllPlayerAllies = true
ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES_FRIENDLY",
			"CLASS_GERMAN_FRIENDLY",
			"CLASS_CHINA",
			"CLASS_FRANCE",
			"CLASS_RUSSIAN_FRIENDLY"}
			
			
ENT.EyeOffset = Vector(0, 0, 0)
 
-- Possession --
ENT.PossessionEnabled = true
ENT.PossessionMovement = POSSESSION_MOVE_1DIR
ENT.PossessionViews = {
  {
    offset = Vector(-0, 0, 0),
    distance = 250
  }
}
 



 
 



ENT.PossessionBinds = {
  [IN_ATTACK] = {{
    coroutine = true,
    onkeydown = function(self)
		if self:IsOnGround() then
			if self.WB == false then
				self:PlaySequenceAndMove("attack"..math.random(1,8).."" , 1,function(self,cycle) end)	
			end
			if self.WB == true then
				if math.random(1,2) == 1 then
					self:PlaySequenceAndMove("attack"..math.random(1,6).." RAGE", 2,function(self,cycle) end)	
				else
					self:PlaySequenceAndMove("JoJo Ref", 1.7,function(self,cycle) end)
					self:PlaySequenceAndMove("JoJo Ref Last Punch", 1,function(self,cycle) end)
				 
				end
			end
		end
    end
  }},
  [IN_ATTACK2] = {{
    coroutine = true,
    onkeydown = function(self)
		if self:IsOnGround() then
			if self.WB == false then
				if math.random(1,2) == 1 then
					self:PlaySequenceAndMove("Foot Stomp", 1,function(self,cycle) end)
				else
					if math.random(1,2) == 1 then
						self:PlaySequenceAndMove("Hulk Shockwave Attack", 1,function(self,cycle) end)
					else
						self:PlaySequenceAndMove("Smash Ground", 1,function(self,cycle) end)
					end
				end
			end	
	 
 
		if self.WB == true then	
			if math.random(1,2) == 1 then
				if math.random(1,2) == 1 then
					self:PlaySequenceAndMove("Foot Stomp", 1.5,function(self,cycle) end)
				else
					self:PlaySequenceAndMove("Smash Ground RAGE", 1.5,function(self,cycle) end)			 
				end
			else
				if math.random(1,2) == 1 then
					self:PlaySequenceAndMove("JoJo Ref", 1.5,function(self,cycle) end)
					self:PlaySequenceAndMove("JoJo Ref Last Punch",1,function(self,cycle) end)
				else
					self:PlaySequenceAndMove("Brutal Strike Combo RAGE", 1.5,function(self,cycle) end)		 
				end	
			end
		end
    end
end
  }}, 
  [IN_RELOAD] = {{
    coroutine = true,
    onkeydown = function(self)
		if self:IsOnGround() then
	 
			if self:EatableENTSizeChecker(self:ExtraChecker()) != nil then
				self:PlaySequenceAndMove("Puny God", 1,function(self,cycle) end)
			elseif self:ExtraCheckerFORVEHICLE() != nil then
				self:PlaySequenceAndMove("Throwing", 1,function(self,cycle) end)
			else
				self:PlaySequenceAndMove("Smash Ground", 1,function(self,cycle) end)
			end
		end
    end
  }}, 
  [IN_JUMP] = {{
    coroutine = true,
    onkeydown = function(self)
		if self.CanJump == true then
			self.CanJump = false
			self.JumpAnimation = ACT_JUMP
			timer.Create("JumpDash"..tostring(self),.01,10,function()
				if IsValid(self) then
					self:Jump(400)
					self:SetVelocity(self:GetForward()*3000 + Vector(0,0,2650))
				end
			end)
			self:PlaySequenceAndMove("JUMP NEW START", 1,function(self,cycle) end)	
		end
    end 
  }},
  [IN_DUCK] = {{
    coroutine = true,
    onkeydown = function(self)
 
 
		if self.SwitchSpeed == false then
			self.SwitchSpeed = true
			self.RunAnimRate = 3*self:GetModelScale()
			self.RunSpeed = 1500*self:GetModelScale()
			self.MeleeAttackRange = 400*self:GetModelScale()
			self.ReachEnemyRange = 430*self:GetModelScale()
		else
			self.RunAnimRate = 1*self:GetModelScale()
			self.RunSpeed = 800*self:GetModelScale()
			self.MeleeAttackRange = 90*self:GetModelScale()
			self.ReachEnemyRange = 80*self:GetModelScale()
			self.SwitchSpeed = false
		end
		if self.WB == true then
			self.CanJump = true
		end
    end 
  }}
}

/*
if CLIENT then
	function ENT:CustomInitialize() 
		self.HulkRadiance = 0
	end

function ENT:CustomDraw()  
  
	if(self:GetSequenceName(self:GetSequence()) =="The World Breaker" && self.HulkRadiance == 0 || self:GetSkin()==1 && self.HulkRadiance == 0) then
		self.HulkRadiance = 1 
	end
	
 if self:GetModelScale() > 10 then
		self.HulkRadiance = 2
	end

 end

end
*/


if SERVER then

	function ENT:EatableENTSizeChecker(EatAble)
		if IsValid(EatAble) then
			self.enemy_BoxMin, self.enemy_BoxMax = EatAble:OBBMins(), EatAble:OBBMaxs()				
			self.enemy_SizeX = (math.abs(self.enemy_BoxMin.x)+math.abs(self.enemy_BoxMax.x))/2
			self.enemy_SizeY = (math.abs(self.enemy_BoxMin.y)+math.abs(self.enemy_BoxMax.y))/2
			self.enemy_SizeZ = (math.abs(self.enemy_BoxMin.z)+math.abs(self.enemy_BoxMax.z))/2		 
	//	if (IsValid(self:GetEnemy()) && (self.enemy_SizeX<300 && self.enemy_SizeY<300 && self.enemy_SizeZ<300) && self:GetPos():Distance(self:GetEnemy():GetPos()) < 1500) then	
	
			if IsValid(EatAble) && (self.enemy_SizeX<50 && self.enemy_SizeY<50 && self.enemy_SizeZ<120) then
				return true 
			end
			return false
		end
	end

	function ENT:ExtraChecker()
		local enemies = ents.FindInSphere( self:GetPos(), 200*self:GetModelScale()  )
		for M=1, #enemies do
			if IsValid(self) && IsValid(enemies[M]) && (enemies[M]:IsNPC() || enemies[M]:IsNextBot() || enemies[M]:IsPlayer()) && enemies[M]:GetClass() != self:GetClass() && enemies[M] != self:GetPossessor() then
				if IsValid(enemies[M]) and IsValid(self) and enemies[M]:Health() < 8000 and enemies[M]:Disposition(self) == 1 then
					if enemies[M].Base == "npc_vj_tank_base" or enemies[M].Base == "npc_vj_tankg_base" then return end
					return enemies[M]
				end
			end
		end
	end

	function ENT:ExtraCheckerFORVEHICLE()
		local enemies = ents.FindInSphere( self:GetPos(), 300*self:GetModelScale()  )
		for M=1, #enemies do
			if IsValid(self) && IsValid(enemies[M]) && ( (enemies[M]:IsNPC() and (enemies[M].Base == "npc_vj_tank_base" or enemies[M].Base == "npc_vj_tankg_base") ) or (enemies[M]:IsPlayer() and enemies[M]:InVehicle()) ) && enemies[M]:GetClass() != self:GetClass() && enemies[M] != self:GetPossessor() then
				self.GrabbedEnemy = enemies[M]
				return enemies[M]
			end
		end
	end

	function ENT:OnIdle()
		if self:IsOnGround() then
			self:AddPatrolPos(self:RandomPos(math.random(500,3000)))
			timer.Simple(math.random(1,15), function()
				if IsValid(self) then
					self:EmitSound("hulk/idle/idle"..math.random(8,10)..".wav",100,100)
				end
				if IsValid(self) and CurTime() > self.NextStopAnimationPlay	then
					self.NextStopAnimationPlay = CurTime()+3
					self:CallInCoroutine(function(self,delay)
						if delay > 0.1 then return end
						self:PlaySequenceAndMove("Smash Ground", 1,self.FaceEnemy)
					end)		 
				end
			end)
		end
	end
	  
	  function ENT:OnReachedPatrol()
		self:Wait(math.random(10, 70))
	  end

	  
function ENT:HSUD_TRANSFORM()
	if IsValid(self) then 
	 
		sound.Add( {
			name = "HulkNEWIDLE",
			channel = CHAN_STATIC,
			volume = 0.8,
			level = 100,
			pitch = 100,
			sound = {"SirianGenerator04.wav"}
		} )
 
		self:EmitSound( "HulkNEWIDLE" ) 

		ParticleEffectAttach("HULK_WB_TERRAFORM_ADD",PATTACH_POINT_FOLLOW,self,0)
		ParticleEffect("HULK_WB_TERRAFORM",self:GetPos(), Angle(0,0,0)) 

		sound.Add( {
			name = "HulkTerraformingWorld",
			channel = CHAN_STATIC,
			volume = 0.5,
			level = 0,
			pitch = 100,
			sound = {"gate.wav"}
		} )
 
		self:EmitSound( "HulkTerraformingWorld" ) 

		self.GodMode = true

		timer.Simple(500, function()
			if IsValid(self) then
				self.GodMode = false
			end
		end) 	
	 
		timer.Create("HSUD_Growth"..tostring(self),.08,200,function() 
			if IsValid(self) then
				self.scale = self.scale + 0.3
				self:SetModelScale(self.scale)

				self.rampagemod = self.rampagemod+1
				ParticleEffect("Hulk_WB_Growth",self:GetPos(), Angle(0,0,0))
				// DMG
				local TEMP_Ents = ents.FindInSphere(self:GetPos(),9000)
				for E=1, #TEMP_Ents do 
					if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
						TEMP_Ents[E]:TakeDamage( 6000*self.rampagemod, self, TEMP_Ents[E] )
					end		
				end

				local maxhp = self:GetMaxHealth()
				local actualhp = self:Health()
				self:SetHealth(self:Health()+45000) 
				  
				self.WalkAnimRate = 90*self:GetModelScale()
				self.WalkSpeed = 100*self:GetModelScale()
				self.RunAnimRate = 85*self:GetModelScale()
				self.RunSpeed = 9500*self:GetModelScale()
				self.MeleeAttackRange = 500*self:GetModelScale()
				self.ReachEnemyRange = 570*self:GetModelScale()
				self.StepHeight = 500*self:GetModelScale()
		 
			end
		end)

		self.RadEmissionInHulksWorld = 0

		timer.Create("AddHEAL2"..tostring(self),0.8,0,function() 	
			if IsValid(self) then	
				if CurTime() > self.RadEmissionInHulksWorld and IsValid(self) then
					ParticleEffect("Hulk_WB_Breath_more50_2",self:GetPos(), Angle(0,0,0)) 
			
					local TEMP_Ents = ents.FindInSphere(self:GetPos()+self:GetForward()*math.random(-5000,5000)+self:GetRight()*math.random(-5000,5000)+self:GetUp()*math.random(-5000,5000),9000)
					for E=1, #TEMP_Ents do 
						if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
							TEMP_Ents[E]:TakeDamage( 5000*self.rampagemod, self, TEMP_Ents[E] )
						end	
					end
				end

				local maxhp = self:GetMaxHealth()
				local actualhp = self:Health()
				self:SetHealth(math.Clamp(actualhp + 600*self.rampagemod,actualhp,maxhp)) 				 
			end
		end)
	 
	end
end
	
function ENT:Hulk_WB_Changings() 
	if IsValid(self) then 	
 		timer.Simple(1, function() 
		if IsValid(self) and self.WB == false then
			self.GodMode = true
			
			/*
			if GetConVarNumber("vj_npc_noidleparticle") == 0 then
				self.ExplosionLight1 = ents.Create("light_dynamic")
				self.ExplosionLight1:SetKeyValue("brightness", "2")
				self.ExplosionLight1:SetKeyValue("distance", "2500")
				self.ExplosionLight1:SetLocalPos(self:GetPos())
				self.ExplosionLight1:SetLocalAngles( self:GetAngles() )
				self.ExplosionLight1:Fire("Color", "68 216 75")
				self.ExplosionLight1:SetParent(self)
				self.ExplosionLight1:Spawn()
				self.ExplosionLight1:Activate()
				self.ExplosionLight1:Fire("TurnOn", "", 0)
				self:DeleteOnRemove(self.ExplosionLight1)
			end
			*/

			self:SetHealth(self:Health()+45000) 

			timer.Create("AddHEAL"..tostring(self),0.8,0,function() 	
				if IsValid(self) then	
					local maxhp = self:GetMaxHealth()
					local actualhp = self:Health()
					self:SetHealth(math.Clamp(actualhp + 6*self.rampagemod,actualhp,maxhp)) 				 
				end
			end)

			self:SetHealth(self:GetMaxHealth()+self.StartHP*2)
			self.WB = true
			
			self:CallInCoroutine(function(self,delay)
				if delay > 0.1 then return end
				self:PlaySequenceAndMove("The World Breaker")
			end)

			self:EmitSound("hulk/rooar.wav",120,70)
			ParticleEffect("Hulk_WB_smash",self:GetPos(), Angle(0,0,0))
			
			// DMG
			local TEMP_Ents = ents.FindInSphere(self:GetPos(),900)
			for E=1, #TEMP_Ents do 
				if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
					TEMP_Ents[E]:TakeDamage( 800*self.rampagemod, self, TEMP_Ents[E] )
				end		
			end

			ParticleEffectAttach("Hulk_green_eye_core",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("R_eye"))
			ParticleEffectAttach("Hulk_green_eye_core",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("L_eye"))
			self.rampagemod = 30
			self:SetSkin(1)

 

			timer.Create("TheWB_Groth"..tostring(self),.01,120,function() 
				if IsValid(self) then
					self.scale = self.scale + 0.04
					ParticleEffect("Hulk_WB_Growth",self:GetPos(), Angle(0,0,0))

					// DMG
					local TEMP_Ents = ents.FindInSphere(self:GetPos(),900)
					for E=1, #TEMP_Ents do 
						if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
							TEMP_Ents[E]:TakeDamage( 600*self.rampagemod, self, TEMP_Ents[E] )
						end		
					end

					local maxhp = self:GetMaxHealth()
					local actualhp = self:Health()
					self:SetHealth(self:GetMaxHealth()+self.StartHP/20) 
					self:SetModelScale(self.scale)

					self.RunAnimRate = 5*self:GetModelScale()
					self.RunSpeed = 4500*self:GetModelScale()
					self.MeleeAttackRange = 400*self:GetModelScale()
					self.ReachEnemyRange = 370*self:GetModelScale()
					self.StepHeight = 100*self:GetModelScale()
			 
				end
			end)
		end
	end)

		timer.Simple(120, function() 
			if IsValid(self) then
				self.GodMode = false
			end
		end)

	end	
end 



function ENT:OnTakeDamage(dmginfo,hitgroup )

 
	if dmginfo:GetDamageType() == DMG_CRUSH or dmginfo:GetDamageType() == 1 then 
		dmginfo:ScaleDamage(0)
	end
	

 	if self.GodMode == true then 
		dmginfo:ScaleDamage(0)
		return 
	end

	if IsValid(dmginfo:GetAttacker()) and dmginfo:GetAttacker():IsPlayer() and dmginfo:GetAttacker():InVehicle() then
		dmginfo:ScaleDamage(0.005)
	end

	if dmginfo:GetAttacker():IsPlayer() and (GetConVarNumber("ai_disable") == 0 and GetConVarNumber("ai_ignoreplayers") == 0) then
		self.BecomeEnemyCounter = self.BecomeEnemyCounter+1
		if self.BecomeEnemyCounter < self.AttackBeforeMakeHulkEnemy and CurTime() > self.NextStopAnimationPlay then
			self.NextStopAnimationPlay = CurTime()+3
			self:CallInCoroutine(function(self,delay)
				if delay > 0.1 then return end
				self:PlaySequenceAndMove("Long Stun")
			end)
		end

		if self.BecomeEnemyCounter == self.AttackBeforeMakeHulkEnemy then
			self.MakeHulkEnemyToPlayer = true 
			table.insert( self.EvilPlayersList, dmginfo:GetAttacker():Name() )
			PrintMessage( HUD_PRINTTALK, self.PrintName.." don't like "..dmginfo:GetAttacker():Name().." anymore" )
		end
	end	

	if dmginfo:GetDamageType() == DMG_RADIATION or dmginfo:GetDamageType() == 262144 then 
		local ADDHP = dmginfo:GetDamage()
		self:SetHealth(self:Health() + ADDHP/2)
		dmginfo:ScaleDamage(0)
		return 
	end

	// combine balls
	if (dmginfo:GetDamageType() == 67108865 or dmginfo:GetDamageType() == 67108864) then 
		return 0 
	end

	 
	// Pain sound
	if CurTime() > self.PainSoundDelay and dmginfo:GetDamage() > 60 then
		self.PainSoundDelay = CurTime()+1
		self:EmitSound("hulk/pain/pain"..math.random(1,26)..".wav", 100, 90, 1)
	end
 

		if self.WB == false then
			if dmginfo:GetDamage() > self:Health() then
				dmginfo:ScaleDamage(0)
				self.GodMode = true
				self:Hulk_WB_Changings() 
			end

			-------Anger Checker-------
			timer.Simple(.1, function() 
				if IsValid(self) && self.HpChecker == false then
					self.HpChecker = true
					self.CurrentHealth1 = tonumber(self:Health())

					timer.Simple(2, function() 
						if IsValid(self) && self.HpChecker == true then
							self.HpChecker = false
							self.EstimatedDamage1 = tonumber(self:Health())

							if self.CurrentHealth1-self.EstimatedDamage1 > 3000 and self.WB == false then
								self:CallInCoroutine(function(self,delay)
									if delay > 0.1 then return end
									self:PlaySequenceAndMove("Long Stun")
								end)
								timer.Simple(4, function() 
									if IsValid(self) then 
										self:Hulk_WB_Changings() 
									end 
								end)
								
							end
						end
					end)
				end
			end)
			
			---------------------------------------------------------
			
			if self:Health() < self:GetMaxHealth()/1.2 && self.rampage == 0 then

				timer.Create("ShakeOnRampage1"..tostring(self),.04,35,function()
					if IsValid(self) then
						util.ScreenShake( self:GetPos(), 1, 1, 1, 2000*self.rampagemod )
					end 
				end)  
				
				self:CallInCoroutine(function(self,delay)
					if delay > 0.1 then return end
					self:PlaySequenceAndMove("Rampage")
				end)

				self:EmitSound("hulk/rooar.wav",120,70)
				self.rampage = 1
				self.rampagemod = self.scale+1
				self:SetModelScale(self.scale)
			end
		 
			if self:Health() < self:GetMaxHealth()/2 && self.rampage == 1 then
		 
				timer.Create("ShakeOnRampage2"..tostring(self),.04,35,function()
					if IsValid(self) then
						util.ScreenShake( self:GetPos(), 3, 2, 1,  2000*self.rampagemod )
					end 
				end)
				
				self:CallInCoroutine(function(self,delay)
					if delay > 0.1 then return end
					self:PlaySequenceAndMove("Big Stun")
				end)

				self:EmitSound("hulk/rooar.wav",120,70)
				self.rampage = 2
				self.rampagemod = self.scale+2
			end
		end




		///////////////////////////////////////////////
		if self.WB == true then

			if dmginfo:GetDamage() > self:GetMaxHealth() then
				self.rampagemod = self.rampagemod+10	
				self.scale = self.scale+0.5
				self:SetHealth(self:GetMaxHealth()+20000) 
				dmginfo:ScaleDamage(0)
				
				local Enemies = ents.FindInSphere(self:GetPos(),10)
				for M=1, #Enemies do
					if IsValid(Enemies[M]) then
						if IsValid(Enemies[M]) && (Enemies[M] == self ) then
							local doactualdmg = DamageInfo()
							doactualdmg:SetDamage( self.StartHP/20 )
							doactualdmg:SetDamageType(DMG_BLAST)
							doactualdmg:SetDamagePosition(Enemies[M]:GetPos())
							Enemies[M]:TakeDamageInfo(doactualdmg)
						end
					end
				end	
			end 
		 
		 	 
			timer.Simple(.1, function() 
				if IsValid(self) && self.HpChecker == false then
					self.HpChecker = true
					self.CurrentHealth1 = tonumber(self:Health())
					timer.Simple(10, function()
						if IsValid(self) then
							if self.CurrentHealth1-self:Health() > 6000 and self.HSUD == false then
								self.HSUD = true 
								self:HSUD_TRANSFORM()
							end
						end
					end)
					timer.Simple(2, function() 
						if IsValid(self) && self.HpChecker == true then
							self.HpChecker = false
							self.EstimatedDamage1 = tonumber(self:Health())
			 
							if self.CurrentHealth1-self.EstimatedDamage1 > 5000 then
								self.GodMode = true

								timer.Simple(30, function()
									if IsValid(self) then
										self.GodMode = false
									end
								end)

							end
							if self.CurrentHealth1-self.EstimatedDamage1 > 500 then
				 				self.rampagemod = self.rampagemod+2	
								self.scale = self.scale+0.5
								self:SetHealth(self:Health()+self.StartHP/20) 
				
								local TEMP_Ents = ents.FindInSphere(self:GetPos(),10000)
								for E=1, #TEMP_Ents do 
									if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) then
						 				TEMP_Ents[E]:SetVelocity( self:GetForward() * 5000 +self:GetUp() * 200)
									end
								end
							end
						end
					end)
 				end
			end)
		end	 
 


	if self.WB == false then
		// Stun
		if dmginfo:GetDamage() > 850 then
			local stunanim = math.random(1,2)
			if stunanim == 1 then
				self:CallInCoroutine(function(self,delay)
					if delay > 0.1 then return end
					self:PlaySequenceAndMove("Long Stun")
				end)
			end
			if stunanim == 2 then
				self:CallInCoroutine(function(self,delay)
					if delay > 0.1 then return end
					self:PlaySequenceAndMove("Stun1")
				end)
			end
		end
	end	


end

function ENT:KeyValue(KEY,VALUE)
 
	if(KEY=="VAR_isInstantWB") then
		self.VAR_isInstantWB = VALUE
	end
end


 

function ENT:CustomInitialize()
	 
	self:GetPhysicsObject():SetMass(800)
	
	timer.Create("IdleSounds"..tostring(self),15,0,function()
		if IsValid(self) then
			sound.Add( {
				name = "IdleLoop2",
				channel = CHAN_STATIC,
				volume = 0.5,
				level = 90,
				pitch = 80,
				sound = {"hulk/heavy_breathing/breath1.wav",
				"hulk/heavy_breathing/breath2.wav",
				"hulk/heavy_breathing/breath3.wav",
				"hulk/heavy_breathing/breath4.wav",
				"hulk/heavy_breathing/breath5.wav",
				"hulk/heavy_breathing/breath6.wav"}
			} )
	 
			self:EmitSound( "IdleLoop2" ) 
		end
	end)
	
 
	
	if self.VAR_isInstantWB == "Hulk The World Breaker" then
		self:SetNoDraw(true)
		timer.Simple(1.5, function()
			if IsValid(self) then
				self:SetNoDraw(false)
			end
		end)
		
		self:SetVelocity(self:GetUp()*1000)
		self.rampagemod = 20
		self:Hulk_WB_Changings() 		 
	end

	if math.random(1,2) == 1 then

		if GetConVarNumber("ai_disabled") == 0 then
		//	self:SetNoDraw(true)
			timer.Simple(0.01, function() 
				if IsValid(self) then
					self:SetNoDraw(false)
				end
			end)

		timer.Simple(0.2, function() 
			if IsValid(self) then
				local WheelPos = Vector( 0, 0, 0 )
				local effectdata = EffectData()
				effectdata:SetOrigin( self:LocalToWorld( WheelPos ) )
				effectdata:SetScale(400) 
				util.Effect( "ThumperDust", effectdata )
				util.ScreenShake( self:GetPos(), 100, 200, 1, 1500 )
				self:EmitSound("hulk/smash.wav",100,100)
				timer.Simple(0.7, function() 
					if IsValid(self) then 
						self:EmitSound("hulk/roar.wav",120,70) 
					end 
				end)
			end 
		end)
	end	
		self:CallInCoroutine(function(self,delay)
			if delay > 0.1 then return end
			self:PlaySequenceAndMove("Spawn")
		end)
	else
		self:EmitSound("hulk/hulk wants rematch.wav",120,78)
	end
	
	self:SetDefaultRelationship(D_HT)
	self.StartHP = self:GetMaxHealth()
	
	self:SetAttack("Hulk Shockwave Attack", true)	
	self:SetAttack("Smash Ground", true)	 		
	self:SetAttack("attack1", true)	 		
	self:SetAttack("attack2", true)	
	self:SetAttack("attack3", true)		 		
	self:SetAttack("attack4", true)	
	self:SetAttack("attack5", true)	
	self:SetAttack("attack6", true)
	self:SetAttack("attack7", true)
	self:SetAttack("Brutal Strike", true)
	self:SetAttack("Head Punch", true)
	self:SetAttack("Foot Stomp", true)
	self:SetAttack("Hulk Combo 1", true)
	self:SetAttack("Big Punch Combo", true)
	self:SetAttack("attack8", true)
	self:SetAttack("Brutal Strike Combo", true)	
	self:SetAttack("Double Punch", true)		
	 
	self.WB = false

	self.SwitchSpeed = false

	self.CanJump = true
	self.CanUseAlertSound = true
	self.AbsorptionBonus = 0 
	self.AnimationBoost = 0
	self.VictoryAct = true
	self.PainSoundDelay = 0
	
	self.CheckEnemiesDelay = 0

	self.GodMode = false

	self.RadBreath = false
	self.AnotherEffect = false

	self.LongJump = true
	self.NextLongJump = 50

	self.FlySoundDelay = 0

	self.rampage = 0
	self.scale = 1
	self.nextregen = 1
	self.rampagemod = 1
	self.IsTank = false
	self.throwingtank = false
	self.leapattack = 0
	self.dust = 0 
	self.AttackChecker = 0
	self.stomps = 0
	self.HulkRadiance = 0

	self.HpChecker = false

	// Become enemy to player
	self.MakeHulkEnemyToPlayer = false
	self.BecomeEnemyCounter = 0
	self.AttackBeforeMakeHulkEnemy = 6
	self.NextStopAnimationPlay = 0
	self.EvilPlayersList = {}

	// Damage
	self.PunchDMG = 80
	self.HeadPunchDMG = 60
	self.BrutalStrikeDMG = 90
	self.FootStepDMG = 20
	self.SmashGroundDMG = 250
	self.ShockwaveDMG = 80
	self.ShoWaveDMG30 = 400
	self.ShoWaveDMG40 = 600

	self.RegDelay = 0

	// Grab attack
	self.GrabEnt = nil
	self.fatality = false

	self.HSUD = false
	
	self.NextAlerteS = 0
	
	timer.Create("HPfixer"..tostring(self),0.5,0,function() 	
		if IsValid(self) then	
			if self:Health() > self.StartHP then
				self:SetMaxHealth(self:Health())
				if self.WB == true then
					self.rampagemod = self.rampagemod+0.01
					self:SetMaxHealth(self:GetMaxHealth()+self.StartHP*0.05)
				end
			end	
		end
	end)
	
 

	self:Relations()
 

end
 
 
 
function ENT:OnMeleeAttack(enemy)
 
	if self:GetForward():Dot((self:GetEnemy():GetPos() - self:GetPos()):GetNormalized()) > math.cos(math.rad(30)) then

		if self.rampagemod < 4 then

		// Throw tanks and cars
		if (self:GetEnemy():IsPlayer() and self:GetEnemy():InVehicle()) or (self:GetEnemy().IsVJBaseSNPC_Tank == true and self:GetEnemy().Base == "npc_vj_tank_base") and self.throwingtank == false then
			if (self:GetEnemy():IsPlayer() and self:GetEnemy():InVehicle()) then
				self.GrabbedEnemy = self:GetEnemy():GetVehicle()
				self.RunAnimRate = 3
				
				if IsValid(self.GrabbedEnemy:GetParent()) and self.GrabbedEnemy:GetParent() != nil and self.GrabbedEnemy:GetParent():GetClass() == "gmod_sent_vehicle_fphysics_base" then
					self.GrabbedEnemy = self.GrabbedEnemy:GetParent()
				end
			end

			if self:GetEnemy().IsVJBaseSNPC_Tank == true and self:GetEnemy().Base == "npc_vj_tank_base" then
				self.GrabbedEnemy = self:GetEnemy()
			end

			self:PlaySequenceAndMove("Throwing", 0.8,self.FaceEnemy)

		end

			local randattack = math.random(1,10)	
			self.RunAnimRate = 1	
			if randattack == 1 then
				self:PlaySequenceAndMove("attack"..math.random(1,8).."", 1,self.FaceEnemy)
			end	
			if randattack == 2 then
				if math.random(1,2) == 1 then
					self:PlaySequenceAndMove("Head Punch", 1,self.FaceEnemy)
				else
					self:PlaySequenceAndMove("attack"..math.random(1,8).."", 1,self.FaceEnemy)
				end
			end	
			if randattack == 3 then
				if math.random(1,2) == 1 then
					self:PlaySequenceAndMove("Brutal Strike", 1,self.FaceEnemy)
				else
					self:PlaySequenceAndMove("attack"..math.random(1,8).."", 1,self.FaceEnemy)
				end
			end	
			if randattack == 4 then
				if math.random(1,2) == 1 then
					self:PlaySequenceAndMove("Smash Ground", 1,self.FaceEnemy)
				else
					self:PlaySequenceAndMove("attack"..math.random(1,8).."", 1,self.FaceEnemy)
				end
			end	
			if randattack == 5 then
				self:PlaySequenceAndMove("Double Punch", 1,self.FaceEnemy)
			end	
			if randattack == 6 then
				self:PlaySequenceAndMove("Brutal Strike Combo", 1,self.FaceEnemy)
			end	
			if randattack == 7 then
				self:PlaySequenceAndMove("Hulk Combo 1", 1,self.FaceEnemy)
			end
			if randattack == 8 then
				self:PlaySequenceAndMove("Foot Stomp", 1,self.FaceEnemy)
			end	
			if randattack == 9 then
				self:PlaySequenceAndMove("Hulk Shockwave Attack", 1,self.FaceEnemy)
			end		
			if randattack == 10 then
				if self.fatality == false and util.IsValidRagdoll( self:GetEnemy():GetModel() ) and IsValid(self) and IsValid(self:GetEnemy()) then
					if IsValid(self) and IsValid(self:GetEnemy()) then
						local EnemyDistance = self:GetPos():Distance(self:GetEnemy():GetPos())
						local TEMP_Ents = ents.FindInSphere(self:GetPos(),200)
						for E=1, #TEMP_Ents do	
							if IsValid(TEMP_Ents[E]) and (TEMP_Ents[E]:IsNPC() and TEMP_Ents[E].Base != "npc_vj_tank_base") or TEMP_Ents[E]:IsNextBot() or (TEMP_Ents[E]:IsPlayer() and !TEMP_Ents[E]:HasGodMode())  then			
								local TEMP_BoxMin, TEMP_BoxMax = TEMP_Ents[E]:OBBMins(), TEMP_Ents[E]:OBBMaxs()
								local TEMP_SizeX = (math.abs(TEMP_BoxMin.x)+math.abs(TEMP_BoxMax.x))/2
								local TEMP_SizeY = (math.abs(TEMP_BoxMin.y)+math.abs(TEMP_BoxMax.y))/2
								local TEMP_SizeZ = (math.abs(TEMP_BoxMin.z)+math.abs(TEMP_BoxMax.z))/2
				
								if IsValid(self) and IsValid(self:GetEnemy()) and EnemyDistance < 150 && self:GetEnemy():Health() < 8000*self.rampagemod && TEMP_SizeX<65&&TEMP_SizeY<65&&TEMP_SizeZ<120 then  
									self.fatality = true
									self:PlaySequenceAndMove("Puny God", 1,self.FaceEnemy)
 
								end
							end
						end
					end
				end
			end
		end	
	end	


 
	if self.rampagemod > 4 then
		local randattack = math.random(1,10)	
		self.RunAnimRate = 1	
		if randattack == 1 then
			self:PlaySequenceAndMove("attack"..math.random(1,6).." RAGE", 2,self.FaceEnemy)
		end	
		if randattack == 2 then
			if math.random(1,2) == 1 then
				self:PlaySequenceAndMove("JoJo Ref", 1.7,self.FaceEnemy)
				self:PlaySequenceAndMove("JoJo Ref Last Punch", 1,self.FaceEnemy)
			else
				self:PlaySequenceAndMove("attack"..math.random(1,6).." RAGE", 2,self.FaceEnemy)
			end
		end	 
		if randattack == 3 then
			if math.random(1,2) == 1 then
				self:PlaySequenceAndMove("Brutal Strike Combo RAGE", 2,self.FaceEnemy)
			else
				self:PlaySequenceAndMove("attack"..math.random(1,6).." RAGE", 2,self.FaceEnemy)
			end
		end	
		if randattack == 4 then
			if math.random(1,2) == 1 then
				self:PlaySequenceAndMove("Smash Ground RAGE", 2,self.FaceEnemy)
			else
				self:PlaySequenceAndMove("attack"..math.random(1,6).." RAGE", 2,self.FaceEnemy)
			end
		end	
		if randattack == 5 then
			self:PlaySequenceAndMove("Double Punch RAGE", 2,self.FaceEnemy)
		end	
		if randattack == 6 then
			self:PlaySequenceAndMove("Foot Stomp", 1.5,self.FaceEnemy)
		end	
		if randattack == 7 then
			self:PlaySequenceAndMove("Double Punch RAGE", 2,self.FaceEnemy)
		end
		if randattack == 8 then
			self:PlaySequenceAndMove("JoJo Ref", 2,self.FaceEnemy)
			self:PlaySequenceAndMove("JoJo Ref Last Punch", 1,self.FaceEnemy)
		end	
		if randattack == 9 then
			self:PlaySequenceAndMove("Hulk Shockwave Attack", 1.6,self.FaceEnemy)
		end		
		if randattack == 10 then
			if self.fatality == false then
				if IsValid(self) and IsValid(self:GetEnemy()) then
					local EnemyDistance = self:GetPos():Distance(self:GetEnemy():GetPos())
					local TEMP_Ents = ents.FindInSphere(self:GetPos(),200)
					for E=1, #TEMP_Ents do	
						if IsValid(TEMP_Ents[E]) then			
							local TEMP_BoxMin, TEMP_BoxMax = TEMP_Ents[E]:OBBMins(), TEMP_Ents[E]:OBBMaxs()
							local TEMP_SizeX = (math.abs(TEMP_BoxMin.x)+math.abs(TEMP_BoxMax.x))/2
							local TEMP_SizeY = (math.abs(TEMP_BoxMin.y)+math.abs(TEMP_BoxMax.y))/2
							local TEMP_SizeZ = (math.abs(TEMP_BoxMin.z)+math.abs(TEMP_BoxMax.z))/2
			
							if IsValid(self) and IsValid(self:GetEnemy()) and EnemyDistance < 150 && self:GetEnemy():Health() < 8000*self.rampagemod && TEMP_SizeX<65*self:GetModelScale()&&TEMP_SizeY<65*self:GetModelScale()&&TEMP_SizeZ<120*self:GetModelScale() then  
								self.fatality = true
								self:PlaySequenceAndMove("Puny God", 1,self.FaceEnemy)
							end
						end
					end
				end
			end
		end

	end

		self:OnKilledEnemyChecking()
end

function ENT:OnDeath(dmg, hitgroup) 	 
	self:EmitSound("RULK_DRG/death.wav", 100, 90, 1)

	self:StopSound( "HulkNEWIDLE" ) 
	self:StopSound( "HulkTerraformingWorld" ) 
	self:StopSound( "Hulk_Victory" )
	self:StopSound( "Hulk_Alert" )
	self:StopSound( "Hulk_Step" )
	self:StopSound( "HulkBeforeSmash" )
	self:StopSound( "Hulk_PreAttack" )
	self:StopSound( "Hulk_LASTP" )	
	self:StopSound( "Hulk_Smash" )
	self:StopSound( "Hulk_BeforeThrow" )	
	self:StopSound( "Hulk_Throw" )

	timer.Remove("JumpDash"..tostring(self))
	timer.Remove("TankGrabbing"..tostring(self))
	timer.Remove("DollManipulate"..tostring(self))
	timer.Remove("HSUD_Growth"..tostring(self))
	timer.Remove("AddHEAL2"..tostring(self))
	timer.Remove("AddHEAL"..tostring(self))
	timer.Remove("TheWB_Groth"..tostring(self))
	timer.Remove("ShakeOnRampage1"..tostring(self))
	timer.Remove("ShakeOnRampage2"..tostring(self))
	timer.Remove("IdleSounds"..tostring(self))
	timer.Remove("HPfixer"..tostring(self))
	self:StopParticles()
	
end

function ENT:OnRemove()
	self:StopSound( "HulkNEWIDLE" ) 
	self:StopSound( "HulkTerraformingWorld" ) 
	self:StopSound( "Hulk_Victory" )
	self:StopSound( "Hulk_Alert" )
	self:StopSound( "Hulk_Step" )
	self:StopSound( "HulkBeforeSmash" )
	self:StopSound( "Hulk_PreAttack" )
	self:StopSound( "Hulk_LASTP" )	
	self:StopSound( "Hulk_Smash" )
	self:StopSound( "Hulk_BeforeThrow" )	
	self:StopSound( "Hulk_Throw" )

	timer.Remove("JumpDash"..tostring(self))
	timer.Remove("TankGrabbing"..tostring(self))
	timer.Remove("DollManipulate"..tostring(self))
	timer.Remove("HSUD_Growth"..tostring(self))
	timer.Remove("AddHEAL2"..tostring(self))
	timer.Remove("AddHEAL"..tostring(self))
	timer.Remove("TheWB_Groth"..tostring(self))
	timer.Remove("ShakeOnRampage1"..tostring(self))
	timer.Remove("ShakeOnRampage2"..tostring(self))
	timer.Remove("IdleSounds"..tostring(self))
	timer.Remove("HPfixer"..tostring(self))
	self:StopParticles()
	
end
	

function ENT:OnRangeAttack(enemy)
	if self:GetForward():Dot((self:GetEnemy():GetPos() - self:GetPos()):GetNormalized()) > math.cos(math.rad(30)) and self:GetPos():Distance(self:GetEnemy():GetPos()) > 4000  then

	if self.LongJump == true then 
		self.LongJump = false
		self.CanJump = false
		timer.Create("JumpDash"..tostring(self),.01,10,function()
			if IsValid(self) then
				self:Jump(400)
				if self.WB == false then
					self:SetVelocity(self:GetForward()*3000 + Vector(0,0,2650))
				end
				if self.WB == true then
					self:SetVelocity(self:GetForward()*15000 + Vector(0,0,2650))
				end
			end
		end)
		self:PlaySequenceAndMove("JUMP NEW START", 1,self.FaceEnemy)
 
	end	

end	

end

 

function ENT:OnKilledEnemyChecking()
	if IsValid(self) and !IsValid(self:GetEnemy()) then
		local DeathActions = math.random(1,2)

		if DeathActions == 1 then
			timer.Simple(.75, function() 
				if IsValid(self) then
					self:EmitSound("hulk/OnEnemyDown/OnEnemyDown"..math.random(1,15)..".wav",120,82) 
				end 
			end)
		end

		if DeathActions == 2 then

			if self.VictoryAct == true and CurTime() > self.NextStopAnimationPlay then
				self:CallInCoroutine(function(self,delay)
					if delay > 0.1 then return end
					sound.Add( {
						name = "Hulk_Victory",
						channel = CHAN_STATIC,
						volume = 0.8,
						level = 90,
						pitch = 100,
						sound = {"hulk/roar.wav"}
					})
					
					self:EmitSound( "Hulk_Victory" )
					if math.random(1,2) == 1 then
						self:PlaySequenceAndMove("Victory")
					else
						self:PlaySequenceAndMove("Victory2")
					end

					self.VictoryAct = false
					timer.Simple(30, function()
						if IsValid(self) then
							self.VictoryAct = true
						end
					end)	
				end)
			end
		end
	end
end




function ENT:Relations()
	if IsValid(self) then
		// Player
		if self.MakeHulkEnemyToPlayer == false then
			for i, entP in ipairs(ents.GetAll()) do
				if IsValid(entP) and entP:IsPlayer() then
					if self.MakeHulkEnemyToPlayer == false then			 
						self:AddEntityRelationship( entP, D_LI, 100 )
					end
				end
			end
		end

		if self.MakeHulkEnemyToPlayer == true then		
			local PlayersAR = ents.FindInSphere(self:GetPos(),32000)
			for M=1,#PlayersAR do
				if IsValid(PlayersAR[M]) and PlayersAR[M]:IsPlayer() and (GetConVarNumber("ai_disable") == 0 and GetConVarNumber("ai_ignoreplayers") == 0) then
					for n=1,#self.EvilPlayersList do
						if PlayersAR[M]:Name() == self.EvilPlayersList[n] then
							self:AddEntityRelationship( PlayersAR[M], D_HT, 100 )
						end
					end	
				end
			end
		end

		// Other creatures
		for i, ent in ipairs(ents.GetAll()) do
			if IsValid(ent) and 
				( (ent:IsNPC() and ( (ent:GetClass() == "npc_citizen" or ent:GetClass() == "npc_vortigaunt" or ent:GetClass() == "npc_alyx" or ent:GetClass() == "npc_barney" or ent:GetClass() == "npc_eli" or ent:GetClass() == "npc_mossman" or ent:GetClass() == "npc_kleiner" or ent:GetClass() == "npc_magnusson" or ent:GetClass() == "npc_dog") or 
				(ent.FriendsWithAllPlayerAllies == true or ent.PlayerFriendly == true))))  then // or (ent:IsNextBot() and ent.Factions[1] != nil and ent.Factions[1] == self.Factions[1])  ) then
			 
				ent:AddEntityRelationship( ent, D_LI, 999 )		 
				self:AddEntityRelationship( ent, D_LI, 999 )

				if ent:GetEnemy() == self then
					ent:SetEnemy(nil)
				end
			end	
		
		end
	
	
		local All = ents.FindInSphere(self:GetPos(),32000)
		for k,v in pairs(All) do 
			if v.Base == "npc_vj_tank_base" or v.Base == "npc_vj_tankg_base" then return end
			if IsValid(v) and 
			(v:IsNPC() and ( (v.FriendsWithAllPlayerAllies == nil or v.FriendsWithAllPlayerAllies == false) or (v.PlayerFriendly == nil or v.PlayerFriendly == false) ) or 
			 (v:IsNextBot() and v.Factions[1] != nil and v.Factions[1] != self.Factions[1]) ) and v:GetClass() != self:GetClass() then			 
			//	v:SetEnemy(self)
				 
				v:AddEntityRelationship( self, D_HT, 998 )		 
				self:AddEntityRelationship( v, D_HT, 998 )
				self:SetEnemy(v)
			end
		end	

	end
 
end
	

function ENT:CustomThink()
	
//	print(self.rampagemod)

	if IsValid(self) and self.AnotherEffect == false and self.rampagemod > 30 then
		self.AnotherEffect = true
		ParticleEffectAttach("Hulky",PATTACH_POINT_FOLLOW,self,0)
	end
	
	if IsValid(self) && self.RadBreath == false and self.rampagemod > 50 then
		self.RadBreath = true
		ParticleEffect("Hulk_WB_Breath_more50_2",self:GetPos(), Angle(0,0,0)) 
		
		local TEMP_Ents = ents.FindInSphere(self:GetPos(),32000)
		for E=1, #TEMP_Ents do 
			if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
			 	TEMP_Ents[E]:TakeDamage( 120*self.rampagemod, self, TEMP_Ents[E] )
			end	
		end
		timer.Simple(15, function() if IsValid(self) then self.RadBreath = false end end)
	end
 
	if IsValid(self) and IsValid(self:GetEnemy()) and self:GetEnemy():IsPlayer() then
		if self:GetEnemy():GetVehicle() != NULL then
			if self:GetPos():Distance(self:GetEnemy():GetPos()) > 100 then
				self.RunAnimRate = 3*self:GetModelScale()
				self.RunSpeed = 1400*self:GetModelScale()
				self.MeleeAttackRange = 1400*self:GetModelScale()
				self.ReachEnemyRange = 1350*self:GetModelScale()
			end
			if self:GetPos():Distance(self:GetEnemy():GetPos()) < 100 then
				self.RunAnimRate = 1*self:GetModelScale()
				self.RunSpeed = 400*self:GetModelScale()
				self.MeleeAttackRange = 350*self:GetModelScale()
				self.ReachEnemyRange = 350*self:GetModelScale()
			end			
		elseif self:GetEnemy():IsPlayer() and self:GetEnemy():GetVehicle() == NULL then
			self.RunAnimRate = 1*self:GetModelScale()
			self.RunSpeed = 800*self:GetModelScale()
			self.MeleeAttackRange = 90*self:GetModelScale()
			self.ReachEnemyRange = 80*self:GetModelScale()
		end
	end


	if IsValid(self) and CurTime()>self.CheckEnemiesDelay then
		self:Relations()
		self.CheckEnemiesDelay = CurTime()+0.3
	end

	if IsValid(self) then
		self.CurrentAngle = self:GetAngles()
		if !self:IsOnGround() and CurTime() > self.FlySoundDelay then
			self:EmitSound("RULK_DRG/meteor_cast.wav", 60, 100, 1)
			self.FlySoundDelay = CurTime()+1
		end
		if IsValid(self) and CurTime() > self.RegDelay then
			self:RemoveAllDecals()
			self.RegDelay = CurTime()+0.5
			local maxhp = self:GetMaxHealth()
			local actualhp = self:Health()
			self:SetHealth(math.Clamp(actualhp + math.random(5,12)*self.rampagemod,actualhp,maxhp)) 
		end
 
 


		if self:Health() < self.StartHP/3 && self.rampagemod < 10 and self.WB == false then
			self:Hulk_WB_Changings() 
		end

		if self:Health() < 100000 and self.HSUD == false and self.WB == true and self.GodMode == false then
			self:HSUD_TRANSFORM()
			self.HSUD = true
		end
	
	if !self:IsPossessed() then
		if IsValid(self) and !IsValid(self:GetEnemy()) then
			self.CanUseAlertSound = true
		end

	if IsValid(self) and IsValid(self:GetEnemy()) and GetConVarNumber("ai_disable") == 0 and self.WB == false and CurTime() > self.NextAlerteS then
		self.EnemyPos = self:GetEnemy()
		self.NextAlerteS = CurTime()+6
		if self.CanUseAlertSound == true then
			self.CanUseAlertSound = false
			self:StopSound( "Hulk_Victory" )
			sound.Add( {
				name = "Hulk_Alert",
				channel = CHAN_STATIC,
				volume = 0.6,
				level = 90,
				pitch = 80,
				sound = {"hulk/Hulk_angry/roar.wav","hulk/Hulk_angry/smash.wav","hulk/Hulk_angry/Alert1.wav","hulk/Hulk_angry/Alert2.wav","hulk/Hulk_angry/Alert3.wav",
				"hulk/Hulk_angry/Alert4.wav","hulk/Hulk_angry/Alert5.wav","hulk/Hulk_angry/Alert6.wav","hulk/Hulk_angry/Alert7.wav","hulk/Hulk_angry/Alert8.wav",
				"hulk/Hulk_angry/Alert9.wav","hulk/Hulk_angry/Alert10.wav","hulk/Hulk_angry/Alert11.wav","hulk/Hulk_angry/Alert12.wav","hulk/Hulk_angry/Alert13.wav","hulk/Hulk_angry/Alert14.wav"}
			})
			
			self:EmitSound( "Hulk_Alert" )
		end
	end
	end

end	

end
 

function ENT:OnLandOnGround()

	timer.Remove("JumpDash"..tostring(self))
	self:CallInCoroutine(function(self,delay)
		if delay > 0.01 then return end
		self:PlaySequenceAndMove("JUMP NEW END")
		self:StepFUNC()
		self:StepFUNC()
 
		if self:IsPossessed() then
			self.LongJump = true
			self.CanJump = true
		end
		
		if self.rampagemod > 30 then
			self:EmitSound("hulk/smash.wav",100,100)	
			util.ScreenShake( self:GetPos(), 100, 200, 1, 32000 )
			sound.Add( {
				name = "HulkBlast",
				channel = CHAN_STATIC,
				volume = 0.8,
				level = 110,
				pitch = 70,
				sound = {"hulk/deafening_blast.wav"}
			})
			
			self:EmitSound( "HulkBlast" )
			ParticleEffect("HULK_WB_UNLIMITED_GR_smash_extra",self:GetPos(), Angle(0,0,0))
		
			// DMG
			local TEMP_Ents = ents.FindInSphere(self:GetPos(),8000)
			for E=1, #TEMP_Ents do 
				if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
					TEMP_Ents[E]:TakeDamage( 400*self.rampagemod, self, TEMP_Ents[E] )
				end		
			end
		end

		ParticleEffect("DRG_RULK_SMASH_GROUND",self:GetPos(),Angle(0,0,0),nil)
		timer.Simple(self.NextLongJump, function()
			if IsValid(self) then
				self.LongJump = true
				self.CanJump = true
			end
		end)
	end)

end


 



function ENT:StepFUNC()
	if IsValid(self) then
		sound.Add( {
			name = "Hulk_Step",
			channel = CHAN_STATIC,
			volume = 0.4,
			level = 90,
			pitch = 100,
			sound = {"hulk/step1.wav","hulk/step2.wav","hulk/step3.wav","hulk/step4.wav","hulk/step5.wav"}
		})
		
		self:EmitSound( "Hulk_Step" )
		util.ScreenShake( self:GetPos(), 2*self.rampagemod/2, 1*self.rampagemod/2, 1, 1800*self.rampagemod )
	end		
end



function ENT:HandleAnimEvent(a,b,c,d,e)
// print(e)
	
	if e == "ScreenShakeOnStep" then
		
	elseif e == "Step" then
		if IsValid(self) then
			self:StepFUNC()	 
		end


	elseif e == "Hulk_RStep" then
		if IsValid(self) then
			self:StepFUNC()
		end

	elseif e == "Hulk_LStep" then
		if IsValid(self) then
			self:StepFUNC()
		end
		
	elseif e == "Hulky Leap" then
		if IsValid(self) then
			util.ScreenShake( self:GetPos(), 5*self.rampagemod/2, 3*self.rampagemod/2, 1, 1800*self.rampagemod )	

			local TEMP_Ents = ents.FindInSphere(self:GetPos(),8000)
			for E=1, #TEMP_Ents do 
				if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
					TEMP_Ents[E]:TakeDamage( 120*self.rampagemod, self, TEMP_Ents[E] )
				end		
			end

			if self.rampagemod > 30 then
				util.ScreenShake( self:GetPos(), 100, 200, 1, 32000 )
				ParticleEffect("HULK_WB_UNLIMITED_GR_Smash",self:GetPos(), Angle(0,0,0))
				ParticleEffect("HULK_WB_UNLIMITED_GR_Shockwaves",self:GetPos(), Angle(0,0,0))
				ParticleEffect("HULK_WB_UNLIMITED_GR_smash_extra",self:GetPos(), Angle(0,0,0))
			
				// DMG
				local TEMP_Ents = ents.FindInSphere(self:GetPos(),8000)
				for E=1, #TEMP_Ents do 
					if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
						TEMP_Ents[E]:TakeDamage( 400*self.rampagemod, self, TEMP_Ents[E] )
					end		
				end
			end
		
			if self.rampagemod > 40 then
				util.ScreenShake( self:GetPos(), 100, 200, 1, 32000 )
				ParticleEffect("HULK_WB_UNLIMITED_GR_Smash",self:GetPos(), Angle(0,0,0))
				ParticleEffect("HULK_WB_UNLIMITED_GR_Shockwaves",self:GetPos(), Angle(0,0,0))
				ParticleEffect("HULK_WB_UNLIMITED_GR_smash_extra",self:GetPos(), Angle(0,0,0))
				ParticleEffect("Hulk_WB_Breath_more50_2",self:GetPos(), Angle(0,0,0))
 
				  sound.Add( {
					name = "HulkBlast",
					channel = CHAN_STATIC,
					volume = 0.8,
					level = 110,
					pitch = 70,
					sound = {"hulk/deafening_blast.wav"}
				})
				
				self:EmitSound( "HulkBlast" )

				// DMG
				local TEMP_Ents = ents.FindInSphere(self:GetPos(),18000)

				for E=1, #TEMP_Ents do 
					if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
						TEMP_Ents[E]:TakeDamage( 600*self.rampagemod, self, TEMP_Ents[E] )
						local TEMP_BoxMin, TEMP_BoxMax = TEMP_Ents[E]:OBBMins(), TEMP_Ents[E]:OBBMaxs()			
						local TEMP_SizeX = (math.abs(TEMP_BoxMin.x)+math.abs(TEMP_BoxMax.x))/2
						local TEMP_SizeY = (math.abs(TEMP_BoxMin.y)+math.abs(TEMP_BoxMax.y))/2
						local TEMP_SizeZ = (math.abs(TEMP_BoxMin.z)+math.abs(TEMP_BoxMax.z))/2
					
						if(	TEMP_SizeX<100*self:GetModelScale() && TEMP_SizeY<100*self:GetModelScale() && TEMP_SizeZ<100*self:GetModelScale() ) and TEMP_Ents[E]:GetClass() != 'npc_pk_lucifer' and TEMP_Ents[E]:GetClass() != "npc_drg_godzilla2014" and TEMP_Ents[E]:GetClass() != self:GetClass() then
							TEMP_Ents[E]:Fire( "Kill", "", 0.1 )
							net.Start( "NPCKilledNPC" )
							net.WriteString( TEMP_Ents[E]:GetClass() )
							net.WriteString( self:GetClass() )
							net.WriteString( self:GetClass() )
							net.Broadcast()
						end
					end
					
				end	
			end		
			self:EmitSound("hulk/smash.wav",100,100)		 
		end	

	elseif e == "Before Smash" then
		if IsValid(self) then
			sound.Add( {
				name = "HulkBeforeSmash",
				channel = CHAN_STATIC,
				volume = 0.7,
				level = 80,
				pitch = 70,
				sound = {"hulk/hits/before_smash1.wav","hulk/hits/before_smash2.wav","hulk/hits/before_smash3.wav","hulk/hits/before_smash4.wav"}
			})
			
			self:EmitSound( "HulkBeforeSmash" )
		end

	elseif e == "Before Attack" then
		if IsValid(self) then

			if self.WB == true then
				local width = 50
				local LHTRAIL = util.SpriteTrail(self, 1, Color(0,255,63,255), false, width*self.rampagemod, width*self.rampagemod, 0.08, 1/(width*self.rampagemod+width*self.rampagemod)*0.5, "VJ_Base/sprites/vj_trial1.vmt")
				local RHTRAIL = util.SpriteTrail(self, 2, Color(0,255,63,255), false, width*self.rampagemod, width*self.rampagemod, 0.08, 1/(width*self.rampagemod+width*self.rampagemod)*0.5, "VJ_Base/sprites/vj_trial1.vmt")
				timer.Simple(1.5, function() if IsValid(RHTRAIL) then LHTRAIL:Remove() RHTRAIL:Remove() width=0 end end)	
			end

			self.CanJump = true

			sound.Add( {
				name = "Hulk_PreAttack",
				channel = CHAN_STATIC,
				volume = 0.7,
				level = 80,
				pitch = 70,
				sound = {"hulk/hits/hit1.wav","hulk/hits/hit2.wav","hulk/hits/hit3.wav","hulk/hits/hit4.wav","hulk/hits/hit5.wav"}
			})
			
			self:EmitSound( "Hulk_PreAttack" )
 
		end	
	
	// Melee stuff
	elseif e == "HeadPunch" then
		if IsValid(self) then
			util.ScreenShake( self:GetPos(), 1, 1, 1, 3000 )		
			self:Attack({
			damage = self.HeadPunchDMG*self.rampagemod,
			type = bit.bor(DMG_DIRECT,DMG_CLUB),
			range=250*self:GetModelScale(),
			push=true,
			force = Vector(80, 0, 50)	 
		}, function(self, hit) 
			if (#hit > 0) then
				self:EmitSound("hulk/punch/punch"..math.random(1,8)..".wav", 120, 100, 1)		 
			else
				self:EmitSound("RULK_DRG/punch_miss.wav", 100, 100, 1)	
			end
		end)

		if self.WB == true and IsValid(self:GetEnemy()) then
			self:GetEnemy():TakeDamage( 1200, self,self:GetEnemy() )
		end

		end	

	elseif e == "Brutal Strike" then
		if IsValid(self) then
			if self.rampagemod > 50 and math.random(1,5) == 1 then
				ParticleEffect("HULK_Breath_WB_more50",self:GetPos(), Angle(0,0,0))
				self:SetHealth(self:Health()+30*self.rampagemod)
				sound.Add( {
					name = "HulkBlast",
					channel = CHAN_STATIC,
					volume = 0.8,
					level = 110,
					pitch = 70,
					sound = {"hulk/deafening_blast.wav"}
				})
				
				self:EmitSound( "HulkBlast" )
			end

			util.ScreenShake( self:GetPos(), 1, 1, 1, 3000 )		
			self:Attack({
			damage = self.BrutalStrikeDMG*self.rampagemod,
			type = bit.bor(DMG_DIRECT,DMG_CLUB),
			range=250*self:GetModelScale(),
			push=true,
			force = Vector(80, 0, 50)	 
		}, function(self, hit) 
			if (#hit > 0) then
				self:EmitSound("hulk/punch/punch"..math.random(1,8)..".wav", 120, 100, 1)		 
			else
				self:EmitSound("RULK_DRG/punch_miss.wav", 100, 100, 1)	
			end
		end)

 
		end	

	elseif e == "Punch" then
		if IsValid(self) then

			if self.rampagemod > 50 and math.random(1,10) == 1 then
				ParticleEffect("HULK_Breath_WB_more50",self:GetPos(), Angle(0,0,0))
				self:SetHealth(self:Health()+30*self.rampagemod)
			end

			util.ScreenShake( self:GetPos(), 1, 1, 1, 3000 )

			self:Attack({
			damage = self.PunchDMG*self.rampagemod,
			type = bit.bor(DMG_DIRECT,DMG_CLUB),
			range=250*self:GetModelScale(),
			push=true,
			force = Vector(80, 0, 50)	 
		}, function(self, hit) 
			if (#hit > 0) then
				self:EmitSound("hulk/punch/punch"..math.random(1,8)..".wav", 120, 100, 1)		 
			else
				self:EmitSound("RULK_DRG/punch_miss.wav", 100, 100, 1)	
			end
		end)
			
			if self.WB == true and IsValid(self:GetEnemy()) then
				self:GetEnemy():TakeDamage( 120, self,self:GetEnemy() )
			end

		end	

	elseif e == "FastP" then
		if IsValid(self) then
			if self.rampagemod > 50 and math.random(1,50) == 1 then
				ParticleEffect("HULK_Breath_WB_more50",self:GetPos(), Angle(0,0,0))
				self:SetHealth(self:Health()+30*self.rampagemod)
			end

			if self.WB == true and IsValid(self:GetEnemy()) then
				self:GetEnemy():TakeDamage( 120, self, MyEnemy )
			end

			util.ScreenShake( self:GetPos(), 1, 1, 1, 3000 )

			self:Attack({
			damage = 60*self.rampagemod,
			type = bit.bor(DMG_DIRECT,DMG_CLUB),
			range=250*self:GetModelScale(),
			push=true,
			force = Vector(10, 0, 0)	 
		}, function(self, hit) 
			if (#hit > 0) then
				self:SetHealth(self:Health()+10*self.rampagemod)
				self:EmitSound("hulk/punch/punch"..math.random(1,8)..".wav", 120, 100, 1)		 
			else
				self:EmitSound("RULK_DRG/punch_miss.wav", 100, 100, 1)	
			end
		end)
			
			if self.WB == true and IsValid(self:GetEnemy()) then
				self:GetEnemy():TakeDamage( 120, self,self:GetEnemy() )
			end

		end	

	elseif key == "LastP" then
		if IsValid(self) then
			ParticleEffect("DRG_RULK_SMASH_GROUND",self:GetPos()+self:GetForward()*50,Angle(0,0,0),nil)
			sound.Add( {
				name = "Hulk_LASTP",
				channel = CHAN_STATIC,
				volume = 1,
				level = 150,
				pitch = 80,
				sound = {"hulk/mortar_explo1.wav"}
			})
				
			self:EmitSound( "Hulk_LASTP" )
			util.ScreenShake( self:GetPos(), 5, 3, 1, 3500 )
			
			// DMG
			local enemies = ents.FindInSphere( self:GetPos(), 400*self:GetModelScale() )
			for M=1, #enemies do
				if IsValid(enemies[M]) && ( (enemies[M]:IsNPC() || enemies[M]:IsNextBot() ) and enemies[M]:GetClass() != self:GetClass() ) && self:Disposition( enemies[M] ) == 1 then //or self:Disposition( enemies[M] ) == 1 then
					enemies[M]:TakeDamage( self.SmashGroundDMG*self.rampagemod, self, self)
					if !enemies[M]:IsNPC() then
						enemies[M]:SetVelocity(self:GetUp()*800)
					end
				end	
				
				if IsValid(enemies[M]) && (enemies[M]:IsPlayer() and GetConVarNumber("ai_ignoreplayers") == 0 ) then 		
					enemies[M]:TakeDamage( 20, self, self)
				end	

			end				
		end

	 

	elseif e == "FootStomp" then
		if IsValid(self) then
			 
			ParticleEffect("DRG_RULK_SMASH_GROUND",self:GetPos()+self:GetForward()*30,Angle(0,0,0),nil)
			self:StepFUNC()	 
			util.ScreenShake( self:GetPos(), 5, 3, 1, 3500 )

			// DMG
			local enemies = ents.FindInSphere( self:GetPos(), 900*self:GetModelScale() )
			for M=1, #enemies do
				if IsValid(enemies[M]) && ( (enemies[M]:IsNPC() || enemies[M]:IsNextBot() ) and enemies[M]:GetClass() != self:GetClass() ) && self:Disposition( enemies[M] ) == 1 then //or self:Disposition( enemies[M] ) == 1 then
					enemies[M]:TakeDamage( self.FootStepDMG*self.rampagemod, self, self)
					if !enemies[M]:IsNPC() then
						enemies[M]:SetVelocity(self:GetUp()*400)
					end
				end	
				if IsValid(enemies[M]) && (enemies[M]:IsPlayer() and GetConVarNumber("ai_ignoreplayers") == 0 ) then 		
					enemies[M]:TakeDamage( 5, self, self)
				end				
			end	
		end		
 
		elseif e == "Smash Ground" then
			if IsValid(self) then 
				ParticleEffect("DRG_RULK_SMASH_GROUND",self:GetPos()+self:GetForward()*50,Angle(0,0,0),nil)
				sound.Add( {
					name = "Hulk_Smash",
					channel = CHAN_STATIC,
					volume = 0.8,
					level = 90,
					pitch = 100,
					sound = {"hulk/smash.wav"}
				})
					
				self:EmitSound( "Hulk_Smash" )
				util.ScreenShake( self:GetPos(), 5, 3, 1, 3500 )
				
				// DMG
				local enemies = ents.FindInSphere( self:GetPos(), 400*self:GetModelScale() )
				for M=1, #enemies do
					if IsValid(enemies[M]) && ( (enemies[M]:IsNPC() || enemies[M]:IsNextBot() ) and enemies[M]:GetClass() != self:GetClass() ) && self:Disposition( enemies[M] ) == 1 then //or self:Disposition( enemies[M] ) == 1 then
						enemies[M]:TakeDamage( self.SmashGroundDMG*self.rampagemod, self, self)
						if !enemies[M]:IsNPC() then
							enemies[M]:SetVelocity(self:GetUp()*800)
						end
					end	
					
					if IsValid(enemies[M]) && (enemies[M]:IsPlayer() and GetConVarNumber("ai_ignoreplayers") == 0 ) then 		
						enemies[M]:TakeDamage( 20, self, self)
					end	

				end	

				if self.rampagemod < 3 then
 
					local tr = util.TraceLine({
					 start = self:GetPos()+self:GetForward()*80,
					 endpos = self:GetPos() - Vector(0, 0, 110),
					 filter = self })
					 util.Decal("HulkSmash",tr.HitPos+tr.HitNormal,tr.HitPos-tr.HitNormal)
				 end
					
					if self.rampagemod > 3 then
					 
					local tr1 = util.TraceLine({
					 start = self:GetPos()+self:GetForward()*200,
					 endpos = self:GetPos() - Vector(0, 0, 1550),
					 filter = self })
					 util.Decal("HulkSmash2",tr1.HitPos+tr1.HitNormal,tr1.HitPos-tr1.HitNormal)
						ParticleEffect("Hulk_WB_smash",tr1.HitPos, Angle(0,0,0))
						ParticleEffect("Hulk_Shockwave",self:GetPos(), Angle(0,0,0))
						
						local TEMP_Ents = ents.FindInSphere(self:GetPos(),4000)
				
						for E=1, #TEMP_Ents do 
							if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
								 TEMP_Ents[E]:TakeDamage( 100*self.rampagemod, self, TEMP_Ents[E] )
							end
							
						end	
						
					end
					
					if self.rampagemod > 10 then
						util.ScreenShake( self:GetPos(), 100, 200, 1, 32000 )
						ParticleEffect("HULK_WB_UNLIMITED_GR_Smash",self:GetPos(), Angle(0,0,0))
						ParticleEffect("HULK_WB_UNLIMITED_GR_Shockwaves",self:GetPos(), Angle(0,0,0))
						ParticleEffect("HULK_WB_UNLIMITED_GR_smash_extra",self:GetPos(), Angle(0,0,0))
					 
						 local TEMP_Ents = ents.FindInSphere(self:GetPos(),8000)
				
						for E=1, #TEMP_Ents do 
							if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
								 TEMP_Ents[E]:TakeDamage( 400*self.rampagemod, self, TEMP_Ents[E] )
							end
							
						end
					 
					end
					
					if self.rampagemod > 20 then
						util.ScreenShake( self:GetPos(), 100, 200, 1, 32000 )
						ParticleEffect("HULK_WB_UNLIMITED_GR_Smash",self:GetPos(), Angle(0,0,0))
						ParticleEffect("HULK_WB_UNLIMITED_GR_Shockwaves",self:GetPos(), Angle(0,0,0))
						ParticleEffect("HULK_WB_UNLIMITED_GR_smash_extra",self:GetPos(), Angle(0,0,0))
						ParticleEffect("Hulk_WB_Breath_more50_2",self:GetPos(), Angle(0,0,0))
				
						sound.Add( {
							name = "HulkBlast",
							channel = CHAN_STATIC,
							volume = 0.8,
							level = 110,
							pitch = 70,
							sound = {"hulk/deafening_blast.wav"}
						})
						
						self:EmitSound( "HulkBlast" )
						 local TEMP_Ents = ents.FindInSphere(self:GetPos(),18000)
				
						for E=1, #TEMP_Ents do 
							if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
								 TEMP_Ents[E]:TakeDamage( 600*self.rampagemod, self, TEMP_Ents[E] )
								local TEMP_BoxMin, TEMP_BoxMax = TEMP_Ents[E]:OBBMins(), TEMP_Ents[E]:OBBMaxs()			
								local TEMP_SizeX = (math.abs(TEMP_BoxMin.x)+math.abs(TEMP_BoxMax.x))/2
								local TEMP_SizeY = (math.abs(TEMP_BoxMin.y)+math.abs(TEMP_BoxMax.y))/2
								local TEMP_SizeZ = (math.abs(TEMP_BoxMin.z)+math.abs(TEMP_BoxMax.z))/2
							  
								if(TEMP_SizeX<10*self:GetModelScale() || TEMP_SizeY<10*self:GetModelScale() || TEMP_SizeZ<20*self:GetModelScale()) and TEMP_Ents[E]:GetClass() != 'npc_pk_lucifer' and TEMP_Ents[E]:GetClass() != "npc_drg_godzilla2014" and TEMP_Ents[E]:GetClass() != self:GetClass() then
									TEMP_Ents[E]:Fire( "Kill", "", 0.1 )
									net.Start( "NPCKilledNPC" )
									net.WriteString( TEMP_Ents[E]:GetClass() )
									net.WriteString( self:GetClass() )
									net.WriteString( self:GetClass() )
									net.Broadcast()
								end
								
							end
							
						end
						
					end

			end		
 

	elseif e == "Shockwave_Attack" then
		if IsValid(self) then
			ParticleEffect("Hulk_Shockwave",self:GetPos(), Angle(0,0,0))
			ParticleEffect("explosion_huge_d",self:GetPos(), Angle(0,0,0))
			self:EmitSound("hulk/smash.wav",100,100)  
			util.ScreenShake( self:GetPos(), 45, 25, 1, 2000 )
			
			// DMG
			local TEMP_Ents = ents.FindInSphere(self:GetPos(),2000*self:GetModelScale() )	
			for E=1, #TEMP_Ents do 
				if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
					TEMP_Ents[E]:TakeDamage( self.ShockwaveDMG*self.rampagemod, self, TEMP_Ents[E] )
				end	
			end
			 
			
			if self.rampagemod > 30 then
				util.ScreenShake( self:GetPos(), 100, 200, 1, 32000 )
				ParticleEffect("HULK_WB_UNLIMITED_GR_Smash",self:GetPos(), Angle(0,0,0))
				ParticleEffect("HULK_WB_UNLIMITED_GR_Shockwaves",self:GetPos(), Angle(0,0,0))
				ParticleEffect("HULK_WB_UNLIMITED_GR_smash_extra",self:GetPos(), Angle(0,0,0))

				// DMG
				local TEMP_Ents = ents.FindInSphere(self:GetPos(),8000*self:GetModelScale())
				for E=1, #TEMP_Ents do 
					if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
						 TEMP_Ents[E]:TakeDamage( self.ShoWaveDMG30*self.rampagemod, self, TEMP_Ents[E] )
					end
					
				end	 
			end
			
			if self.rampagemod > 40 then
				util.ScreenShake( self:GetPos(), 100, 200, 1, 32000 )
				ParticleEffect("HULK_WB_UNLIMITED_GR_Smash",self:GetPos(), Angle(0,0,0))
				ParticleEffect("HULK_WB_UNLIMITED_GR_Shockwaves",self:GetPos(), Angle(0,0,0))
				ParticleEffect("HULK_WB_UNLIMITED_GR_smash_extra",self:GetPos(), Angle(0,0,0))
				ParticleEffect("Hulk_WB_Breath_more50_2",self:GetPos(), Angle(0,0,0))
				sound.Add( {
					name = "HulkBlast",
					channel = CHAN_STATIC,
					volume = 0.8,
					level = 110,
					pitch = 70,
					sound = {"hulk/deafening_blast.wav"}
				})
				
				self:EmitSound( "HulkBlast" )
				// DMG
				local TEMP_Ents = ents.FindInSphere(self:GetPos(),18000*self:GetModelScale())
				for E=1, #TEMP_Ents do 
					if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
						 TEMP_Ents[E]:TakeDamage( self.ShoWaveDMG40*self.rampagemod, self, TEMP_Ents[E] )
						
						local TEMP_BoxMin, TEMP_BoxMax = TEMP_Ents[E]:OBBMins(), TEMP_Ents[E]:OBBMaxs()			
						local TEMP_SizeX = (math.abs(TEMP_BoxMin.x)+math.abs(TEMP_BoxMax.x))/2
						local TEMP_SizeY = (math.abs(TEMP_BoxMin.y)+math.abs(TEMP_BoxMax.y))/2
						local TEMP_SizeZ = (math.abs(TEMP_BoxMin.z)+math.abs(TEMP_BoxMax.z))/2
					  
						if(TEMP_SizeX<100*self.rampagemod && TEMP_SizeY<100*self.rampagemod && TEMP_SizeZ<100*self.rampagemod) and TEMP_Ents[E]:GetClass() != 'npc_pk_lucifer' and TEMP_Ents[E]:GetClass() != "npc_drg_godzilla2014" and TEMP_Ents[E]:GetClass() != self:GetClass() then
							TEMP_Ents[E]:Fire( "Kill", "", 0.1 )
							net.Start( "NPCKilledNPC" )
							net.WriteString( TEMP_Ents[E]:GetClass() )
							net.WriteString( self:GetClass() )
							net.WriteString( self:GetClass() )
							net.Broadcast()
						end
					end	
				end
				
			end
		end

	elseif e == "Punch2" then
		if IsValid(self) then 
			ParticleEffect("DRG_RULK_SMASH_GROUND",self:GetPos()+self:GetForward()*50,Angle(0,0,0),nil)
			sound.Add( {
				name = "Hulk_Smash",
				channel = CHAN_STATIC,
				volume = 0.8,
				level = 90,
				pitch = 100,
				sound = {"hulk/smash.wav"}
			})
				
			self:EmitSound( "Hulk_Smash" )
			util.ScreenShake( self:GetPos(), 5, 3, 1, 3500 )
			
			// DMG
			local enemies = ents.FindInSphere( self:GetPos(), 400*self:GetModelScale() )
			for M=1, #enemies do
				if IsValid(enemies[M]) && ( (enemies[M]:IsNPC() || enemies[M]:IsNextBot() ) and enemies[M]:GetClass() != self:GetClass() ) && self:Disposition( enemies[M] ) == 1 then //or self:Disposition( enemies[M] ) == 1 then
					enemies[M]:TakeDamage( self.SmashGroundDMG*self.rampagemod, self, self)
					if !enemies[M]:IsNPC() then
						enemies[M]:SetVelocity(self:GetUp()*800)
					end
				end	
				
				if IsValid(enemies[M]) && (enemies[M]:IsPlayer() and GetConVarNumber("ai_ignoreplayers") == 0 ) then 		
					enemies[M]:TakeDamage( 20, self, self)
				end	

			end	
		end	

	elseif e == "Before Throw" then
		
		if IsValid(self) then
			sound.Add( {
				name = "Hulk_BeforeThrow",
				channel = CHAN_STATIC,
				volume = 0.7,
				level = 90,
				pitch = 80,
				sound = {"hulk/grab.wav"}
			})
				
			self:EmitSound( "Hulk_BeforeThrow" )
			//:IsVehicle()
			timer.Create("TankGrabbing"..tostring(self),.01,0,function()
				if IsValid(self) && IsValid(self.GrabbedEnemy) && self.GrabbedEnemy:GetPos():Distance(self:GetBonePosition(self:LookupBone("g_r_palm")))<400 then //&& self.GrabbedEnemy:GetParent() == NULL then
					self.throwingtank = true
				 
					self.GrabbedEnemy:SetPos(self:GetBonePosition(self:LookupBone("g_r_palm")))  
					self.GrabbedEnemy:SetVelocity(Vector(0,0,0))
					self.GrabbedEnemy:SetAngles(self.CurrentAngle)
				end
			end)	
					
		end
	
	elseif e == 'Throwing_Act' then
		if IsValid(self) then
			timer.Remove("TankGrabbing"..tostring(self))
			sound.Add( {
				name = "Hulk_Throw",
				channel = CHAN_STATIC,
				volume = 0.7,
				level = 90,
				pitch = 80,
				sound = {"hulk/throw/throw1.wav","hulk/throw/throw2.wav","hulk/throw/throw3.wav","hulk/throw/throw4.wav","hulk/throw/throw5.wav",
				"hulk/throw/throw6.wav","hulk/throw/throw7.wav","hulk/throw/throw8.wav","hulk/throw/throw9.wav","hulk/throw/throw10.wav",
				"hulk/throw/throw11.wav","hulk/throw/throw12.wav","hulk/throw/throw13.wav","hulk/throw/throw14.wav","hulk/throw/throw15.wav",
				"hulk/throw/throw16.wav","hulk/throw/throw17.wav","hulk/throw/throw18.wav","hulk/throw/throw19.wav","hulk/throw/throw20.wav",
				"hulk/throw/throw21.wav","hulk/throw/throw22.wav","hulk/throw/throw23.wav","hulk/throw/throw24.wav","hulk/throw/throw25.wav"}
			})
				
			self:EmitSound( "Hulk_Throw" )
			local phys = self.GrabbedEnemy:GetPhysicsObject()
			if IsValid(phys) then 
				self.GrabbedEnemy:SetVelocity( self:GetForward() *0 )
				local ThrowingV = (self:GetForward()*9500 + self:GetUp()*8500)
				if IsValid(self) && IsValid(phys) then
					self:SetEnemy(NULL)	
					phys:SetMass(70110)
					phys:ApplyForceCenter(ThrowingV * 17500)
					phys:SetVelocity(phys:GetVelocity())
					self:SetEnemy(NULL)
					
				end
			end
			self:SendDamage(self.GrabbedEnemy,10000)
			self.GrabbedEnemy = nil

			timer.Simple(15, function()
				if IsValid(self) then
					self.throwingtank = false
				end
			end)
		end

	elseif e == "Grab Start" then
		if IsValid(self) then
			local TEMP_Ents = ents.FindInSphere(self:GetPos(),200)
			local TEMP_CanAttack = false
			local TEMP_CanAttackEnt = self	
			local Enemies = 0
				for E=1, #TEMP_Ents do
					
				local TEMP_BoxMin, TEMP_BoxMax = TEMP_Ents[E]:OBBMins(), TEMP_Ents[E]:OBBMaxs()
				local TEMP_SizeX = (math.abs(TEMP_BoxMin.x)+math.abs(TEMP_BoxMax.x))/2
				local TEMP_SizeY = (math.abs(TEMP_BoxMin.y)+math.abs(TEMP_BoxMax.y))/2
				local TEMP_SizeZ = (math.abs(TEMP_BoxMin.z)+math.abs(TEMP_BoxMax.z))/2
						
				if (TEMP_Ents[E]:IsNPC()||TEMP_Ents[E]:IsNextBot()||TEMP_Ents[E]:IsPlayer()) && TEMP_Ents[E]:GetClass() != self:GetClass() && Enemies == 0 && TEMP_SizeX<65&&TEMP_SizeY<65&&TEMP_SizeZ<120 then
					if util.IsValidRagdoll( TEMP_Ents[E]:GetModel() ) then
						self.TEMP_Doll = ents.Create("prop_ragdoll")
						self.TEMP_Doll:SetPos(self:GetBonePosition(self:LookupBone("g_r_palm")))
						self.TEMP_Doll:SetAngles(TEMP_Ents[E]:GetAngles())
						self.TEMP_Doll:SetModel(TEMP_Ents[E]:GetModel())
						self.TEMP_Doll:Spawn()
						self.TEMP_Doll:SetCollisionGroup( COLLISION_GROUP_DEBRIS )
						self.TEMP_Doll:SetBodyGroups(TEMP_Ents[E]:GetBodyGroups())
						self.TEMP_Doll:SetSkin(TEMP_Ents[E]:GetSkin())	 

						TEMP_Ents[E]:Fire( "Kill", "", 0.1 )
						TEMP_Ents[E]:Remove()

						
						if TEMP_Ents[E]:IsPlayer() and !TEMP_Ents[E]:HasGodMode() then
							net.Start( "PlayerKilled" )
							net.WriteEntity(TEMP_Ents[E])
							net.WriteString( self:GetClass() )
							net.WriteString( self:GetClass() )
							net.Broadcast()
							self:GetEnemy():KillSilent()
						end
						
						if !TEMP_Ents[E]:IsPlayer() then
							net.Start( "NPCKilledNPC" )
							net.WriteString( TEMP_Ents[E]:GetClass() )
							net.WriteString( self:GetClass() )
							net.WriteString( self:GetClass() )
							net.Broadcast()
						end
						
					end
						
					timer.Create("DollManipulate"..tostring(self),0.001,0,function()
						if self.TEMP_Doll:GetPhysicsObject() == NULL then self.TEMP_Doll:Remove() end
						if(IsValid(self)&&IsValid(self.TEMP_Doll)) then
							self.TEMP_Doll:GetPhysicsObject():SetPos(self:GetAttachment(self:LookupAttachment("R_Hand")).Pos)
						end
					end)
				
				end								 
			end
			 

		end
	
	elseif e == "Grab Finish" then
		if(IsValid(self)&&self!=NULL&&IsValid(self.TEMP_Doll)&&self.TEMP_Doll!=NULL) then
			timer.Simple(10, function()
				if IsValid(self) then
					self.fatality = false
				end
			end)
			
			timer.Remove("DollManipulate"..tostring(self))
			if(self.TEMP_Doll:GetPos():Distance(self:GetBonePosition(self:LookupBone("g_r_palm")))<220) then
				for P=0, self.TEMP_Doll:GetPhysicsObjectCount()-1 do
					self.TEMP_Doll:GetPhysicsObjectNum(P):ApplyForceCenter(((self:GetForward()*-10)+self:GetUp()*6)*self.TEMP_Doll:GetPhysicsObjectNum(P):GetMass()*1)
				end
			end
		end	


	elseif e == "JumpBACK" then
		if IsValid(self) then
			self.CanJump = false
			
			timer.Create("JumpDash"..tostring(self),.01,10,function()
				if IsValid(self) then
					self:Jump(400)
					self:SetVelocity(self:GetForward()*-1000 + Vector(0,0,650))
				end
			end)
		end

		

	end
end


function ENT:SendDamage(ent,dmg)
	timer.Simple(math.random(1,2), function() 
		if IsValid(ent) and IsValid(self) then
			ent:TakeDamage( dmg/2, self, ent )
			util.BlastDamage(self, ent, ent:GetPos(), 500, dmg/2)
		end
	end)
end




function ENT:ClearStuck()
	return self.loco:ClearStuck()
end

function ENT:SetAcceleration(accel)
	return self.loco:SetAcceleration(accel)
end

function ENT:GetDeceleration()
	return self.loco:GetDeceleration()
end	


end


-- DO NOT TOUCH --
if SERVER then
  AddCSLuaFile("shared.lua")
end
