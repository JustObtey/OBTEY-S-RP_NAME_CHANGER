include("obt_rpname_core/obt_rpname_config.lua")

ENT.Base 			= "base_ai"
ENT.Type		 	= "ai"
ENT.PrintName		= "RP Name NPC"
ENT.Author			= "OBTEY'S"
ENT.Category		= "OBTEY'S"
ENT.Contact			= "N/A"
ENT.Purpose			= "N/A" 
ENT.Instructions	= "Press 'USE' key"
ENT.Spawnable		= true
ENT.AdminSpawnable  = true
ENT.AutomaticFrameAdvance = false

function ENT:SetAutomaticFrameAdvance(bUsingAnim)
	self.AutomaticFrameAdvance = bUsingAnim
end