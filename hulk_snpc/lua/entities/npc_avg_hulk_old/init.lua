AddCSLuaFile("shared.lua")
//AddCSLuaFile("cl_init.lua")
include('shared.lua')
include('hulk_events.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/

ENT.Model = "models/Hulk_Avenger.mdl"
 
ENT.StartHealth = 20000
ENT.MovementType = VJ_MOVETYPE_GROUND
ENT.HullType = HULL_LARGE
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_AVENGER"}
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle and etc.)
ENT.BloodParticle = "blood_impact_red_01" -- Particle that the SNPC spawns when it's damaged
ENT.BloodDecal = "Blood" -- (Red = Blood) (Yellow Blood = YellowBlood) | Leave blank for none
ENT.BloodDecalRate = 1000 -- The more the number is the more chance is has to spawn | 1000 is a good number for yellow blood, for red blood 500 is good | Make the number smaller if you are using big decal like Antlion Splat, Which 5 or 10 is a really good number for this stuff

ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.FriendsWithAllPlayerAllies = true
ENT.HasWorldShakeOnMove = false
 
ENT.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.RangeGetUp = 620 -- This makes the Object get up and it helps the Object reach farther
ENT.RangeGetForward = 0 -- the width of the object spawning. Try to see what I mean.
ENT.PlayerFriendly = true
ENT.FollowPlayer = true  

ENT.MeleeAttack_DoingPropAttack = true

ENT.BecomeEnemyToPlayer = true 
ENT.BecomeEnemyToPlayerLevel = 20

//ENT.ConstantlyFaceEnemy = false
//ENT.ConstantlyFaceEnemy_IfVisible = false

ENT.VJ_IsHugeMonster = true
ENT.HasSoundTrack = true




	-- ====== Flinching Code ====== --
ENT.Flinches = 0 -- 0 = No Flinch | 1 = Flinches at any damage | 2 = Flinches only from certain damages
ENT.FlinchingChance = 14 -- chance of it flinching from 1 to x | 1 will make it always flinch
ENT.FlinchingSchedules = {} -- If self.FlinchUseACT is false the it uses this | Common: SCHED_BIG_FLINCH, SCHED_SMALL_FLINCH, SCHED_FLINCH_PHYSICS
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
//ENT.SoundTbl_FootStep = {"hulk/step1.wav","hulk/step2.wav","hulk/step3.wav","hulk/step4.wav","hulk/step5.wav"}
ENT.SoundTbl_Idle = {"hulk/idle/Idle1.wav",
"hulk/idle/Idle2.wav",
"hulk/idle/Idle3.wav",
"hulk/idle/Idle4.wav",
"hulk/idle/Idle5.wav",
"hulk/idle/Idle6.wav",
"hulk/idle/Idle7.wav",
"hulk/idle/Idle8.wav",
"hulk/idle/Idle9.wav",
"hulk/idle/Idle10.wav"}

ENT.SoundTbl_Alert = {"hulk/Hulk_angry/Alert1.wav",
"hulk/Hulk_angry/Alert2.wav",
"hulk/Hulk_angry/Alert3.wav",
"hulk/Hulk_angry/Alert4.wav",
"hulk/Hulk_angry/Alert5.wav",
"hulk/Hulk_angry/Alert6.wav",
"hulk/Hulk_angry/Alert7.wav",
"hulk/Hulk_angry/Alert8.wav",
"hulk/Hulk_angry/Alert9.wav",
"hulk/Hulk_angry/Alert10.wav",
"hulk/Hulk_angry/Alert11.wav",
"hulk/Hulk_angry/Alert12.wav",
"hulk/Hulk_angry/Alert13.wav",
"hulk/Hulk_angry/Alert14.wav"}
ENT.SoundTbl_MeleeAttack = {""}
ENT.SoundTbl_MeleeAttackMiss = {""}
ENT.SoundTbl_Pain = {""}
ENT.SoundTbl_Death = {""}
ENT.SoundTbl_SoundTrack = {"hulk/theme1.wav","hulk/theme2.wav","hulk/theme3.wav","hulk/theme4.wav"}

ENT.SoundTbl_FollowPlayer = {"hulk/Follow_Player/FPlayer1.wav"
,"hulk/Follow_Player/FPlayer2.wav"
,"hulk/Follow_Player/FPlayer3.wav"
,"hulk/Follow_Player/FPlayer4.wav"
,"hulk/Follow_Player/FPlayer5.wav"
,"hulk/Follow_Player/FPlayer6.wav"
,"hulk/Follow_Player/FPlayer7.wav"
,"hulk/Follow_Player/FPlayer8.wav"
,"hulk/Follow_Player/FPlayer9.wav"
,"hulk/Follow_Player/FPlayer10.wav"}

ENT.SoundTbl_BecomeEnemyToPlayer = {"hulk/Hulk_angry/Alert14.wav"}

ENT.IdleSoundLevel = 440
ENT.PainSoundLevel = 440
ENT.BreathSoundLevel = 440
ENT.BeforeMeleeAttackSoundLevel = 440
ENT.MeleeAttackSoundLevel = 440
ENT.ExtraMeleeAttackSoundLevel = 440
ENT.MeleeAttackMissSoundLevel = 440
ENT.DeathSoundLevel = 440

ENT.FollowPlayerPitch1 = 80
ENT.FollowPlayerPitch2 = 80
ENT.AlertSoundPitch1 = 80
ENT.AlertSoundPitch2 = 80

