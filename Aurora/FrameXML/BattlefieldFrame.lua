local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.StripTextures(BattlefieldFrame, true);
	F.SetBD(BattlefieldFrame, 13, -11, -33, 74);
	
	BattlefieldFrameInfoScrollFrameChildFrameDescription:SetTextColor(1, 1, 1);
	BattlefieldFrameInfoScrollFrameChildFrameRewardsInfoDescription:SetTextColor(1, 1, 1);
	
	F.Reskin(BattlefieldFrameCancelButton);
	F.Reskin(BattlefieldFrameJoinButton);
	F.Reskin(BattlefieldFrameGroupJoinButton);
	
	F.ReskinClose(BattlefieldFrameCloseButton, 'TOPRIGHT', BattlefieldFrame, 'TOPRIGHT', -37, -15);
end);