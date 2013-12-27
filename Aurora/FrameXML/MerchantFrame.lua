local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.StripTextures(MerchantFrame, true);
	F.SetBD(MerchantFrame, 10, -12, -29, 61);
	
	F.ReskinClose(MerchantFrameCloseButton, 'TOPRIGHT', MerchantFrame, 'TOPRIGHT', -33, -16);
	
	F.StripTextures(MerchantBuyBackItem);

	for i = 1, 2 do
		F.ReskinTab(_G['MerchantFrameTab'..i])
	end

	for i = 1, 12 do
		local Item = _G['MerchantItem'..i]
		local ItemButton = _G['MerchantItem'..i..'ItemButton']
		local ItemButtonIconTexture = _G['MerchantItem'..i..'ItemButtonIconTexture']
		
		F.StripTextures(Item, true)
		F.CreateBD(Item, .25)
		
		F.StripTextures(ItemButton)
		F.StyleButton(ItemButton)
		F.CreateBD(ItemButton, .25)
		ItemButton:SetSize(44, 44)
		
		ItemButtonIconTexture:SetTexCoord(unpack(F.TexCoords))
		ItemButtonIconTexture:SetPoint('TOPLEFT', 1, -1)
		ItemButtonIconTexture:SetPoint('BOTTOMRIGHT', -1, 1)
		
		_G['MerchantItem'..i..'MoneyFrame']:ClearAllPoints()
		_G['MerchantItem'..i..'MoneyFrame']:SetPoint('BOTTOMLEFT', ItemButton, 'BOTTOMRIGHT', 2, 1)
	end
	
	F.StripTextures(MerchantBuyBackItemItemButton)
	F.StyleButton(MerchantBuyBackItemItemButton)
	F.CreateBD(MerchantBuyBackItemItemButton, .25)
	MerchantBuyBackItemItemButtonIconTexture:SetTexCoord(unpack(F.TexCoords))
	MerchantBuyBackItemItemButtonIconTexture:SetPoint('TOPLEFT', 1, -1)
	MerchantBuyBackItemItemButtonIconTexture:SetPoint('BOTTOMRIGHT', -1, 1)
	
	F.StyleButton(MerchantRepairItemButton)
	F.CreateBD(MerchantRepairItemButton, .25)
	local ItemButton = MerchantRepairItemButton:GetRegions()
	ItemButton:SetTexture('Interface\\Icons\\INV_Hammer_20')
	ItemButton:SetTexCoord(unpack(F.TexCoords))
	
	F.StyleButton(MerchantGuildBankRepairButton)
	F.CreateBD(MerchantGuildBankRepairButton, .25)
	MerchantGuildBankRepairButtonIcon:SetTexCoord(0.61, 0.82, 0.1, 0.52)
	MerchantGuildBankRepairButtonIcon:SetPoint('TOPLEFT', 1, -1)
	MerchantGuildBankRepairButtonIcon:SetPoint('BOTTOMRIGHT', -1, 1)
	
	F.StyleButton(MerchantRepairAllButton)
	F.CreateBD(MerchantRepairAllButton, .25)
	MerchantRepairAllIcon:SetTexCoord(0.34, 0.1, 0.34, 0.535, 0.535, 0.1, 0.535, 0.535)
	MerchantRepairAllIcon:SetPoint('TOPLEFT', 1, -1)
	MerchantRepairAllIcon:SetPoint('BOTTOMRIGHT', -1, 1)
	
	MerchantPrevPageButton:GetRegions():Hide();
	MerchantNextPageButton:GetRegions():Hide();
	select(2, MerchantPrevPageButton:GetRegions()):Hide();
	select(2, MerchantNextPageButton:GetRegions()):Hide();
	F.ReskinArrow(MerchantPrevPageButton, 'left');
	MerchantPrevPageButton:SetPoint('CENTER', MerchantFrame, 'BOTTOMLEFT', 33, 156);
	F.ReskinArrow(MerchantNextPageButton, 'right');
	MerchantNextPageButton:SetPoint('CENTER', MerchantFrame, 'BOTTOMLEFT', 332, 156);
end)