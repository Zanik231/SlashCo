include('shared.lua')	
include('init.lua')

function ENT:Initialize() 
self.HulkRadiance = 0
end

function ENT:CustomOnDraw()  
  
	if(self:GetSequenceName(self:GetSequence()) =="The World Breaker" && self.HulkRadiance == 0 || self:GetSkin()==1 && self.HulkRadiance == 0) then
		self.HulkRadiance = 1 
	end
	
 if self:GetModelScale() > 10 then
		self.HulkRadiance = 2
	end
	// print(self:GetModelScale())
	//print(self.HulkRadiance,"rad")
 end