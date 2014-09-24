local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	F:SetBD(CharacterFrame, 13, -13, -32, 74);
	CharacterFramePortrait:Hide();
	
	F:ReskinClose(CharacterFrameCloseButton, 'TOPRIGHT', CharacterFrame, 'TOPRIGHT', -36, -17);
	
	do
		local tab;
		
		for i = 1, #CHARACTERFRAME_SUBFRAMES do
			tab = _G['CharacterFrameTab'..i];
			
			F:ReskinTab(tab);
		end
	end
end);