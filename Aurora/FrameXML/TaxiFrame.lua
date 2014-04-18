local F, C = unpack(select(2, ...));

local select = select;

tinsert(C.Modules['Aurora'], function()
	F.SetBD(TaxiFrame, 11, -12, -34, 75);
	TaxiPortrait:Hide();
	
	for i = 2, 5 do
		select(i, TaxiFrame:GetRegions()):Hide();
	end
	
	F.ReskinClose(TaxiCloseButton, 'TOPRIGHT', TaxiFrame, 'TOPRIGHT', -38, -16);
	
	F.CreateBD(TaxiRouteMap, 0);
end);