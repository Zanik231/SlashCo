function ENT:CustomOnAcceptInput(key,activator,caller,data)
   self.AttackChecker = 0
	
	if key == "ScreenShakeOnStep" then
		util.ScreenShake( self:GetPos(), 2*self.rampagemod/2, 1*self.rampagemod/2, 1, 1800*self.rampagemod )	

	elseif key == "Hulky Leap" then
		util.ScreenShake( self:GetPos(), 5*self.rampagemod/2, 3*self.rampagemod/2, 1, 1800*self.rampagemod )	
		util.VJ_SphereDamage(self,self,self:GetPos(),600,math.random(90,120)*self.rampagemod,bit.bor(DMG_BLAST,DMG_DIRECT,DMG_SLASH,DMG_CLUB),true,true)
	 
	 if self.rampagemod > 30 then
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
	
	if self.rampagemod > 40 then
		util.ScreenShake( self:GetPos(), 100, 200, 1, 32000 )
		ParticleEffect("HULK_WB_UNLIMITED_GR_Smash",self:GetPos(), Angle(0,0,0))
		ParticleEffect("HULK_WB_UNLIMITED_GR_Shockwaves",self:GetPos(), Angle(0,0,0))
		ParticleEffect("HULK_WB_UNLIMITED_GR_smash_extra",self:GetPos(), Angle(0,0,0))
		ParticleEffect("Hulk_WB_Breath_more50_2",self:GetPos(), Angle(0,0,0))

	 
	 	local TEMP_Ents = ents.FindInSphere(self:GetPos(),18000)

		for E=1, #TEMP_Ents do 
			if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
			 	TEMP_Ents[E]:TakeDamage( 600*self.rampagemod, self, TEMP_Ents[E] )
				local TEMP_BoxMin, TEMP_BoxMax = TEMP_Ents[E]:OBBMins(), TEMP_Ents[E]:OBBMaxs()			
				local TEMP_SizeX = (math.abs(TEMP_BoxMin.x)+math.abs(TEMP_BoxMax.x))/2
				local TEMP_SizeY = (math.abs(TEMP_BoxMin.y)+math.abs(TEMP_BoxMax.y))/2
				local TEMP_SizeZ = (math.abs(TEMP_BoxMin.z)+math.abs(TEMP_BoxMax.z))/2
			  
				if(	TEMP_SizeX<100*self.rampagemod && TEMP_SizeY<100*self.rampagemod && TEMP_SizeZ<100*self.rampagemod ) and TEMP_Ents[E]:GetClass() != 'npc_pk_lucifer' and TEMP_Ents[E]:GetClass() != "npc_drg_godzilla2014" and TEMP_Ents[E]:GetClass() != self:GetClass() then
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

	 elseif key == "Before Throw" then
		self.tank = self:GetEnemy() 
	if IsValid(self) && IsValid(self.tank) then
		
		timer.Create("TankGrabbing"..tostring(self),.01,150,function()
			
		if IsValid(self) && IsValid(self.tank) && self.tank:GetPos():Distance(self:GetBonePosition(self:LookupBone("g_r_palm")))<400 && self.tank:GetParent() == NULL then
			self.throwingtank = true
			self:StopMoving()
			//self.Alerted = false
			//self:SetEnemy(NULL)	
			self:SetAngles(self.CurrentAngle)
			self.tank:SetPos(self:GetBonePosition(self:LookupBone("g_r_palm")))  
			self.tank:SetVelocity(Vector(0,0,0))
			self.tank:SetAngles(self.CurrentAngle)
			
			//self.MeleeAttackAnimationFaceEnemy = false
			//self.ConstantlyFaceEnemy = false 
				end
		end)	
					
		self:SetAngles(self.CurrentAngle)
			timer.Simple(2, function()
				if IsValid(self) then
				Tyrant_ClearAnimation(self)
				self.throwingtank = false
			end
			end)
		
		end
 	elseif key == "TrackingOn" then
	 
		self.MeleeAttackAnimationFaceEnemy = true
		self.ConstantlyFaceEnemy = true
 

	elseif key == "TrackingOff" then

		self.MeleeAttackAnimationFaceEnemy = false
		self.ConstantlyFaceEnemy = false
 
		
 elseif key == "Throwing_Act" then

		 
	if IsValid(self)  then --&& IsValid(self:GetEnemy())
	timer.Remove("TankGrabbing"..tostring(self))
	
	//Tyrant_ClearAnimation(self)
	
	if IsValid(self:GetEnemy()) then 
	local MyEnemy = self:GetEnemy()
	Tyrant_ClearAnimation(self)
	//self.MeleeAttackAnimationFaceEnemy = true
	self.ConstantlyFaceEnemy = false
 	local phys = self:GetEnemy():GetPhysicsObject()
	if IsValid(phys) then 
			self:GetEnemy():SetVelocity( self:GetForward() *0 )
			local ThrowingV = (self:GetForward()*9500 + self:GetUp()*8500)
			if IsValid(self) && IsValid(phys) then
			//print("throw")
			self:SetEnemy(NULL)	
			phys:SetMass(70110)
			phys:ApplyForceCenter(ThrowingV * 17500)
			phys:SetVelocity(phys:GetVelocity())
			self:SetEnemy(NULL)
		end
		 
		 			timer.Simple(math.random(1,2.7), function() 
					if IsValid(self) && IsValid(MyEnemy) then
						MyEnemy:TakeDamage( 9000, self, MyEnemy )
						Tyrant_ClearAnimation(self)
						end
					end)
		 end
			end
			self.throwingtank = false
			end
			
	elseif key == "HeadPunch" then
	
	if IsValid(self) && IsValid(self:GetEnemy()) && self:GetPos():Distance(self:GetEnemy():GetPos()) < self.MeleeDist then
		self:EmitSound("hulk/punch/punch"..math.random(1,8)..".wav", 120, 100, 1)	
	end
		
	if self.AttackChecker == 0 then
	self.TimeUntilMeleeAttackDamage = false
	self.MeleeAttackDamage = 60*self.rampagemod
	self.MeleeAttackDistance = self.MeleeDist  
	self.MeleeAttackDamageDistance = 250*self.rampagemod/1.5
	self.MeleeAttackDamageType = bit.bor(DMG_DIRECT,DMG_SLASH,DMG_CLUB)
	self.HasMeleeAttackKnockBack = true
	self.MeleeAttackKnockBack_Forward1 = 20*self.rampagemod/2
	self.MeleeAttackKnockBack_Forward2 = 20*self.rampagemod/2
	self.MeleeAttackKnockBack_Up1 = 10*self.rampagemod/2
	self.MeleeAttackKnockBack_Up2 = 10*self.rampagemod/2
	self.MeleeAttackKnockBack_Right1 = 0
	self.MeleeAttackKnockBack_Right2 = 0
	self.BeforeMeleeAttackSoundLevel = 440
	self.MeleeAttackSoundLevel = 440
	self.ExtraMeleeAttackSoundLevel = 440
	self.MeleeAttackMissSoundLevel = 440
	self.MeleeAttackDamageAngleRadius = 100
	 
 	 self.AttackChecker = 1
	 self:MeleeAttackCode()
	  timer.Simple(0.01, function() 
	  if IsValid(self) && self.AttackChecker == 1 then
		self.AttackChecker = 0
	// self:SetEnemy(NULL)
	  end end)
	  
	  end

	if self.WB == true and IsValid(self:GetEnemy()) then
		self:GetEnemy():TakeDamage( 120, self,self:GetEnemy() )
	end
		
	elseif key == "Before Attack" then
			if self.WB == true then
				local width = 50
				local LHTRAIL = util.SpriteTrail(self, 1, Color(0,255,63,255), false, width*self.rampagemod, width*self.rampagemod, 0.08, 1/(width*self.rampagemod+width*self.rampagemod)*0.5, "VJ_Base/sprites/vj_trial1.vmt")
				local RHTRAIL = util.SpriteTrail(self, 2, Color(0,255,63,255), false, width*self.rampagemod, width*self.rampagemod, 0.08, 1/(width*self.rampagemod+width*self.rampagemod)*0.5, "VJ_Base/sprites/vj_trial1.vmt")
				timer.Simple(1.5, function() if IsValid(RHTRAIL) then LHTRAIL:Remove() RHTRAIL:Remove() width=0 end end)	
			end
			
	self:EmitSound("hulk/hits/hit"..math.random(1,26)..".wav", 120, 70, 1)	
	
	elseif key == "Before Smash" then
	self:EmitSound("hulk/hits/before_smash"..math.random(1,4)..".wav", 120, 70, 1)	
	
	elseif key == "Throwing Sound"  then
	 self:EmitSound("hulk/throw/throw"..math.random(1,25)..".wav", 120, 70, 1)	
	
	elseif key == "Step"  then
		self:EmitSound("hulk/step"..math.random(1,4)..".wav", 120, 80, 1)	
	 
	elseif key == "FootStomp" then
		 
	if self.AttackChecker == 0 then
 
	self:EmitSound("hulk/step"..math.random(1,4)..".wav", 120, 80, 1)	
	self.MeleeAttackDamage = 10*self.rampagemod
	self.MeleeAttackDistance = self.MeleeDist  
	self.MeleeAttackDamageDistance = 980*self.rampagemod/1.5
	self.MeleeAttackDamageType = bit.bor(DMG_DIRECT,DMG_SLASH,DMG_CLUB)

	self.HasMeleeAttackKnockBack = true
	self.MeleeAttackKnockBack_Forward1 = 10*self.rampagemod/4
	self.MeleeAttackKnockBack_Forward2 = 10*self.rampagemod/4
	self.MeleeAttackKnockBack_Up1 = 140*self.rampagemod/4
	self.MeleeAttackKnockBack_Up2 = 140*self.rampagemod/4
	self.MeleeAttackKnockBack_Right1 = 0
	self.MeleeAttackKnockBack_Right2 = 0
	
	local WheelPos = Vector( 0, 0, 0 )
	local effectdata = EffectData()
 	effectdata:SetOrigin( self:LocalToWorld( WheelPos ) )
	effectdata:SetScale(600*self.rampagemod) 
	util.Effect( "ThumperDust", effectdata )
	util.ScreenShake( self:GetPos(), 100, 200, 1, 1500 )
	
	 self.AttackChecker = 1
	 self:MeleeAttackCode()
	timer.Simple(0.01, function() 
	  if IsValid(self) && self.AttackChecker == 1 then
		self.AttackChecker = 0
		//self:SetEnemy(NULL)
	  end end)
	  
	  end
	  
	  
	if self.WB == true and IsValid(self:GetEnemy()) then
		self:GetEnemy():TakeDamage( 120, self,self:GetEnemy() )
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
		
				  		local enemies = ents.FindInSphere( self:GetPos(), GetConVarNumber("vj_agm69_splash") )
 
		
	 	local TEMP_Ents = ents.FindInSphere(self:GetPos(),18000)

		for E=1, #TEMP_Ents do 
			if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
			 	TEMP_Ents[E]:TakeDamage( 600*self.rampagemod, self, TEMP_Ents[E] )
				local TEMP_BoxMin, TEMP_BoxMax = TEMP_Ents[E]:OBBMins(), TEMP_Ents[E]:OBBMaxs()			
				local TEMP_SizeX = (math.abs(TEMP_BoxMin.x)+math.abs(TEMP_BoxMax.x))/2
				local TEMP_SizeY = (math.abs(TEMP_BoxMin.y)+math.abs(TEMP_BoxMax.y))/2
				local TEMP_SizeZ = (math.abs(TEMP_BoxMin.z)+math.abs(TEMP_BoxMax.z))/2
			  
				if( TEMP_SizeX<100*self.rampagemod && TEMP_SizeY<100*self.rampagemod && TEMP_SizeZ<100*self.rampagemod	) and TEMP_Ents[E]:GetClass() != 'npc_pk_lucifer' and TEMP_Ents[E]:GetClass() != "npc_drg_godzilla2014" and TEMP_Ents[E]:GetClass() != self:GetClass() then
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
	
 	elseif key == "Punch" then
	 	if self.rampagemod > 50 then
			ParticleEffect("HULK_Breath_WB_more50",self:GetPos(), Angle(0,0,0))
		end
 	//	if IsValid(self) && IsValid(self:GetEnemy()) && self:GetPos():Distance(self:GetEnemy():GetPos()) < self.MeleeDist then
			self:EmitSound("hulk/punch/punch"..math.random(1,8)..".wav", 120, 100, 1)	
	//	 end
	if self.AttackChecker == 0 then
	util.ScreenShake( self:GetPos(), 1, 1, 1, 1500 )
	
	self.MeleeAttackDamage = 80*self.rampagemod
	self.MeleeAttackDistance = self.MeleeDist
	self.MeleeAttackDamageDistance = 250*self.rampagemod/1.5
	self.MeleeAttackDamageType = bit.bor(DMG_DIRECT,DMG_SLASH,DMG_CLUB)
 
	self.HasMeleeAttackKnockBack = false
	self.MeleeAttackKnockBack_Forward1 = 230*self.rampagemod/5
	self.MeleeAttackKnockBack_Forward2 = 230*self.rampagemod/5
	self.MeleeAttackKnockBack_Up1 = 40*self.rampagemod/5
	self.MeleeAttackKnockBack_Up2 = 40*self.rampagemod/5
	self.MeleeAttackKnockBack_Right1 = 0
	self.MeleeAttackKnockBack_Right2 = 0
	self.BeforeMeleeAttackSoundLevel = 440
	self.MeleeAttackSoundLevel = 440
	self.ExtraMeleeAttackSoundLevel = 440
	self.MeleeAttackMissSoundLevel = 440
	self.MeleeAttackDamageAngleRadius = 100
	
 
 	 self.AttackChecker = 1
	 self:MeleeAttackCode()
 	  timer.Simple(0.01, function() 
	  if IsValid(self) && self.AttackChecker == 1 then
		self.AttackChecker = 0
		//self:SetEnemy(NULL)
	  end end)
	  
	if self.WB == true and IsValid(self:GetEnemy()) then
		self:GetEnemy():TakeDamage( 120, self,self:GetEnemy() )
	end
	
 end
  
 elseif key == "Clap" then
	util.ScreenShake( self:GetPos(), 1*self.rampagemod, 1*self.rampagemod, 1, 800*self.rampagemod  )
  	if self.rampagemod > 3 then
		ParticleEffect("Hulk_Shockwave",self:GetPos(), Angle(0,0,0))
	end
	
	self:EmitSound("hulk/Clap.wav", 120, 75, 1)	
 if IsValid(self) && IsValid(self:GetEnemy()) && self:GetPos():Distance(self:GetEnemy():GetPos()) < 180*self.rampagemod then
	self.TimeUntilMeleeAttackDamage = false
	
	
	self.MeleeAttackDamage = 700*self.rampagemod --self:GetEnemy():GetMaxHealth()*0.2+ self:GetEnemy():Health()
	self.MeleeAttackDistance = 200*self.rampagemod/1.5   
	self.MeleeAttackDamageDistance = 320*self.rampagemod/1.5
	self.MeleeAttackDamageType = bit.bor(DMG_DIRECT,DMG_SLASH,DMG_CLUB)
	
	self.HasMeleeAttackKnockBack = false
  
 self:MeleeAttackCode()
		local TEMP_Ents = ents.FindInSphere(self:GetPos(),1200)

		for E=1, #TEMP_Ents do 
			if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
			//	util.BlastDamage( TEMP_Ents[E], self, self:GetPos(), 1200, 5 )	
			end
			
		end
	
		Tyrant_ClearAnimation(self)
	end
	
	elseif key == "Shockwave_Attack" then
	 
	ParticleEffect("Hulk_Shockwave",self:GetPos(), Angle(0,0,0))
	ParticleEffect("explosion_huge_d",self:GetPos(), Angle(0,0,0))
	self:EmitSound("hulk/smash.wav",100,100)  
	util.ScreenShake( self:GetPos(), 45, 25, 1, 2000 )
	
			local TEMP_Ents = ents.FindInSphere(self:GetPos(),2000)

		for E=1, #TEMP_Ents do 
			if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
			 	TEMP_Ents[E]:TakeDamage( 80*self.rampagemod, self, TEMP_Ents[E] )
			end
			
		end
	 
	
	if self.rampagemod > 30 then
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
	
	if self.rampagemod > 40 then
		util.ScreenShake( self:GetPos(), 100, 200, 1, 32000 )
		ParticleEffect("HULK_WB_UNLIMITED_GR_Smash",self:GetPos(), Angle(0,0,0))
		ParticleEffect("HULK_WB_UNLIMITED_GR_Shockwaves",self:GetPos(), Angle(0,0,0))
		ParticleEffect("HULK_WB_UNLIMITED_GR_smash_extra",self:GetPos(), Angle(0,0,0))
		ParticleEffect("Hulk_WB_Breath_more50_2",self:GetPos(), Angle(0,0,0))

	 
	 	local TEMP_Ents = ents.FindInSphere(self:GetPos(),18000)

		for E=1, #TEMP_Ents do 
			if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
			 	TEMP_Ents[E]:TakeDamage( 600*self.rampagemod, self, TEMP_Ents[E] )
				
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
	
	
	
  	elseif key == "Brutal Strike" then
 	if self.rampagemod > 50 then
	  ParticleEffect("HULK_Breath_WB_more50",self:GetPos(), Angle(0,0,0))
	end
	
 //	if IsValid(self) && IsValid(self:GetEnemy()) && self:GetPos():Distance(self:GetEnemy():GetPos()) < self.MeleeDist then
		self:EmitSound("hulk/punch/punch"..math.random(1,8)..".wav", 120, 150, 1)	
