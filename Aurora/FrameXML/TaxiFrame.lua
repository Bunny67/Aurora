local F, C = unpack(select(2, ...));

tinsert(C.modules['Aurora'], function()
	F.StripTextures(TaxiFrame);
	F.SetBD(TaxiFrame, 10, -12, -34, 75);
	
	TaxiPortrait:Hide();
	
	F.ReskinClose(TaxiCloseButton, 'TOPRIGHT', TaxiFrame, 'TOPRIGHT', -38, -16);
	
	F.CreateBD(TaxiRouteMap, 0);
end);