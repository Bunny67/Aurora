local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local select = select;
local tinsert = table.insert;

tinsert(C.Modules['Aurora'], function()
	F.SetBD(WorldStateScoreFrame, 12, -16, -115, 71);
	
	for i = 1, 6 do
		select(i, WorldStateScoreFrame:GetRegions()):SetTexture(nil);
	end
	
	WorldStateScoreFrameTopBackground:SetTexture(nil);
	
	WorldStateScoreScrollFrame:DisableDrawLayer('ARTWORK');
	F.ReskinScroll(WorldStateScoreScrollFrameScrollBar);
	
	do
		local Tab;
		
		for i = 1, 3 do
			Tab = _G['WorldStateScoreFrameTab'..i];
			
			Tab:DisableDrawLayer('BACKGROUND');
			
			Tab.BG = CreateFrame('Frame', nil, Tab);
			Tab.BG:SetPoint('TOPLEFT', 9, 3);
			Tab.BG:SetPoint('BOTTOMRIGHT', -8, 9);
			Tab.BG:SetFrameLevel(Tab:GetFrameLevel() - 1);
			F.CreateBD(Tab.BG);
			
			Tab:SetHighlightTexture(C.Media.Backdrop);
			Tab:GetHighlightTexture():ClearAllPoints();
			Tab:GetHighlightTexture():SetPoint('TOPLEFT', 10, 2);
			Tab:GetHighlightTexture():SetPoint('BOTTOMRIGHT', -9, 10);
			Tab:GetHighlightTexture():SetVertexColor(C.r, C.g, C.b, .25);
		end
	end
	
	F.Reskin(WorldStateScoreFrameLeaveButton);
	
	F.ReskinClose(WorldStateScoreFrameCloseButton, 'TOPRIGHT', WorldStateScoreFrame, 'TOPRIGHT', -119, -20);
end);