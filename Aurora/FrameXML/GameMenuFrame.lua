local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local tinsert = table.insert;

local GAME_MENU_BUTTONS = {
	'GameMenuButtonOptions',
	'GameMenuButtonSoundOptions',
	'GameMenuButtonUIOptions',
	'GameMenuButtonMacOptions',
	'GameMenuButtonKeybindings',
	'GameMenuButtonMacros',
	'GameMenuButtonRatings',
	'GameMenuButtonLogout',
	'GameMenuButtonQuit',
	'GameMenuButtonContinue'
};

tinsert(C.Modules['Aurora'], function()
	F.CreateBD(GameMenuFrame);
	GameMenuFrameHeader:SetTexture(nil);
	
	do
		local Button;
	
		for i = 1, #GAME_MENU_BUTTONS do
			Button = _G[GAME_MENU_BUTTONS[i]];
			
			F.Reskin(Button);
		end
	end
end);