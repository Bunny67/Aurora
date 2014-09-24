local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

local BUTTONS = {
	'Options',
	'SoundOptions',
	'UIOptions',
	'MacOptions',
	'Keybindings',
	'Macros',
	'Ratings',
	'Logout',
	'Quit',
	'Continue'
};

tinsert(C.Modules['Aurora'], function()
	F:CreateBD(GameMenuFrame);
	GameMenuFrameHeader:SetTexture(nil);
	
	do
		local NumButtons = #BUTTONS;
		local Button;
		
		for i = 1, NumButtons do
			Button = _G['GameMenuButton'..BUTTONS[i]];
			
			F:Reskin(Button);
		end
	end
end);