local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.Modules['Aurora'], function()
	F.SetBD(WorldStateScoreFrame, 10, -15, -113, 68);
	
	F.StripTextures(WorldStateScoreScrollFrame, true);
	F.ReskinScroll(WorldStateScoreScrollFrameScrollBar);
	
	for i = 1, 3 do
		local Tab = _G['WorldStateScoreFrameTab'..i];
		
		F.ReskinTab(Tab);
	end
	
	F.Reskin(WorldStateScoreFrameLeaveButton);
	
	F.ReskinClose(WorldStateScoreFrameCloseButton, 'TOPRIGHT', WorldStateScoreFrame, 'TOPRIGHT', -117, -19);
end);