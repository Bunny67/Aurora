local F, C = unpack(select(2, ...));

tinsert(C.modules['Aurora'], function()
	PVPBattlegroundFramePortrait:Hide();
	
	for i = 1, PVPBattlegroundFrame:GetNumRegions() do
		local Region = select(i, PVPBattlegroundFrame:GetRegions());
		
		if ( Region and Region:GetObjectType() == 'Texture' ) then
			Region:Hide();
		end
	end
	
	PVPBattlegroundFrameTypeScrollFrame:DisableDrawLayer('ARTWORK');
	F.ReskinScroll(PVPBattlegroundFrameTypeScrollFrameScrollBar);
	
	F.Reskin(PVPBattlegroundFrameCancelButton);
	
	PVPBattlegroundFrameInfoScrollFrameChildFrameDescription:SetTextColor(1, 1, 1);
	PVPBattlegroundFrameInfoScrollFrameChildFrameRewardsInfo.description:SetTextColor(1, 1, 1);
	
	F.Reskin(PVPBattlegroundFrameJoinButton);
	PVPBattlegroundFrameGroupJoinButton:SetPoint('RIGHT', PVPBattlegroundFrameJoinButton, 'LEFT', -1, 0);
	F.Reskin(PVPBattlegroundFrameGroupJoinButton);
end)