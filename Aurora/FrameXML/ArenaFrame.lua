local F, C = unpack(select(2, ...));

local select = select;
local tinsert = table.insert;

tinsert(C.Modules['Aurora'], function()
	F.SetBD(ArenaFrame, 11, -12, -34, 74);
	ArenaFramePortrait:Hide();
	
	for i = 2, 5 do
		select(i, ArenaFrame:GetRegions()):SetTexture(nil);
	end
	
	ArenaFrameDivider:SetTexture(nil);
	
	ArenaFrameZoneDescription:SetTextColor(1, 1, 1);
	
	F.Reskin(ArenaFrameCancelButton);
	F.Reskin(ArenaFrameJoinButton);
	F.Reskin(ArenaFrameGroupJoinButton);
	ArenaFrameGroupJoinButton:SetPoint('RIGHT', ArenaFrameJoinButton, 'LEFT', -1, 0);
	
	F.ReskinClose(ArenaFrameCloseButton, 'TOPRIGHT', ArenaFrame, 'TOPRIGHT', -38, -16);
end);