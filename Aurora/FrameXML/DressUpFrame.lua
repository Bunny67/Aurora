local F, C = unpack(select(2, ...));

tinsert(C.modules['Aurora'], function()
	F.SetBD(DressUpFrame, 11, -12, -34, 73);
	DressUpFramePortrait:Hide();
	
	F.ReskinClose(DressUpFrameCloseButton, 'TOPRIGHT', DressUpFrame, 'TOPRIGHT', -38, -16);
	
	F.ReskinArrow(DressUpModelRotateLeftButton, 'Left');
	DressUpModelRotateRightButton:SetPoint('TOPLEFT', DressUpModelRotateLeftButton, 'TOPRIGHT', -1, 0);
	F.ReskinArrow(DressUpModelRotateRightButton, 'Right');
	
	F.Reskin(DressUpFrameCancelButton);
	DressUpFrameResetButton:SetPoint('RIGHT', DressUpFrameCancelButton, 'LEFT', -1, 0);
	F.Reskin(DressUpFrameResetButton);
end)