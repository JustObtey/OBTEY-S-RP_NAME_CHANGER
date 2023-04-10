OBTConfig = OBTConfig or {} -- DO NOT TOUCH THIS

include("shared.lua")

function ENT:Draw()
    self:DrawModel()
end


if OBTConfig.NPCDisplayText then
    -- Create the text that appears above the NPC's head
    hook.Add("PostDrawOpaqueRenderables", "Baseframe", function()
        for _, ent in pairs (ents.FindByClass("obtey_rpname_npc")) do
            if ent:GetPos():Distance(LocalPlayer():GetPos()) < 500 then
                local Ang = ent:GetAngles()

                Ang:RotateAroundAxis( Ang:Forward(), 90)
                Ang:RotateAroundAxis( Ang:Right(), -90)

                cam.Start3D2D(ent:GetPos()+ent:GetUp()*79, Ang, 0.20)
                    draw.SimpleText( OBTConfig.NPCText, "HUDNumber5", 0, 0, Color(255, 255, 255), TEXT_ALIGN_CENTER)
                cam.End3D2D()
            end
        end
    end)
end


-- Init font
surface.CreateFont("moon18", {
    font = "Moon",
    extended = false,
    size = 18,
})

surface.CreateFont("moon24", {
    font = "Moon",
    extended = false,
    size = 24,
})

surface.CreateFont("moon32", {
    font = "Moon",
    extended = false,
    size = 32,
})


