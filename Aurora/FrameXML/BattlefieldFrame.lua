local F, C = unpack(select(2, ...));

local select = select;
local tinsert = table.insert;

tinsert(C.Modules['Aurora'], function()
	F:SetBD(BattlefieldFrame, 12, -12, -34, 74);
	BattlefieldFramePortrait:Hide();
	
	for i = 2, 5 do
		select(i, BattlefieldFrame:GetRegions()):SetTexture(nil);
	end
	
	select(8, BattlefieldFrame:GetRegions()):SetTexture(nil);
	
	BattlefieldFrameInfoScrollFrameChildFrameDescription:SetTextColor(1, 1, 1);
	BattlefieldFrameInfoScrollFrameChildFrameRewardsInfoDescription:SetTextColor(1, 1, 1);
	
	F:Reskin(BattlefieldFrameCancelButton);
	F:Reskin(BattlefieldFrameJoinButton);
	BattlefieldFrameGroupJoinButton:SetPoint('RIGHT', BattlefieldFrameJoinButton, 'LEFT', -1, 0);
	F:Reskin(BattlefieldFrameGroupJoinButton);
	
	F:ReskinClose(BattlefieldFrameCloseButton, 'TOPRIGHT', BattlefieldFrame, 'TOPRIGHT', -38, -16);
end);