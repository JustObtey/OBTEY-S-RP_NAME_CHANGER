AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("obt_rpname_core/obt_rpname_config.lua")
AddCSLuaFile("obt_rpname_core/obt_network.lua")
include("shared.lua")


function ENT:Initialize()

	self:SetModel(OBTConfig.NPCModel)
	self:SetHullType(HULL_HUMAN)
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:CapabilitiesAdd(CAP_ANIMATEDFACE)
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()

end

function ENT:OnTakeDamage()
	return false
end

util.AddNetworkString("Baseframe")

function ENT:Use(act, ply)
	if IsValid(ply) and ply:IsPlayer() then
		net.Start("Baseframe")
		net.Send(ply)
	end
end