ENT.SoundTrackVolume = 0.4

function ENT:KeyValue(KEY,VALUE)
	if(KEY=="isInstantWB") then
		self.VAR_isInstantWB = VALUE
	end
end

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize()
	
	
	self:SetCollisionBounds(Vector(65, 65, 140), Vector(-65, -65, 0))
	self.Jump = false
	self.fatality = false
	
	self.CanFlinch = 0 
	self.Flinching = false
	
	self.AttackChecker = 0
	if math.random(1,2) == 1 then
		if GetConVarNumber("ai_disabled") == 0 then
	self:SetNoDraw(true)
	timer.Simple(0.2, function() 
		if IsValid(self) then
			self:SetNoDraw(false)
		end
	end)
		timer.Simple(0.4, function() 
		if IsValid(self) then
	local WheelPos = Vector( 0, 0, 0 )
	local effectdata = EffectData()
 	effectdata:SetOrigin( self:LocalToWorld( WheelPos ) )
	effectdata:SetScale(400) 
	util.Effect( "ThumperDust", effectdata )
	util.ScreenShake( self:GetPos(), 100, 200, 1, 1500 )
		self:EmitSound("hulk/smash.wav",100,100)
	timer.Simple(0.7, function() if IsValid(self) then self:EmitSound("hulk/roar.wav",120,70) end end)
	end end)
	 // self:VJ_ACT_PLAYACTIVITY("Spawn",true,2,true)
	end	
	else
	 self:EmitSound("hulk/hulk wants rematch.wav",120,78)
	end
	
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
	self.AnimTbl_Run = {ACT_RUN}
	
	self.HpChecker = false
	self.MaxHealth = self:GetMaxHealth()
	
	self.CreateTrail = false
	self.WB = false
	
	self.CurrentAngle = self:GetAngles()
	self.IsTank = false
	self.stomps = 0
	

	self.WTF = false
	self.Clap = false
	self.Shockwave = false
	self.RadBreath = false

	self.MAXJUMPDIST = 0	
	
	self.MeleeDist = 110
	self.RadLight = 0 
	self.SightDistance = 32000
	self.AnotherEffect = false
  
	if self.VAR_isInstantWB == "Hulk The World Breaker" then
		self:SetNoDraw(true)
		timer.Simple(1.5, function()
			if IsValid(self) then
				self:SetNoDraw(false)
			end
		end)
		
		self:SetVelocity(self:GetUp()*2000)
		self.rampagemod = 12
		self:Hulk_WB_Changings() 		 
	end
 
end

function ENT:Hulk_WB_Changings()  
	self.GodMode = true		
 	timer.Simple(1, function() 
		if IsValid(self) and self.WB == false then
			self.GodMode = true
			 
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
			 
			self:SetHealth(self:Health()+45000) 
			self:SetMaxHealth(self:GetMaxHealth()+50000)
			self:StopAttacks(true)
			self.WB = true
			self:VJ_ACT_PLAYACTIVITY("The World Breaker",true,4,false)
			self:EmitSound("hulk/rooar.wav",120,70)
			ParticleEffect("Hulk_WB_smash",self:GetPos(), Angle(0,0,0))
			util.VJ_SphereDamage(self,self,self:GetPos(),600,math.random(3,5)*self.rampagemod,bit.bor(DMG_BLAST,DMG_DIRECT,DMG_SLASH,DMG_CLUB),true,true)
			ParticleEffectAttach("Hulk_green_eye_core",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("R_eye"))
			ParticleEffectAttach("Hulk_green_eye_core",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("L_eye"))
			self.rampagemod = 10
			self:SetSkin(1)
						
			timer.Create("TheWB_Groth"..tostring(self),.07,40,function() 
				if IsValid(self) then
					self.scale = self.scale + 0.05
					ParticleEffect("Hulk_WB_Growth",self:GetPos(), Angle(0,0,0))
					util.VJ_SphereDamage(self,self,self:GetPos(),600,math.random(1,3)*self.rampagemod,bit.bor(DMG_BLAST,DMG_DIRECT,DMG_SLASH,DMG_CLUB),true,true)
					 
			 
					self:SetMaxHealth(self:GetMaxHealth()+450) 
					self:SetModelScale(self.scale)
					 
					//self:StopAttacks(false)
					self:StopAttacks(true)
				end
		end)
		end
	end)
	timer.Simple(20, function() 
		if IsValid(self) then
			self.GodMode = false
		end
	end)
end 

function ENT:CustomOnDoKilledEnemy(argent,attacker,inflictor) 
 self:SetEnemy(NULL)
 Tyrant_ClearAnimation(self)
if IsValid(self) && self.Alerted == false then
local DeathActions = math.random(1,2)

	if DeathActions == 1 then
	timer.Simple(.75, function() if IsValid(self) then
	self:EmitSound("hulk/OnEnemyDown/OnEnemyDown"..math.random(1,15)..".wav",120,82) end end)
	end

	if DeathActions == 2 then
	local dieanim = math.random(1,2)
	if dieanim == 1 then
		self:VJ_ACT_PLAYACTIVITY("Victory",true,2,false)
		self:EmitSound("hulk/roar.wav",120,70)
	end
 	if dieanim == 2 then
		self:VJ_ACT_PLAYACTIVITY("Victory2",true,1.1,false)
		self:EmitSound("hulk/roar.wav",120,70)
	end
 end
 end
