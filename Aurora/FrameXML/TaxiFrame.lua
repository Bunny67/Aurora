local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	F.SetBD(TaxiFrame, 11, -12, -34, 75);
	TaxiPortrait:Hide();
	
	F.ReskinClose(TaxiCloseButton, 'TOPRIGHT', TaxiFrame, 'TOPRIGHT', -38, -16);
	
	F.CreateBD(TaxiRouteMap, 0);
end);