local F, C = unpack(select(2, ...));

tinsert(C.modules['Aurora'], function()
	F.SetBD(BattlefieldFrame, 12, -12, -34, 74);
	
	BattlefieldFrameInfoScrollFrameChildFrameDescription:SetTextColor(1, 1, 1);
	BattlefieldFrameInfoScrollFrameChildFrameRewardsInfoDescription:SetTextColor(1, 1, 1);
	
	F.Reskin(BattlefieldFrameCancelButton);
	F.Reskin(BattlefieldFrameJoinButton);
	F.Reskin(BattlefieldFrameGroupJoinButton);
	
	F.ReskinClose(BattlefieldFrameCloseButton, 'TOPRIGHT', BattlefieldFrame, 'TOPRIGHT', -38, -16);
end);