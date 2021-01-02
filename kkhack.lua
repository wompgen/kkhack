print("KKHack Loading...")
-- Bhop --
CreateClientConVar("kkhack_bunnyhop", 1, true, false)

function Bunnyhop()
	if GetConVar("kkhack_bunnyhop"):GetInt() == 1 then
	 	if input.IsKeyDown(KEY_SPACE) then
	 		if LocalPlayer():IsOnGround() then
	 			RunConsoleCommand("+jump")
	 			timer.Create("Bhop", 0, 0.01, function()
	 		 	RunConsoleCommand("-jump")
	 		 	
	 		 	end)
	 		end
	 	end
	end
end

hook.Add("Think", "Bunnyhop", Bunnyhop )

-- Flashlight --
CreateClientConVar("kkhack_flashlight", 0, true, false)

function Flashspam()
	if GetConVar("kkhack_flashlight"):GetInt() == 1 then
		if input.IsKeyDown(KEY_F) then
			RunConsoleCommand("impulse", "100")
			return end
	end
end



hook.Add("Think", "Flspam", Flashspam )

--NameChanger DarkRP--

local names = { 
"Debik", 
"Xren", 
"TXr", 
"Urbanihka", 
"Hello gays", 
"Tom Oblus", 
"Lennart Hupple", 
"Harry Kuss", 
"Willhelm Dumble", 
"Christopher Game", 
"Paul MacCardnay", 
"Elton Yon",
"Ashton Kitingson",
"Mick Momnay", 
"Dirk Dauer", 
"Ian Meow", 
"Ronald McGayben", 
"Gabe Oldwell", 
"Domnik Klein", 
"Lennerd Bearenhart", 
"Griffin Konst", 
"Plumber Jack", 
"Jack Black", 
"Grufer Hump", 

}



concommand.Add( "kkhack_namechange" , function()
LocalPlayer():ConCommand("say /rpname " ..table.Random(names).. "")




end )


CreateClientConVar("kkhack_esp", 0, true, false)
CreateClientConVar("kkhack_esp_printers", 0, true, false)

local function wallhack()
	if GetConVar("kkhack_esp"):GetInt() == 1 then
		for k, v in pairs (player.GetAll()) do
			local plypos = (v:GetPos() + Vector(0,0,80)):ToScreen()
			if v:IsAdmin() or v:IsSuperAdmin() then
				draw.DrawText("" ..v:Name().. "[Admin]", "TabLarge", plypos.x, plypos.y, Color(220,60,90,255), 1)
			else
				draw.DrawText(v:Name(), "Trebuchet18", plypos.x, plypos.y, Color(255,255,255), 1)
			end
		end
	end
end

hook.Add("HUDPaint", "ESP", wallhack)

-- Menu --

local DLabel3
local DLabel4
local DLabel2
local FlspamCheckbox
local BunnyCheckBox
local MainWindow
local UndoCheckBox
local LeaveCheckBox

MainWindow = vgui.Create('DFrame')
MainWindow:SetSize(400, 159)
MainWindow:Center()
MainWindow:SetTitle("KKHack - Cheat Garry's Mod")
MainWindow:SetSizable(true)
MainWindow:SetDeleteOnClose(false)
MainWindow:SetVisible(false)
MainWindow.Paint = function ( self, w, h )
	draw.RoundedBox(0, 0, 0, w, h, Color( 38, 38, 37, 300 ))
end
MainWindow:ShowCloseButton(false)
MainWindow:MakePopup()

BunnyCheckBox = vgui.Create('DCheckBoxLabel')
BunnyCheckBox:SetParent(MainWindow)
BunnyCheckBox:SetPos(10, 69)
BunnyCheckBox:SetText('Bunnyhop')
BunnyCheckBox:SetValue(true)
BunnyCheckBox:SetTextColor( Color(84, 84, 82) )
BunnyCheckBox:SetConVar("kkhack_bunnyhop")
BunnyCheckBox.DoClick = function() end
BunnyCheckBox:SizeToContents()

UndoCheckBox = vgui.Create('DCheckBoxLabel')
UndoCheckBox:SetParent(MainWindow)
UndoCheckBox:SetPos(10, 30)
UndoCheckBox:SetText('Flashundo - Активация зажатие буквы "P"')
UndoCheckBox:SetValue(true)
UndoCheckBox:SetTextColor( Color(84, 84, 82) )
UndoCheckBox:SetConVar("kkhack_undo")
UndoCheckBox.DoClick = function() end
UndoCheckBox:SizeToContents()