-- Declare our main frame/baseframe
local function Baseframe()

    -- Get the screen size
    local scrw, scrh = ScrW(), ScrH()

    -- Create the background frame
    local bgframe = vgui.Create("DFrame")
        bgframe:SetSize(scrw, scrh)
        bgframe:SetTitle("")
        bgframe:Center()
        bgframe:MakePopup(true)
        bgframe:ShowCloseButton(false)
        bgframe:SetDraggable(false)
        bgframe.Paint = function(self, w, h)
            surface.SetDrawColor(15, 15, 15, 250)
            surface.DrawRect(0, 0, w, h)
        end

    -- Create a frame
    local frame = vgui.Create("DFrame")
        frame:SetSize(scrw * .4, scrh * .54)
        frame:SetTitle("")
        frame:Center()
        frame:MakePopup(true)
        frame:ShowCloseButton(false)
        frame:SetDraggable(false)
        frame.Paint = function(self, w, h)
            surface.SetDrawColor(255,255,255,0)
            surface.DrawRect(0, 0, w, h)
        end

    -- Get the frame size
    local framex, framey = frame:GetSize(x, y)

    -- Create a background panel
    local mypanel = vgui.Create("DPanel", frame)
        mypanel:SetSize(framex, framey)
        mypanel:SetPos(0, 0)
        mypanel.Paint = function(self, w, h)
            draw.RoundedBox(16, 0, 0, w, h, OBTConfig.BGColor)
        end

    -- Get the panel size
    local panelx, panely = mypanel:GetSize(x,y)

    -- Create the close button
    local closebtn = vgui.Create("DImageButton", mypanel)
        closebtn:SetPos(panelx-48, 16)
        closebtn:SetSize(32, 32)
        closebtn:SetImage("materials/assets/wx.png")

    -- Create the function of the close button
    closebtn.DoClick = function()
        bgframe:Close()
        frame:Close()
        mypanel:Remove()
    end

    -- Create the title label
    local label = vgui.Create("DLabel", mypanel)
        label:CenterHorizontal(0.30)
        label:CenterVertical(0.15)
        label:SetFont("moon24")
        label:SetText(OBTConfig.Title)
        label:SizeToContents()

    -- Create the background for text entry
    local entryback1 = vgui.Create("DPanel", mypanel)
        entryback1:SetSize(panelx * .6+10, panely * .065+10)
        entryback1:CenterHorizontal(0.5)
        entryback1:CenterVertical(0.4)
        entryback1.Paint = function(self, w, h)
            -- Making the first rect
            surface.SetDrawColor(57, 48, 83)
            surface.DrawRect(0, 0, w, h)

            -- Making the fade effect
            surface.SetDrawColor(57, 48, 83)
            surface.DrawRect(0, 0, w, h)

            for i = 1, w do
                local alpha = math.Clamp(i / w * 255, 0, 255)
                surface.SetDrawColor(46, 39, 66, alpha)
                surface.DrawRect(i, 0, 2, h)
            end
        end

    -- Same shit
    local entryback2 = vgui.Create("DPanel", mypanel)
        entryback2:SetSize(panelx * .6+10, panely * .065+10)
        entryback2:CenterHorizontal(0.5)
        entryback2:CenterVertical(0.55)
        entryback2.Paint = function(self, w, h)
            surface.SetDrawColor(57, 48, 83)
            surface.DrawRect(0, 0, w, h)

            surface.SetDrawColor(57, 48, 83)
            surface.DrawRect(0, 0, w, h)

            for i = 1, w do
                local alpha = math.Clamp(i / w * 255, 0, 255)
                surface.SetDrawColor(46, 39, 66, alpha)
                surface.DrawRect(i, 0, 2, h)
            end
        end

    -- Create the first text entry for the player nick name
    local entry1 = vgui.Create("DTextEntry", mypanel)
        entry1:SetPaintBackground(false)
        entry1:SetTextColor(Color(255,255,255))
        entry1:SetCursorColor(Color(255,255,255))
        entry1:SetSize(panelx * .6, panely * .065)
        entry1:CenterHorizontal(0.5)
        entry1:CenterVertical(0.4)
        entry1:SetFont("moon18")
        entry1:SetDrawLanguageID(false)
        entry1:SetPlaceholderText(OBTConfig.NameEntry)

        -- This is verifying if the player has hit the maximum chars limit
        entry1.AllowInput = function(self, stringValue)
            if #self:GetValue() == OBTConfig.FirstNameMaxChar then
                return true
            end    
        end

    -- Same shit but for the last name
    local entry2 = vgui.Create("DTextEntry", mypanel)
        entry2:SetPaintBackground(false)
        entry2:SetTextColor(Color(255,255,255))
        entry2:SetCursorColor(Color(255,255,255))
        entry2:SetSize(panelx * .6, panely * .065)
        entry2:CenterHorizontal(0.5)
        entry2:CenterVertical(0.55)
        entry2:SetFont("moon18")
        entry2:SetDrawLanguageID(false)
        entry2:SetPlaceholderText(OBTConfig.NameEntry)

        entry2.AllowInput = function(self, stringValue)
            if #self:GetValue() == OBTConfig.LastNameMaxChar then
                return true
            end    
        end
    
    -- Create the submit button
    local submit = vgui.Create("DButton", mypanel)
        submit:SetMouseInputEnabled(true)
        submit:SetSize(panelx * .5, panely * .17)
        submit:CenterHorizontal(.5)
        submit:CenterVertical(.8)
        submit:SetFont("moon32")
        submit:SetTextColor(Color(255,255,255, 255))
        submit:SetText(OBTConfig.Submit)
        submit.Paint = function(self, w, h)
            surface.SetDrawColor(57, 48, 83)
            surface.DrawRect(0, 0, w, h)

            -- Fade the color of the button
            for i = 1, w do
                local alpha = math.Clamp(i / w * 255, 0, 255)
                surface.SetDrawColor(46, 39, 66, alpha)
                surface.DrawRect(i, 0, 1, h)
            end

            -- Higlight the button when user press on it
            if submit:IsDown() then
                surface.SetDrawColor(30, 25, 49)
                surface.DrawRect(0, 0, w, h)

                for i = 1, w do
                    local alpha = math.Clamp(i / w * 255, 0, 255)
                    surface.SetDrawColor(46, 39, 66, alpha)
                    surface.DrawRect(i, 0, 2, h)
                end
            end
        end
    

    -- Create the submit button function
    submit.DoClick = function()

        -- Verification first and last name isn't empty
        if #entry1:GetValue() == 0 and #entry2:GetValue() == 0 then

            -- Create a dark background
            local bgframe = vgui.Create("DFrame")
                bgframe:SetSize(scrw, scrh)
                bgframe:SetTitle("")
                bgframe:Center()
                bgframe:MakePopup(true)
                bgframe:ShowCloseButton(false)
                bgframe:SetDraggable(false)
                bgframe:SetBackgroundBlur(true)
                bgframe.Paint = function(self, w, h)
                    surface.SetDrawColor(15, 15, 15, 150)
                    surface.DrawRect(0, 0, w, h)
                end

            -- Create a panel
            local nulerror = vgui.Create("DPanel", bgframe)
                nulerror:SetSize(panelx * .5, panely * .4)
                nulerror:Center()
                nulerror.Paint = function(self, w, h)
                    surface.SetDrawColor(OBTConfig.BGColor)
                    surface.DrawRect(0, 0, w, h)
                end

            -- Get the panel dimensions
            local nulx, nuly = nulerror:GetSize(x, y)
            
            -- Create a close button
            local mybtn = vgui.Create("DImageButton", nulerror)
                mybtn:SetPos(nulx-40, 8)
                mybtn:SetSize(32, 32)
                mybtn:SetImage("materials/assets/wx.png")

            -- Function of the close button
            mybtn.DoClick = function()
                bgframe:Close()
                nulerror:Remove()
            end

            -- Create the text
            local label = vgui.Create("DLabel", nulerror)
                label:CenterHorizontal(0.26)
                label:CenterVertical(0.5)
                label:SetFont("moon18")
                label:SetText(OBTConfig.NulError)
                label:SizeToContents()


        -- Verification first name
        elseif #entry1:GetValue() < 3 then

            local bgframe = vgui.Create("DFrame")
                bgframe:SetSize(scrw, scrh)
                bgframe:SetTitle("")
                bgframe:Center()
                bgframe:MakePopup(true)
                bgframe:ShowCloseButton(false)
                bgframe:SetDraggable(false)
                bgframe:SetBackgroundBlur(true)
                bgframe.Paint = function(self, w, h)
                    surface.SetDrawColor(15, 15, 15, 150)
                    surface.DrawRect(0, 0, w, h)
                end

            local nickerror = vgui.Create("DPanel", bgframe)
                nickerror:SetSize(panelx * .5, panely * .4)
                nickerror:Center()
                nickerror.Paint = function(self, w, h)
                    surface.SetDrawColor(OBTConfig.BGColor)
                    surface.DrawRect(0, 0, w, h)
                end

            local nickx, nicky = nickerror:GetSize(x, y)
            
            local mybtn = vgui.Create("DImageButton", nickerror)
                mybtn:SetPos(nickx-40, 8)
                mybtn:SetSize(32, 32)
                mybtn:SetImage("materials/assets/wx.png")

            mybtn.DoClick = function()
                bgframe:Close()
                nickerror:Remove()
            end

            local label = vgui.Create("DLabel", nickerror)
                label:CenterHorizontal(0.22)
                label:CenterVertical(0.5)
                label:SetFont("moon18")
                label:SetText(OBTConfig.NickError)
                label:SizeToContents()


        -- Verification last name
        elseif #entry2:GetValue() < 3 then

            local bgframe = vgui.Create("DFrame")
                bgframe:SetSize(scrw, scrh)
                bgframe:SetTitle("")
                bgframe:Center()
                bgframe:MakePopup(true)
                bgframe:ShowCloseButton(false)
                bgframe:SetDraggable(false)
                bgframe:SetBackgroundBlur(true)
                bgframe.Paint = function(self, w, h)
                    surface.SetDrawColor(15, 15, 15, 150)
                    surface.DrawRect(0, 0, w, h)
                end

            local nameerror = vgui.Create("DPanel", bgframe)
                nameerror:SetSize(panelx * .5, panely * .4)
                nameerror:Center()
                nameerror.Paint = function(self, w, h)
                    surface.SetDrawColor(OBTConfig.BGColor)
                    surface.DrawRect(0, 0, w, h)
                end

            local namex, namey = nameerror:GetSize(x, y)
            
            local mybtn = vgui.Create("DImageButton", nameerror)
                mybtn:SetPos(namex-40, 8)
                mybtn:SetSize(32, 32)
                mybtn:SetImage("materials/assets/wx.png")

            mybtn.DoClick = function()
                bgframe:Close()
                nameerror:Remove()
            end

            local label = vgui.Create("DLabel", nameerror)
                label:CenterHorizontal(0.22)
                label:CenterVertical(0.5)
                label:SetFont("moon18")
                label:SetText(OBTConfig.NameError)
                label:SizeToContents()


        -- if the verification for entry1 and entry2 is successfull, we are changing the player name
        else
            -- Getting the value of the entry's
            local nick = entry1:GetValue()
            local name = entry2:GetValue()

            -- Starting a net message
            net.Start("ObteyChangeName")

            net.WriteString(nick)
            net.WriteString(name)

            -- Sending the message to the server
            net.SendToServer()

            -- Closing all the frames and panels
            bgframe:Close()
            frame:Close()
            mypanel:Remove()
        
        end -- End of the verifications

    end -- End of submit button function

end -- Baseframe function end


-- This will open the Baseframe function when net message "Baseframe" is receive
net.Receive("Baseframe", Baseframe) 