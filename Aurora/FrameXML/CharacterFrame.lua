local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.SetBD(CharacterFrame, 13, -13, -32, 76);
	
	CharacterFramePortrait:Hide();
	
	F.ReskinClose(CharacterFrameCloseButton, 'TOPRIGHT', CharacterFrame, 'TOPRIGHT', -36, -17);
	
	for i = 1, #CHARACTERFRAME_SUBFRAMES do
		local Tab = _G['CharacterFrameTab'..i];
		
		F.ReskinTab(Tab);
	end
end)