LeaveCheckBox = vgui.Create('DCheckBoxLabel')
LeaveCheckBox:SetParent(MainWindow)
LeaveCheckBox:SetPos(10, 45)
LeaveCheckBox:SetText('Leave - Активация нажатие буквы "K"')
LeaveCheckBox:SetValue(true)
LeaveCheckBox:SetTextColor( Color(84, 84, 82) )
LeaveCheckBox:SetConVar("kkhack_leave")
LeaveCheckBox.DoClick = function() end
LeaveCheckBox:SizeToContents()

FlspamCheckbox = vgui.Create('DCheckBoxLabel')
FlspamCheckbox:SetParent(MainWindow)
FlspamCheckbox:SetPos(10, 99)
FlspamCheckbox:SetTextColor( Color(84, 84, 82) )
FlspamCheckbox:SetText('Flashlight Spam')
FlspamCheckbox:SetConVar("kkhack_flashlight")
FlspamCheckbox.DoClick = function() end
FlspamCheckbox:SizeToContents()

DLabel2 = vgui.Create('DLabel')
DLabel2:SetParent(MainWindow)
DLabel2:SetPos(130, 100)
DLabel2:SetText('Нажмите "F" и у вас будет фонарик бешеным')
DLabel2:SizeToContents()
DLabel2:SetTextColor( Color(84, 84, 82) )

DLabel3 = vgui.Create('DLabel')
DLabel3:SetParent(MainWindow)
DLabel3:SetPos(130, 70)
DLabel3:SetText('Зажимайте пробел что бы бхопить')
DLabel3:SetTextColor( Color(84, 84, 82) )
DLabel3:SizeToContents()

DLabel4 = vgui.Create('DLabel')
DLabel4:SetParent(MainWindow)
DLabel4:SetPos(15, 126)
DLabel4:SetText('Аим - Аим всегда включен и сразу стреляет(LALT)')
DLabel4:SetTextColor( Color(84, 84, 82) )
DLabel4:SizeToContents()

DCheckBox4 = vgui.Create('DCheckBoxLabel')
DCheckBox4:SetParent(MainWindow)
DCheckBox4:SetPos(15, 140)
DCheckBox4:SetTextColor( Color(84, 84, 82) )
DCheckBox4:SetText('Simeple ESP +  admin recognition')
DCheckBox4:SetConVar("kkhack_esp")
DCheckBox4.DoClick = function() end
DCheckBox4:SizeToContents()



concommand.Add("kkhack_menu", KKhack_Menu)
concommand.Add("kkhack_menu_close", KKhack_menu_close)



local menu = 0

function KKhack_Menu()
	if menu == 0 then
		menu = 1
		MainWindow:SetVisible(true)
	else
		menu = 0
		MainWindow:SetVisible(false)
	end
end
function KKhack_menu_close()
	MainWindow:SetVisible(false)
end

function InsMenu()

	if input.IsKeyDown(KEY_INSERT) then
		KKhack_Menu()
	end
end




hook.Add("Think", "Menu", InsMenu )

local util = util;
local player = player;
local input = input;
local bit = bit;
local hook = hook;
local me = LocalPlayer();
local aimtarget;
local KEY_LALT = KEY_LALT;
local MASK_SHOT = MASK_SHOT;
 
local function GetPos(v)
        local eyes = v:LookupAttachment("eyes");
        return(eyes && v:GetAttachment(eyes).Pos || v:LocalToWorld(v:OBBCenter()));
end
 
local function Valid(v)
        if(!v || !v:IsValid() || v:Health() < 1 || v:IsDormant() || v == me) then return false; end
        local trace = {
                mask = MASK_SHOT,
                endpos = GetPos(v),
                start = me:EyePos(),
                filter = {me, v},
        };
        return(util.TraceLine(trace).Fraction == 1);
end
 
local function GetTarget()
        if (Valid(aimtarget)) then return; end
        aimtarget = nil;
        local allplys = player.GetAll();
        for i = 1, #allplys do
                local v = allplys[i];
                if (!Valid(v)) then continue; end
                aimtarget = v;
                return;
        end
end
 
hook.Add("CreateMove", "", function(ucmd)
        GetTarget();
        if (input.IsKeyDown(KEY_LALT) && aimtarget) then
                local pos = (GetPos(aimtarget) - me:EyePos()):Angle();
                ucmd:SetViewAngles(pos);

                ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 1));
                -- ^autofire
        end
end)

CreateClientConVar("kkhack_undo", 0, true, false)

function Undo()
	if GetConVar("kkhack_undo"):GetInt() == 1 then
		if input.IsKeyDown(KEY_P) then
			RunConsoleCommand("undo", "100")
			return end
	end
end

hook.Add("Think", "Undo", Undo )

-- leave
CreateClientConVar("kkhack_leave", 0, true, false)
function leave()
	if GetConVar("kkhack_leave"):GetInt() == 1 then
		if input.IsKeyDown(KEY_K) then
			RunConsoleCommand("killserver", "100")
			return end
	end
end

hook.Add("Think", "leave", leave )