game.AddParticles("particles/Hulk_eyes.pcf")


if CLIENT then

if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then
	chat.AddText(Color(0,200,200),PublicAddonName,
	Color(0,255,0)," was unable to install, you are missing ",
	Color(255,100,0),"VJ Base!"
	)
	end
	
		hook.Add( "PreDrawHalos", "Hulk_Destroyer", function()
			local Hulks = ents.FindByClass("npc_avg_hulk")
			local AngryHulks = {}
			local VeryAngryHulks = {}
			
			if (#Hulks>0) then
			
				for M=1, #Hulks do
				 
				if (Hulks[M].HulkRadiance == 1) then 
					table.insert(AngryHulks, Hulks[M])
				end
			end
		end
				
				if (#AngryHulks>0) then
					halo.Add( AngryHulks, Color( 0, 255, 63 ), 5, 5, 0.15, true )
					halo.Add( AngryHulks, Color( 255, 255, 63 ), 15, 15, .5, true )
				end
				
				 for M=1, #Hulks do
				 if (Hulks[M].HulkRadiance == 2) then 
						table.insert(VeryAngryHulks, Hulks[M])
					end
				 end
				if (#VeryAngryHulks>0) then
					halo.Add( VeryAngryHulks, Color( 0, 255, 63 ), 15, 15, 0.85, true )
					halo.Add( VeryAngryHulks, Color( 0, 255, 255), 5, 5, 0.55, true )
					halo.Add( VeryAngryHulks, Color( 255, 255, 63 ), 5, 5, .4, true )	
				end
			  
		end)
		
end

local particlename = {
		"Hulky",
		"HULK_Breath_WB_more50",
		"Hulk_green_eye_core",
		"Hulk_green_eye_smoke",
		"Hulk_Shockwave",
		"Hulk_WB_Breath_more50_2",
		"Hulk_WB_Growth",
		"Hulk_WB_hands",
		"Hulk_WB_smash",
		"HULK_WB_TERRAFORM",
		"HULK_WB_TERRAFORM_ADD",
		"HULK_WB_UNLIMITED_GR_Shockwaves",
		"HULK_WB_UNLIMITED_GR_Smash",
		"HULK_WB_UNLIMITED_GR_smash_extra"
		
		
	}
	for _,v in ipairs(particlename) do PrecacheParticleSystem(v) end
	
	

local function HULK_WB(NAME)
	local NPC = {
	Name = NAME, 
	Class = "npc_avg_hulk",			
	Category = "Avengers",
	KeyValues = { VAR_isInstantWB = NAME }
}	
	list.Set( "NPC", "npc_avg_hulk_"..string.lower(NAME), NPC )
	list.Set("DrGBaseNextbots", "npc_avg_hulk_"..string.lower(NAME), NPC)
end
 

HULK_WB("Hulk The World Breaker")