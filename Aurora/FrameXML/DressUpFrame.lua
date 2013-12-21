local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.StripTextures(DressUpFrame, true);
	F.SetBD(DressUpFrame, 10, -12, -33, 73);
	
	F.ReskinClose(DressUpFrameCloseButton, 'TOPRIGHT', DressUpFrame, 'TOPRIGHT', -35, -16);
	
	F.ReskinArrow(DressUpModelRotateLeftButton, 'left');
	F.ReskinArrow(DressUpModelRotateRightButton, 'right');
	
	F.Reskin(DressUpFrameResetButton);
	F.Reskin(DressUpFrameCancelButton);
end)