end

 
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	 
	if GetConVarNumber("Hulk_The_World_Breaker") == 1 then
		
		if dmginfo:GetDamage() >= self:GetMaxHealth() and self.WB == false then	
			dmginfo:SetDamage(0) 
			self.WTF = true
			timer.Simple(0.1, function() 
				self.GodMode = true
				self:SetHealth(2000) 
			end) 
			
			timer.Simple(0.2, function() 
				self:Health(self:GetHealth()+50000) 
				self.GodMode = false
			end) 
		end
		
		if self.WB == true then
	
	 	if dmginfo:GetDamage() < self:GetMaxHealth() then
			dmginfo:ScaleDamage(0.1) 
		 
		end  
		
		if dmginfo:GetDamage() > self:GetMaxHealth() then
			self.rampagemod = self.rampagemod+2	
			self.scale = self.scale+0.5
			self:SetMaxHealth(self:GetMaxHealth()+1900) 
			dmginfo:SetDamage(dmginfo:GetDamage()*0.01*0.5)
 
		 end
		 	 
		timer.Simple(.1, function() 
		if IsValid(self) && self.HpChecker == false then
			self.HpChecker = true
			self.CurrentHealth1 = tonumber(self:Health())
		
		timer.Simple(3, function() 
		if IsValid(self) && self.HpChecker == true then
			self.HpChecker = false
			self.EstimatedDamage1 = tonumber(self:Health())
				
			if self.CurrentHealth1-self.EstimatedDamage1 > 1000 and self.WB == true then
				 self.rampagemod = self.rampagemod+2	
				self.scale = self.scale+0.5
				self:SetMaxHealth(self:GetMaxHealth()+2500) 
				self:SetHealth(self:Health()+1000) 
				
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
	end
	 
	 
	if self.WB == false then
	--------------------------------------------------------Anger Checker
		timer.Simple(.1, function() 
		if IsValid(self) && self.HpChecker == false then
			self.HpChecker = true
			self.CurrentHealth1 = tonumber(self:Health())
		
		timer.Simple(3, function() 
		if IsValid(self) && self.HpChecker == true then
			self.HpChecker = false
			self.EstimatedDamage1 = tonumber(self:Health())
	 
			if self.CurrentHealth1-self.EstimatedDamage1 > 5000 and self.WB == false then
				//self:StopAttacks(true)
				self:VJ_ACT_PLAYACTIVITY("Long Stun",true,4,false)
				timer.Simple(4, function() if IsValid(self) then self:Hulk_WB_Changings()  end end)
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
		
		self:VJ_ACT_PLAYACTIVITY("Rampage",true,1.2,false)
		self:EmitSound("hulk/rooar.wav",120,70)
		self.rampage = 1
		self.rampagemod = self.scale+1
	end
 
	if self:Health() < self:GetMaxHealth()/2 && self.rampage == 1 then
 
	 	timer.Create("ShakeOnRampage2"..tostring(self),.04,35,function()
		if IsValid(self) then
				util.ScreenShake( self:GetPos(), 3, 2, 1,  2000*self.rampagemod )
			end 
		end)
	
		self:VJ_ACT_PLAYACTIVITY("Big Stun",true,3,false)
		self:EmitSound("hulk/rooar.wav",120,70)
		self.rampage = 2
		self.rampagemod = self.scale+2
	end

	if dmginfo:GetDamage() > 0 && self.WTF == false then
		dmginfo:ScaleDamage(0.5) 
	end

	if dmginfo:GetDamage() > 0 && self.rampage == 2 && self.WTF == false then
		dmginfo:ScaleDamage(0.25) 
	end
	
	if dmginfo:GetDamage() > 0 && self.rampagemod == 10 && self.WTF == false then
		dmginfo:ScaleDamage(0.15) 
	end
	
 	if dmginfo:GetDamage() > 850 then
		local stunanim = math.random(1,2)
		if stunanim == 1 then
			self:VJ_ACT_PLAYACTIVITY("Long Stun",true,4,false) 
		end
		if stunanim == 2 then
			self:VJ_ACT_PLAYACTIVITY("Stun1",true,4,false) 
		end
	end
 
	end
 
 
 
 	if GetConVarNumber("Hulk_The_World_Breaker") == 0 then

	--------------------------------------------------------Anger Checker
		timer.Simple(.1, function() 
		if IsValid(self) && self.HpChecker == false then
			self.HpChecker = true
			self.CurrentHealth1 = tonumber(self:Health())
		
		timer.Simple(3, function() 
		if IsValid(self) && self.HpChecker == true then
			self.HpChecker = false
			self.EstimatedDamage1 = tonumber(self:Health())
	 
			if self.CurrentHealth1-self.EstimatedDamage1 > 5000 then
				//self:StopAttacks(true)
				self:VJ_ACT_PLAYACTIVITY("Long Stun",true,4,false)
				timer.Simple(4, function() if IsValid(self) then self:Hulk_WB_Changings()  end end)
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
		
		self:VJ_ACT_PLAYACTIVITY("Rampage",true,1.2,false)
		self:EmitSound("hulk/rooar.wav",120,70)
		self.rampage = 1
		self.rampagemod = self.scale+1
	end
 
	if self:Health() < self:GetMaxHealth()/2 && self.rampage == 1 then
 
	 	timer.Create("ShakeOnRampage2"..tostring(self),.04,35,function()
		if IsValid(self) then
				util.ScreenShake( self:GetPos(), 3, 2, 1,  2000*self.rampagemod )
			end 
		end)
	
		self:VJ_ACT_PLAYACTIVITY("Big Stun",true,3,false)
		self:EmitSound("hulk/rooar.wav",120,70)
		self.rampage = 2
		self.rampagemod = self.scale+2
	end

	if dmginfo:GetDamage() > 0 then
		dmginfo:ScaleDamage(0.5) 
	end

	if dmginfo:GetDamage() > 0 && self.rampage == 2 then
		dmginfo:ScaleDamage(0.25) 
	end
	
	if dmginfo:GetDamage() > 0 && self.rampagemod == 10 then
		dmginfo:ScaleDamage(0.15) 
	end
	
 	if dmginfo:GetDamage() > 850 then
		local stunanim = math.random(1,2)
		if stunanim == 1 then
			self:VJ_ACT_PLAYACTIVITY("Long Stun",true,4,false) 
		end
		if stunanim == 2 then
			self:VJ_ACT_PLAYACTIVITY("Stun1",true,4,false) 
		end
	
	end 
	end
 
 
end


 
function ENT:CustomOnThink()
		//print(self.rampagemod)
 
	
	//ParticleEffectAttach("Hulky",PATTACH_POINT_FOLLOW,self,0)
	if IsValid(self) and self.scale > 10 then
		self.MeleeDist = 1600
	 
	end
	
	 if IsValid(self) and self.scale > 5 then
		self.MeleeDist = 1000
	end
	
	if IsValid(self) and self.scale > 3 then
		self.MeleeDist = 920
 
	end
	
	if IsValid(self) and self.scale > 30 then
		self.MeleeDist = 3200
	end
	
	if IsValid(self) and self.scale > 60 then
		self.MeleeDist = 8400
	end
	
	if IsValid(self) and self.scale > 100 then
		self.MeleeDist = 12000
 
		
	end
	
	
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

	self.Clap = true
	if IsValid(self:GetEnemy()) and self:GetEnemy():Health() > self:GetEnemy():GetMaxHealth()*0.2 then   self.Clap = true end
	if IsValid(self:GetEnemy()) and self:GetEnemy():Health() <= self:GetEnemy():GetMaxHealth()*0.2 then  self.Clap = false end
	 
	self.LastPos = self:GetPos()
	

	if self:Health() < 5000 && self.rampagemod < 10 and self.WB == false then
		self:Hulk_WB_Changings() 
	end


	if IsValid(self) && self:GetSequenceName(self:GetSequence()) == "Throwing" then
		self:StopMoving()
		self.Alerted = false
	end
	
		 
	if IsValid(self) && self:GetSequenceName(self:GetSequence()) != "Throwing" then
 	if IsValid(self) && IsValid(self:GetEnemy()) then
	
	local EnemyDistance = self:VJ_GetNearestPointToEntityDistance(self:GetEnemy(),self:GetPos():Distance(self:GetEnemy():GetPos()))
	local MyEnemy = self:GetEnemy() 
	
		self.GlobalEnemyDistance = self:VJ_GetNearestPointToEntityDistance(self:GetEnemy(),self:GetPos():Distance(self:GetEnemy():GetPos()))
		if self.GlobalEnemyDistance > 6000 then
	 
			self.AnimTbl_Run = {ACT_RUN_AIM}
		end
		if self.GlobalEnemyDistance < 6000 then
			self.AnimTbl_Run = {ACT_RUN}
		end
	 end
	if IsValid(self:GetEnemy()) then
		//print(self:GetEnemy())
	end
	
	
	 	if self:GetSequenceName(self:GetSequence()) == "Hulk Middle Jumps" && IsValid(self:GetEnemy()) then
			self:SetGroundEntity(NULL)
		
			if IsValid(self) && IsValid(self:GetEnemy()) then 
				//self:SetVelocity(((self:GetEnemy():GetPos() +self:GetEnemy():OBBCenter() + self:GetEnemy():GetUp()*0 +self:GetEnemy():GetRight()*0) - self:GetPos())*1 +self:GetRight()*0 +self:GetUp()*0 +self:GetForward()*0)	
			
			end
		end
			 
			
	end
	
	
			if IsValid(self:GetEnemy()) and self.GlobalEnemyDistance < 200 && self:GetSequenceName(self:GetSequence()) == "Run" then
				Tyrant_ClearAnimation(self)	
			end
		
		if IsValid(self) and IsValid(self:GetEnemy()) then
		if self.GlobalEnemyDistance < 750 then
			self.MAXJUMPDIST = 0
		end
	
		if self.GlobalEnemyDistance > 100 && self.GlobalEnemyDistance < 32000 then
			self.MAXJUMPDIST = 32000
		end
		
		end
		 
	 	 if IsValid(self) && self.Alerted == true && self:GetSequenceName(self:GetSequence()) == "Idle1" && self.GlobalEnemyDistance < 200  && self.throwingtank == false && self:GetSequenceName(self:GetSequence()) != "Throwing" then  // add check for self.GlobalEnemyDistance
	 
	 
		 timer.Simple(0.9, function() 
			if IsValid(self) then
		
		local extraattack = math.random(1,8)
		
		if extraattack == 1 then
			// print("extra attack 1")
			self:VJ_ACT_PLAYACTIVITY("Smash Ground",false,0.8,false,0)
		end
		
		if extraattack == 2 then
			// print("extra attack 2")
			self:VJ_ACT_PLAYACTIVITY("Attack1",false,0.7,false,0)
		end
		
		if extraattack == 3 then
			// print("extra attack 3")
			self:VJ_ACT_PLAYACTIVITY("Attack2",false,0.7,false,0)
		end
		
		if extraattack == 4 then
			// print("extra attack 4")
			self:VJ_ACT_PLAYACTIVITY("Attack3",false,0.6,false,0)
		end
		
		if extraattack == 5 then
			// print("extra attack 5")
			self:VJ_ACT_PLAYACTIVITY("Attack4",false,0.6,false,0)
		end
		
		if extraattack == 6 then
			// print("extra attack 6")
			self:VJ_ACT_PLAYACTIVITY("Double Punch",false,0.6,false,0)
		end
		
		if extraattack == 7 then
			// print("extra attack 7")
			self:VJ_ACT_PLAYACTIVITY("Attack5",false,0.5,false,0)
		end
		
		if extraattack == 8 then
			// print("extra attack 8")
			self:VJ_ACT_PLAYACTIVITY("Attack6",false,0.6,false,0)
		end
		
	 	if extraattack == 9 then
			// print("extra attack 9")
	 		self:VJ_ACT_PLAYACTIVITY("JoJo Ref",false,1,false,0)
	 	end
		 end end)
	 
	 end
 
  
	if self:GetVelocity():Length() < 150 && self.Alerted == false then
 
	if IsValid(self) && math.random(1,100) == 1 then
		self:VJ_ACT_PLAYACTIVITY("Smash Ground",false,2,false,0)
	end
 
	end	
   
	if(self:HasCondition(67)) then
		self:ClearCondition(68) --68  
	end	
 
 
	

 	if IsValid(self:GetEnemy()) && self:GetEnemy().IsVJBaseSNPC_Tank == true && IsValid(self)  then 
		self.IsTank = true
	end
	
	if IsValid(self:GetEnemy()) && self:GetEnemy().IsVJBaseSNPC_Tank == false && IsValid(self)  then 
		self.IsTank = false
	end
	
	//self.IsTank = false
	
	if self.WB == true && GetConVarNumber("Hulk_The_World_Breaker") == 1 then
		self:SetModelScale(self.scale)
	end
 
	if self:Health() < self:GetMaxHealth()/1.2 && self.scale < 1.5  then
		 
		//self:VJ_ACT_PLAYACTIVITY("Rampage",true,1.2,false)
		self:SetModelScale(self.scale)
		self.scale = self.scale + 0.1
		self.rampagemod = self.scale+0.5
		self:SetMaxHealth(self:GetMaxHealth()+200) 
	end

	if self:Health() < self:GetMaxHealth()/2 && self.scale < 2.1  then --|| self:GetVelocity():Length() > 2000
 
		//self:VJ_ACT_PLAYACTIVITY("The World Breaker",true,2,false)
		self:SetModelScale(self.scale)
		self.scale = self.scale + 0.1
		self.rampagemod = self.scale+1
		self:SetMaxHealth(self:GetMaxHealth()+400) 
		
 	 if GetConVarNumber("vj_npc_noidleparticle") == 0 then
		local eyeglow1 = ents.Create("env_sprite")
		eyeglow1:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
		eyeglow1:SetKeyValue("scale","0.06")
		eyeglow1:SetKeyValue( "renderfx", "4" )
		eyeglow1:SetKeyValue("rendermode","5")
		eyeglow1:SetKeyValue( "renderamt", "255")
		eyeglow1:SetKeyValue("rendercolor","0 255 63")
		eyeglow1:SetKeyValue("spawnflags","1") -- If animated
		eyeglow1:SetParent(self)
		eyeglow1:Fire("SetParentAttachment","L_eye",0)
		eyeglow1:Spawn()
		eyeglow1:Activate()
		self:DeleteOnRemove(eyeglow1)
		
		local eyeglow2 = ents.Create("env_sprite")
		eyeglow2:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
		eyeglow2:SetKeyValue("scale","0.06")
		eyeglow2:SetKeyValue( "renderfx", "4" )
		eyeglow2:SetKeyValue("rendermode","5")
		eyeglow2:SetKeyValue( "renderamt", "255")
		eyeglow2:SetKeyValue("rendercolor","0 255 63")
		eyeglow2:SetKeyValue("spawnflags","1") -- If animated
		eyeglow2:SetParent(self)
		eyeglow2:Fire("SetParentAttachment","R_eye",0)
		eyeglow2:Spawn()
		eyeglow2:Activate()
		self:DeleteOnRemove(eyeglow2)
		
		ParticleEffectAttach("Hulk_green_eye_core",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("R_eye"))
		ParticleEffectAttach("Hulk_green_eye_core",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("L_eye"))
 
		//	util.SpriteTrail(self, 1, Color(0,255,63,255), false, 235, 235, 0.05, 1/(25+1)*10.5, "VJ_Base/sprites/vj_trial1.vmt")
		//	util.SpriteTrail(self, 2, Color(0,255,63,255), false, 235, 235, 0.05, 1/(25+1)*10.5, "VJ_Base/sprites/vj_trial1.vmt")
	 
		//ParticleEffectAttach("Hulk_WB_hands",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("L_Hand"))
		//ParticleEffectAttach("Hulk_WB_hands",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("R_Hand"))
		
		end
	end
	
	if IsValid(self) && self.rampagemod == 10 && self:GetVelocity():Length() > 2000 then
		self:SetModelScale(self.scale)
		self.scale = self.scale + 0.1
		self.rampagemod = self.scale+1
		self:SetMaxHealth(self:GetMaxHealth()+800) 
	end
 
	if self:Health() < self:GetMaxHealth() then
		timer.Simple(0.2, function() if IsValid(self) && self.nextregen == 1 then
		self.nextregen = 0
		self:RemoveAllDecals()
		local maxhp = self:GetMaxHealth()
		local actualhp = self:Health()
		self:SetHealth(math.Clamp(actualhp + math.random(5,12)*self.rampagemod,actualhp,maxhp)) 
		timer.Simple(0.1, function() if IsValid(self) && self.nextregen == 0 then
		self.nextregen = 1
		 end end)
		end
	end)
end
	
	end

	




function ENT:CustomOnDamageByPlayer(dmginfo,hitgroup) 
local randomlyanim = math.random(1,2)
if randomlyanim == 1 then
self:VJ_ACT_PLAYACTIVITY("Nope",true,1,false)
self:EmitSound("hulk/BecomeEnemy/B"..math.random(1,5)..".wav",120,85)
end
if randomlyanim == 2 then
self:VJ_ACT_PLAYACTIVITY("Wait",true,1,false)
self:EmitSound("hulk/BecomeEnemy/B"..math.random(1,5)..".wav",120,85) 
end

end

function ENT:CustomWhenBecomingEnemyTowardsPlayer(dmginfo,hitgroup) 
local becomingact = math.random(1,2)
if becomingact == 1 then
self:VJ_ACT_PLAYACTIVITY("Scream",true,1,false)
 self:EmitSound("hulk/roar.wav",120,70)
 end
 
end

function ENT:CustomOnFollowPlayer(key,activator,caller,data) 
local followanim = math.random(1,2)
if followanim == 1 then
self:VJ_ACT_PLAYACTIVITY("Agree",true,2,false)
end

if followanim == 2 then
self:VJ_ACT_PLAYACTIVITY("Salute",true,2,false)
end

end


--Custom functions for fatality
----------------------------------------------------------

function Tyrant_PlayAnimation(self,ANM,IND,RESETCYCLE)
	if(string.Replace(ANM," ","")=="") then
		Tyrant_ClearAnimation(self)
		Tyrant_StopAllTimers(self)
		return
	end
	self.PlayingAnimation = true
	self.PlayingGesture = false
	self.AttackIndex = IND
	self:ClearSchedule()
	
	self.CantChaseTargetTimes = 0
	self.MustJumpTimes = 0
	
	if(RESETCYCLE==nil||RESETCYCLE==true) then
		self:ResetSequenceInfo()
		self:SetCycle(0)
	end
	
	self.Animation = ANM
	self:StopMoving()

	self:SetNPCState(NPC_STATE_NONE)

	if(self:GetSequence()!=self:LookupSequence(self.Animation)) then
		self:SetNPCState(NPC_STATE_SCRIPT)
		self:ResetSequence(self:LookupSequence(self.Animation))
	end
end


function Tyrant_ClearAnimation(self)
	self.Animation = ""
	self.AttackIndex = 0
	
	if(self.PlayingGesture==false) then
		self:ClearSchedule()
		self:ResetSequenceInfo()
	end
	
	self:SetNPCState(NPC_STATE_COMBAT)
	self.PlayingGesture = false
	self.PlayingAnimation = false
	
	//if(GetConVar("ai_disabled"):GetInt()==1) then
	//	self:ResetSequence(self:LookupSequence(self.IdleSequence))
	//end
end
 
 
 
 
-----------------------------------------------------------------------------------------------------------------------
 
 
 
function ENT:MultipleMeleeAttacks()
 
 	self.DisableDefaultMeleeAttackCode = false
	self.DisableDefaultMeleeAttackDamageCode = false
	
	if IsValid(self) && self:GetSequenceName(self:GetSequence()) != "Throwing"  then 
		local EnemyDistance = self:VJ_GetNearestPointToEntityDistance(self:GetEnemy(),self:GetPos():Distance(self:GetEnemy():GetPos()))	
		
		/*
		if EnemyDistance > 0 && EnemyDistance < 170  then
		  
							local TEMP_Ents = ents.FindInSphere(self:GetPos(),500)
					 
							for E=1, #TEMP_Ents do
							if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) && TEMP_Ents[E]:GetClass() != self:GetClass() then
							local TEMP_BoxMin, TEMP_BoxMax = TEMP_Ents[E]:OBBMins(), TEMP_Ents[E]:OBBMaxs()
							local TEMP_SizeX = (math.abs(TEMP_BoxMin.x)+math.abs(TEMP_BoxMax.x))/2
							local TEMP_SizeY = (math.abs(TEMP_BoxMin.y)+math.abs(TEMP_BoxMax.y))/2
							local TEMP_SizeZ = (math.abs(TEMP_BoxMin.z)+math.abs(TEMP_BoxMax.z))/2
			if self.fatality == false && self:GetEnemy():Health() <= 1500*self.rampagemod  then   --self:GetEnemy():GetMaxHealth()*0.2
	 
			if TEMP_SizeX<65 && TEMP_SizeY<65 && TEMP_SizeZ<65 and math.random(1,30) == 1 then   
			
			//	self.Clap = true
			self.TimeUntilMeleeAttackDamage = false	
			self.MeleeAttackDistance = 170*self.rampagemod 
			self.NextMeleeAttackTime = 0.01
			Tyrant_PlayAnimation(self,"Hulk Clap",6)
			self.NextMeleeAttackTime = 6
			end
			end
		end	
	end
	end
	 */
 
	
	
		local MyEnemy = self:GetEnemy()
		if EnemyDistance < 150 && self.IsTank == true && self.throwingtank == false && math.random(1,4) == 1 then 
			//self.TimeUntilMeleeAttackDamage = false
			self.CurrentEnemy = self:GetEnemy()
			self.CurrentAngle = self:GetAngles()
			//Tyrant_ClearAnimation(self)
			//self.DisableDefaultMeleeAttackCode = true
			//self.DisableDefaultMeleeAttackDamageCode = true
			 
			Tyrant_PlayAnimation(self,"Throwing",3)
			self.NextMeleeAttackTime = 3
			
		end

		
	if EnemyDistance > 0 && EnemyDistance < 60 && self.fatality == false && self.rampagemod < 4 then
	 
			self.TimeUntilMeleeAttackDamage = false
			self.MeleeAttackDistance = 80 
			self.AnimTbl_MeleeAttack = {"Hulk Shockwave Attack","Smash Ground", "attack1", "attack2", "attack3", "attack4", "attack5", "attack6", "attack7", "Brutal Strike", "Head Punch", "Foot Stomp", "Hulk Combo 1", "Big Punch Combo", "attack8", "Brutal Strike Combo", "Double Punch"}  
			//self:SetAngles(self.CurrentAngle)
			self.NextMeleeAttackTime = 0.01
		end
	
	if EnemyDistance > 0 && EnemyDistance < 250 && self.fatality == false && self.rampagemod > 4 then
 
			self.TimeUntilMeleeAttackDamage = false
			self.MeleeAttackDistance = 250
			self.AnimTbl_MeleeAttack = {"Hulk Shockwave Attack","Smash Ground RAGE", "JoJo Ref","attack1 RAGE", "attack2 RAGE", "attack3 RAGE","JoJo Ref", "attack4 RAGE", "attack5 RAGE", "JoJo Ref","attack6 RAGE", "attack7 RAGE", "Brutal Strike RAGE","JoJo Ref", "Head Punch", "Foot Stomp", "Hulk Combo RAGE", "Big Punch Combo RAGE", "attack8 RAGE", "Brutal Strike Combo RAGE", "JoJo Ref","Double Punch RAGE"}
			//self:SetAngles(self.CurrentAngle)
			self.NextMeleeAttackTime = 0.01
		end
		
		if EnemyDistance > 0 && EnemyDistance < self.MeleeDist  && self.fatality == false && self.rampagemod > 4 && self.WB == true then
		 
			self.TimeUntilMeleeAttackDamage = false
			self.MeleeAttackDistance = self.MeleeDist
			self.AnimTbl_MeleeAttack = {"Hulk Shockwave Attack","Smash Ground RAGE", "JoJo Ref","attack1 RAGE", "attack2 RAGE", "attack3 RAGE","JoJo Ref", "attack4 RAGE", "attack5 RAGE", "JoJo Ref","attack6 RAGE", "attack7 RAGE", "Brutal Strike RAGE","JoJo Ref", "Head Punch", "Foot Stomp", "Hulk Combo RAGE", "Big Punch Combo RAGE", "attack8 RAGE", "Brutal Strike Combo RAGE", "JoJo Ref","Double Punch RAGE"}
			//self:SetAngles(self.CurrentAngle)
			self.NextMeleeAttackTime = 0.01
		end 


	if self.MAXJUMPDIST != 0 && self.fatality == false && self.Jump == false && EnemyDistance > 1000 && math.random(1,50) == 1 then
		 
			self.TimeUntilMeleeAttackDamage = false
			self.MeleeAttackDistance = self.MAXJUMPDIST --1360*self.rampagemod 
			self.AnimTbl_MeleeAttack = {"Hulk Middle Jumps"}
			self.Jump = true
			self:SetGroundEntity(NULL)
			self.NextMeleeAttackTime = math.random(1,3)
			timer.Simple(5, function() 
			if IsValid(self) && self.Jump == true then
				self.Jump = false
				end 
			end)
			
		end  
	 

	local EnemyDistance = self:VJ_GetNearestPointToEntityDistance(self:GetEnemy(),self:GetPos():Distance(self:GetEnemy():GetPos()))	
	
	
							local TEMP_Ents = ents.FindInSphere(self:GetPos(),200)
							local TEMP_CanAttack = false
							local TEMP_CanAttackEnt = self	
							local Enemies = 0
							for E=1, #TEMP_Ents do
							
							local TEMP_BoxMin, TEMP_BoxMax = TEMP_Ents[E]:OBBMins(), TEMP_Ents[E]:OBBMaxs()
							local TEMP_SizeX = (math.abs(TEMP_BoxMin.x)+math.abs(TEMP_BoxMax.x))/2
							local TEMP_SizeY = (math.abs(TEMP_BoxMin.y)+math.abs(TEMP_BoxMax.y))/2
							local TEMP_SizeZ = (math.abs(TEMP_BoxMin.z)+math.abs(TEMP_BoxMax.z))/2
	
	
						
							
	if EnemyDistance < 100 && self:GetEnemy():Health() < 5000*self.rampagemod && math.random(1,15) == 1 && TEMP_SizeX<65&&TEMP_SizeY<65&&TEMP_SizeZ<65 then 
	
			self.fatality = true
			
			if self.fatality == true && util.IsValidRagdoll(self:GetEnemy():GetModel()) then
			//	print("fatality")
				self.MeleeAttackDistance = 55*self.rampagemod
				local TEMP_Ents = ents.FindInSphere(self:GetPos(),200)
				for E=1, #TEMP_Ents do
					if TEMP_Ents[E]:IsNPC()||TEMP_Ents[E]:IsNextBot() then
						local TEMP_BoxMin, TEMP_BoxMax = TEMP_Ents[E]:OBBMins(), TEMP_Ents[E]:OBBMaxs()
						
						local TEMP_SizeX = (math.abs(TEMP_BoxMin.x)+math.abs(TEMP_BoxMax.x))/2
						local TEMP_SizeY = (math.abs(TEMP_BoxMin.y)+math.abs(TEMP_BoxMax.y))/2
						local TEMP_SizeZ = (math.abs(TEMP_BoxMin.z)+math.abs(TEMP_BoxMax.z))/2
						
						if(TEMP_SizeX<65&&TEMP_SizeY<65&&TEMP_SizeZ<65) then
							local TEMP_Ang = ((TEMP_Ents[E]:GetPos()-self:GetPos()):Angle()-self:GetAngles()).Y
							TEMP_Ang = math.NormalizeAngle(TEMP_Ang)
							TEMP_Ang = math.abs(TEMP_Ang)
							
							if(TEMP_Ang<40) then
								TEMP_CanAttack = true
							end
						end
					end
				end	
				
				end
				
				if(TEMP_CanAttack==true) then
				Tyrant_PlayAnimation(self,"Puny God",3)
				
				timer.Create("ComboCheck"..tostring(self),0.3,1,function() 
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
								
							if (TEMP_Ents[E]:IsNPC()||TEMP_Ents[E]:IsNextBot()) && TEMP_Ents[E]:GetClass() != self:GetClass() && Enemies == 0 && TEMP_SizeX<65&&TEMP_SizeY<65&&TEMP_SizeZ<65 then
								//print(TEMP_Ents[E])
								Enemies = 1
								self.TEMP_Doll = ents.Create("prop_ragdoll")
								self.TEMP_Doll:SetPos(self:GetBonePosition(self:LookupBone("g_r_palm")))
								self.TEMP_Doll:SetAngles(TEMP_Ents[E]:GetAngles())
								self.TEMP_Doll:SetModel(TEMP_Ents[E]:GetModel())
								self.TEMP_Doll:Spawn()
								self.TEMP_Doll:SetBodyGroups(TEMP_Ents[E]:GetBodyGroups())
								self.TEMP_Doll:SetSkin(TEMP_Ents[E]:GetSkin())
							 

								TEMP_Ents[E]:Fire( "Kill", "", 0.1 )
								TEMP_Ents[E]:Remove()
	
					
									net.Start( "NPCKilledNPC" )
									net.WriteString( TEMP_Ents[E]:GetClass() )
									net.WriteString( self:GetClass() )
									net.WriteString( self:GetClass() )
									net.Broadcast()
							
									 	
								end
								
		
								timer.Create("DollManipulate"..tostring(self),0.01,7200,function()
										if(IsValid(self)&&IsValid(self.TEMP_Doll)&&self.TEMP_Doll:GetPos():Distance(self:GetBonePosition(self:LookupBone("g_r_palm")))<400) then
											self:SetEnemy(NULL)
											self.TEMP_Doll:GetPhysicsObject():ApplyForceCenter((self:GetBonePosition(self:LookupBone("g_r_palm"))))
											self.TEMP_Doll:GetPhysicsObject():SetPos(self:GetBonePosition(self:LookupBone("g_r_palm")))
										end
									end)
									
									timer.Create("DollManipulateEnd"..tostring(self),1.65,1,function()
					 
										if(IsValid(self)&&self!=NULL&&IsValid(self.TEMP_Doll)&&self.TEMP_Doll!=NULL) then
											timer.Remove("DollManipulate"..tostring(self))
											if(self.TEMP_Doll:GetPos():Distance(self:GetBonePosition(self:LookupBone("g_r_palm")))<220) then
												for P=0, self.TEMP_Doll:GetPhysicsObjectCount()-1 do
													self.TEMP_Doll:GetPhysicsObjectNum(P):ApplyForceCenter(((self:GetForward()*-10)+self:GetUp()*6)*self.TEMP_Doll:GetPhysicsObjectNum(P):GetMass()*1)
												end
											end
										end
										 
									end)
									
									timer.Create("EndAttack"..tostring(self),1.7,1,function()
										if(IsValid(self)&&self!=NULL) then
											Tyrant_ClearAnimation(self)
										end
									end)
									
									 	
							end
						end
						end)
			end
						
			timer.Simple(2.5, function() 
				if IsValid(self) && self.fatality == true then
					self.fatality = false
				end
			end)
			
			end
		end 
		
	end  
end 

 
 
 

 
 
 