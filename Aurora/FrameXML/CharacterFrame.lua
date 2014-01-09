local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.StripTextures(CharacterFrame, true);
	F.SetBD(CharacterFrame, 10, -12, -32, 76);
	
	F.ReskinClose(CharacterFrameCloseButton, 'TOPRIGHT', CharacterFrame, 'TOPRIGHT', -36, -16);
	
	for i = 1, #CHARACTERFRAME_SUBFRAMES do
		local Tab = _G['CharacterFrameTab'..i];
		
		F.ReskinTab(Tab);
	end
end)