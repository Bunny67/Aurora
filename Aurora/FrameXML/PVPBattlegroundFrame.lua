local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	PVPBattlegroundFramePortrait:Hide();
	
	for i = 2, 5 do
		select(i, PVPBattlegroundFrame:GetRegions()):SetTexture(nil);
	end
	
	PVPBattlegroundFrameBGTex:Hide();
	
	PVPBattlegroundFrameTypeScrollFrame:DisableDrawLayer('ARTWORK');
	F:ReskinScroll(PVPBattlegroundFrameTypeScrollFrameScrollBar);
	
	F:Reskin(PVPBattlegroundFrameCancelButton);
	
	PVPBattlegroundFrameInfoScrollFrame.scrollBarBackground:SetTexture(nil);
	
	PVPBattlegroundFrameInfoScrollFrameScrollBar:DisableDrawLayer('ARTWORK');
	F:ReskinScroll(PVPBattlegroundFrameInfoScrollFrameScrollBar);
	
	PVPBattlegroundFrameInfoScrollFrameChildFrameDescription:SetTextColor(1, 1, 1);
	PVPBattlegroundFrameInfoScrollFrameChildFrameRewardsInfo.description:SetTextColor(1, 1, 1);
	
	F:Reskin(PVPBattlegroundFrameJoinButton);
	PVPBattlegroundFrameGroupJoinButton:SetPoint('RIGHT', PVPBattlegroundFrameJoinButton, 'LEFT', -1, 0);
	F:Reskin(PVPBattlegroundFrameGroupJoinButton);
end);