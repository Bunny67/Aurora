local F, C = unpack(select(2, ...))

tinsert(C.Modules['Aurora'], function()
	F.SetBD(ArenaFrame, 11, -12, -34, 74);
	ArenaFramePortrait:Hide();
	
	for i = 2, 5 do
		select(i, ArenaFrame:GetRegions()):Hide();
	end
	
	ArenaFrameDivider:Hide();
	
	ArenaFrameZoneDescription:SetTextColor(1, 1, 1);
	
	F.Reskin(ArenaFrameCancelButton);
	F.Reskin(ArenaFrameJoinButton);
	F.Reskin(ArenaFrameGroupJoinButton);
	
	F.ReskinClose(ArenaFrameCloseButton, 'TOPRIGHT', ArenaFrame, 'TOPRIGHT', -38, -16);
end)