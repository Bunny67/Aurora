local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.StripTextures(MerchantFrame);
	F.SetBD(MerchantFrame, 10, -12, -33, 60);
	
	MerchantFramePortrait:Hide();
	
	for i = 1, BUYBACK_ITEMS_PER_PAGE do
		local Item = _G['MerchantItem'..i];
		local ItemButton = _G['MerchantItem'..i..'ItemButton'];
		local ItemButtonIconTexture = _G['MerchantItem'..i..'ItemButtonIconTexture'];
		
		F.StripTextures(Item, true);
		F.CreateBD(Item, .25);
		
		F.StripTextures(ItemButton);
		F.StyleButton(ItemButton);
		F.CreateBD(ItemButton);
		ItemButton:SetSize(44, 44);
		
		ItemButtonIconTexture:SetTexCoord(unpack(F.TexCoords));
		ItemButtonIconTexture:SetPoint('TOPLEFT', 1, -1);
		ItemButtonIconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
		
		for j = 1, 3 do
			local AltCurrencyTexture = _G['MerchantItem'..i..'AltCurrencyFrameItem'..j..'Texture'];
			
			AltCurrencyTexture:SetTexCoord(unpack(F.TexCoords));
		end
	end
	
	F.StyleButton(MerchantRepairAllButton);
	F.CreateBD(MerchantRepairAllButton);
	MerchantRepairAllIcon:SetTexCoord(0.31375, 0.53, 0.06, 0.52);
	
	F.StyleButton(MerchantRepairItemButton);
	F.CreateBD(MerchantRepairItemButton);
	local ItemButton = MerchantRepairItemButton:GetRegions();
	ItemButton:SetTexture('Interface\\Icons\\INV_Hammer_20');
	ItemButton:SetTexCoord(unpack(F.TexCoords));

	F.StyleButton(MerchantGuildBankRepairButton);
	F.CreateBD(MerchantGuildBankRepairButton);
	MerchantGuildBankRepairButtonIcon:SetTexCoord(0.595, 0.8075, 0.05, 0.52);
	
	F.StripTextures(MerchantBuyBackItem);
	F.StripTextures(MerchantBuyBackItemItemButton);
	F.StyleButton(MerchantBuyBackItemItemButton);
	F.CreateBD(MerchantBuyBackItemItemButton, 0);
	MerchantBuyBackItemItemButtonIconTexture:SetTexCoord(unpack(F.TexCoords));
	
	select(2, MerchantPrevPageButton:GetRegions()):Hide();
	F.ReskinArrow(MerchantPrevPageButton, 'left');
	
	select(2, MerchantNextPageButton:GetRegions()):Hide();
	F.ReskinArrow(MerchantNextPageButton, 'right');
	
	F.ReskinClose(MerchantFrameCloseButton, 'TOPRIGHT', MerchantFrame, 'TOPRIGHT', -38, -16);
	
	for i = 1, 2 do
		local Tab = _G['MerchantFrameTab'..i];
		
		F.ReskinTab(Tab);
	end
end);