//	end
	
	 	if self.AttackChecker == 0 then
	 
	
	self.MeleeAttackDamage = 80*self.rampagemod
	self.MeleeAttackDistance = self.MeleeDist
	self.MeleeAttackDamageDistance = 250*self.rampagemod/1.5
	self.MeleeAttackDamageType = bit.bor(DMG_DIRECT,DMG_SLASH,DMG_CLUB)
 
  self:MeleeAttackCode()
 	 self.AttackChecker = 1
	 
	  timer.Simple(0.01, function() 
	  if IsValid(self) && self.AttackChecker == 1 then
		self.AttackChecker = 0
		//self:SetEnemy(NULL)
	  end end)
	  end
 		if self.WB == true then
		self:GetEnemy():TakeDamage( 120, self, MyEnemy )
		end
		
	elseif key == "Smash Ground" then
			 
		if self.AttackChecker == 0 then
   self:EmitSound("hulk/smash.wav",100,100)
	 
	self.MeleeAttackAnimationDelay = 0 
	self.MeleeAttackDamageDistance = self.MeleeDist
	self.MeleeAttackDamage = 250*self.rampagemod
	self.MeleeAttackDamageType = bit.bor(DMG_DIRECT,DMG_SLASH,DMG_CLUB)
	self.MeleeAttackDistance = 200*self.rampagemod/1.5  
	self.HasMeleeAttackKnockBack = true
	self.MeleeAttackKnockBack_Forward1 = 40*self.rampagemod/5
	self.MeleeAttackKnockBack_Forward2 = 40*self.rampagemod/5
	self.MeleeAttackKnockBack_Up1 = 40*self.rampagemod/5
	self.MeleeAttackKnockBack_Up2 = 40*self.rampagemod/5
	self.MeleeAttackKnockBack_Right1 = 10*self.rampagemod/5
	self.MeleeAttackKnockBack_Right2 = -10*self.rampagemod/5
		
	local WheelPos = Vector( 0, 0, 0 )
	local effectdata = EffectData()
 	effectdata:SetOrigin( self:LocalToWorld( WheelPos ) )
	effectdata:SetScale(600*self.rampagemod) 
	util.Effect( "ThumperDust", effectdata )
	util.ScreenShake( self:GetPos(), 100, 200, 1, 2000 )
	
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

	 
	 	local TEMP_Ents = ents.FindInSphere(self:GetPos(),18000)

		for E=1, #TEMP_Ents do 
			if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
			 	TEMP_Ents[E]:TakeDamage( 600*self.rampagemod, self, TEMP_Ents[E] )
				local TEMP_BoxMin, TEMP_BoxMax = TEMP_Ents[E]:OBBMins(), TEMP_Ents[E]:OBBMaxs()			
				local TEMP_SizeX = (math.abs(TEMP_BoxMin.x)+math.abs(TEMP_BoxMax.x))/2
				local TEMP_SizeY = (math.abs(TEMP_BoxMin.y)+math.abs(TEMP_BoxMax.y))/2
				local TEMP_SizeZ = (math.abs(TEMP_BoxMin.z)+math.abs(TEMP_BoxMax.z))/2
			  
				if(TEMP_SizeX<800 || TEMP_SizeY<800 || TEMP_SizeZ<800) and TEMP_Ents[E]:GetClass() != 'npc_pk_lucifer' and TEMP_Ents[E]:GetClass() != "npc_drg_godzilla2014" and TEMP_Ents[E]:GetClass() != self:GetClass() then
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
	
	
	self.AttackChecker = 1
	 self:MeleeAttackCode()
	 	  timer.Simple(0.01, function() 
	  if IsValid(self) && self.AttackChecker == 1 then
		self.AttackChecker = 0
		//self:SetEnemy(NULL)
	  end end)
	  
	  end
	  
	   elseif key == "FastP" then
	
		if self.rampagemod > 50 then
			ParticleEffect("HULK_Breath_WB_more50",self:GetPos(), Angle(0,0,0))
		end

		if self.WB == true and IsValid(self:GetEnemy()) then
			self:GetEnemy():TakeDamage( 120, self, MyEnemy )
		end
		
 		if IsValid(self) && IsValid(self:GetEnemy()) && self:GetPos():Distance(self:GetEnemy():GetPos()) < 200*self.rampagemod then
	if self.AttackChecker == 0 then
	util.ScreenShake( self:GetPos(), 1, 1, 1, 1500 )
	self:EmitSound("hulk/punch/punch"..math.random(1,8)..".wav", 120, 100, 1)	
	self.MeleeAttackDamage = 40*self.rampagemod
	self.MeleeAttackDistance = self.MeleeDist  
	
	self.MeleeAttackDamageDistance = 210*self.rampagemod/1.5
	self.MeleeAttackDamageType = bit.bor(DMG_DIRECT,DMG_SLASH,DMG_CLUB)
 
	self.HasMeleeAttackKnockBack = false
	self.MeleeAttackKnockBack_Forward1 = 130*self.rampagemod/8
	self.MeleeAttackKnockBack_Forward2 = 130*self.rampagemod/8
	self.MeleeAttackKnockBack_Up1 = 20*self.rampagemod/8
	self.MeleeAttackKnockBack_Up2 = 20*self.rampagemod/8
	self.MeleeAttackKnockBack_Right1 = 0
	self.MeleeAttackKnockBack_Right2 = 0
	self.BeforeMeleeAttackSoundLevel = 440
	self.MeleeAttackSoundLevel = 440
	self.ExtraMeleeAttackSoundLevel = 440
	self.MeleeAttackMissSoundLevel = 440
	self.MeleeAttackDamageAngleRadius = 100
	
 
 	 self.AttackChecker = 1
	 self:MeleeAttackCode()
 	  timer.Simple(0.01, function() 
	  if IsValid(self) && self.AttackChecker == 1 then
		self.AttackChecker = 0
	  end end)
	  
	  end
	  
 end
 
  	elseif key == "LastP" then
		self:SetEnemy(NULL)
		Tyrant_ClearAnimation(self)
		//print("just don't do it")
		self:VJ_ACT_PLAYACTIVITY("JoJo Ref Last Punch",false,2,false) 
		 
	
	elseif key == "Punch_Last_D" then
		
 		if IsValid(self) && IsValid(self:GetEnemy()) && self:GetPos():Distance(self:GetEnemy():GetPos()) < 200*self.rampagemod then
	if self.AttackChecker == 0 then
	util.ScreenShake( self:GetPos(), 1, 1, 1, 1500 )
	self:EmitSound("hulk/punch/punch"..math.random(1,8)..".wav", 120, 100, 1)	
	self.MeleeAttackDamage = 120*self.rampagemod
	self.MeleeAttackDistance = self.MeleeDist
	self.MeleeAttackDamageDistance = 440*self.rampagemod/1.5
	self.MeleeAttackDamageType = bit.bor(DMG_DIRECT,DMG_SLASH,DMG_CLUB)
 
	self.HasMeleeAttackKnockBack = true
	self.MeleeAttackKnockBack_Forward1 = 230*self.rampagemod/2
	self.MeleeAttackKnockBack_Forward2 = 230*self.rampagemod/2
	self.MeleeAttackKnockBack_Up1 = 40*self.rampagemod/2
	self.MeleeAttackKnockBack_Up2 = 40*self.rampagemod/2
	self.MeleeAttackKnockBack_Right1 = 0
	self.MeleeAttackKnockBack_Right2 = 0
	self.BeforeMeleeAttackSoundLevel = 440
	self.MeleeAttackSoundLevel = 440
	self.ExtraMeleeAttackSoundLevel = 440
	self.MeleeAttackMissSoundLevel = 440
	self.MeleeAttackDamageAngleRadius = 100
	
  		 local TEMP_Ents = ents.FindInSphere(self:GetPos(),18000)

		for E=1, #TEMP_Ents do 
			 
			if (TEMP_Ents[E]:IsNPC() || TEMP_Ents[E]:IsNextBot()) and TEMP_Ents[E]:GetClass() != "Player" and TEMP_Ents[E]:GetClass() != self:GetClass() then
				//print(TEMP_Ents[E])
			 	TEMP_Ents[E]:SetVelocity( self:GetForward() * 5700 +self:GetUp() * 150)
			end
			
		end
 
 	 self.AttackChecker = 1
	 self:MeleeAttackCode()
 	  timer.Simple(0.01, function() 
	  if IsValid(self) && self.AttackChecker == 1 then
		self.AttackChecker = 0
	  end end)
	  
	  end
 end
	  
	  
	 elseif key == "Punch2" then
	 
	 	if self.AttackChecker == 0 then
		 
	 self:EmitSound("hulk/smash.wav",100,100)
	 
	local WheelPos = Vector( 0, 0, 0 )
	local effectdata = EffectData()
 	effectdata:SetOrigin( self:LocalToWorld( WheelPos ) )
	effectdata:SetScale(200*self.rampagemod) 
	util.Effect( "ThumperDust", effectdata )
	
	 	 self.AttackChecker = 1
	 self:MeleeAttackCode()
	 	 	  timer.Simple(0.01, function() 
	  if IsValid(self) && self.AttackChecker == 1 then
		self.AttackChecker = 0
	  end end)
	  
	  end
  end
 end
 



		
 
 