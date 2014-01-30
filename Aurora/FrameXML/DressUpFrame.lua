local F, C = unpack(select(2, ...));

tinsert(C.modules['Aurora'], function()
	F.SetBD(DressUpFrame, 11, -12, -34, 73);
	
	DressUpFramePortrait:Hide();
	
	F.ReskinClose(DressUpFrameCloseButton, 'TOPRIGHT', DressUpFrame, 'TOPRIGHT', -38, -16);
	
	F.ReskinArrow(DressUpModelRotateLeftButton, 'left');
	F.ReskinArrow(DressUpModelRotateRightButton, 'right');
	
	F.Reskin(DressUpFrameResetButton);
	F.Reskin(DressUpFrameCancelButton);
end)