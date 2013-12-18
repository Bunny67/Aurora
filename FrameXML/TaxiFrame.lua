local F, C = unpack(select(2, ...))

tinsert(C.modules['Aurora'], function()
	local AllTaxiFrameStripTextures = {'TaxiFrame'}
	for i = 1, #AllTaxiFrameStripTextures do
		F.StripTextures(_G[AllTaxiFrameStripTextures[i]])
	end
	
	TaxiPortrait:Hide()
	F.SetBD(TaxiFrame, 10, -12, -31, 76)
	F.ReskinClose(TaxiCloseButton, 'TOPRIGHT', TaxiFrame, 'TOPRIGHT', -38, -16)
	F.CreateBD(TaxiRouteMap, 0)
end)