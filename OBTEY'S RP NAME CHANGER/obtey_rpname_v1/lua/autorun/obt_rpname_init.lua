if SERVER then
    
    print([[
    $$$$$$\  $$\        $$\                               $$\        $$$$$$\  
    $$  __$$\ $$ |       $$ |                              $  |      $$  __$$\ 
    $$ /  $$ |$$$$$$$\ $$$$$$\    $$$$$$\  $$\   $$\       \_/       $$ /  \__|
    $$ |  $$ |$$  __$$\\_$$  _|  $$  __$$\ $$ |  $$ |                \$$$$$$\  
    $$ |  $$ |$$ |  $$ | $$ |    $$$$$$$$ |$$ |  $$ |                 \____$$\ 
    $$ |  $$ |$$ |  $$ | $$ |$$\ $$   ____|$$ |  $$ |                $$\   $$ |
     $$$$$$  |$$$$$$$  | \$$$$  |\$$$$$$$\ \$$$$$$$ |                \$$$$$$  |
     \______/ \_______/   \____/  \_______| \____$$ |                 \______/ 
                                           $$\   $$ |                          
                                           \$$$$$$  |                          
                                            \______/                           
    ]])

    print("\n\n")
    print("/////////////////////")
    print("/                   /")
    print("/   OBTEY'S ADDONS  /")
    print("/  RPNAME NPC  v1.0 /")
    print("/                   /")
    print("/////////////////////")
    print("\n\n")



    util.AddNetworkString("ObteyChangeName")


    local function changename(len, ply)

        local nick = net.ReadString(1)
        local name = net.ReadString(2)
        
        ply:setRPName(nick .. " " .. name)

    end


    net.Receive("ObteyChangeName", changename)

end



if CLIENT then

    print("\n\n")
    print("/////////////////////")
    print("/                   /")
    print("/   OBTEY'S ADDONS  /")
    print("/  RPNAME NPC  v1.0 /")
    print("/                   /")
    print("/////////////////////")
    print("\n\n")
    
    AddCSLuaFile("entities/obt_rpname_npc/shared.lua")

end