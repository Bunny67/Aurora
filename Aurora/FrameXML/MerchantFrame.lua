local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.SetBD(MerchantFrame, 10, -12, -34, 60);
	
	MerchantFramePortrait:Hide();
	
	for i = 1, BUYBACK_ITEMS_PER_PAGE do
		local itemButton = _G['MerchantItem'..i..'ItemButton'];
		local itemButtonIconTexture = _G['MerchantItem'..i..'ItemButtonIconTexture'];
		local merchantButton = _G['MerchantItem'..i];
		local merchantMoney = _G['MerchantItem'..i..'MoneyFrame'];
		
		itemButton:SetNormalTexture('');
		
		F.StyleButton(itemButton);
		F.CreateBD(itemButton, 0);
		
		local arg1, arg2, arg3 = itemButton:GetPoint();
		itemButton:SetPoint(arg1, arg2, arg3, -2, -2);
		itemButton:SetSize(40, 40);
		
		itemButtonIconTexture:ClearAllPoints();
		itemButtonIconTexture:SetPoint('TOPLEFT', 1, -1);
		itemButtonIconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
		itemButtonIconTexture:SetTexCoord(unpack(F.TexCoords));
		
		_G['MerchantItem'..i..'SlotTexture']:Hide();
		_G['MerchantItem'..i..'NameFrame']:Hide();
		
		merchantButton.BD = CreateFrame('Frame', nil, merchantButton);
		merchantButton.BD:SetPoint('BOTTOMRIGHT', 0, 0);
		merchantButton.BD:SetFrameLevel(merchantButton:GetFrameLevel() - 1);
		F.CreateBD(merchantButton.BD, .25);
		
		local arg4, arg5, arg6, arg7, arg8 = merchantMoney:GetPoint();
		merchantMoney:SetPoint(arg4, arg5, arg6, arg7, arg8 + 2);
		
		for j = 1, 3 do
			local merchantAltCurrencyTexture = _G['MerchantItem'..i..'AltCurrencyFrameItem'..j..'Texture'];
			
			merchantAltCurrencyTexture:SetTexCoord(unpack(F.TexCoords));
		end
	end
	
	F.StyleButton(MerchantRepairAllButton); -- MerchantRepairAllButton
	F.CreateBD(MerchantRepairAllButton);
	MerchantRepairAllIcon:ClearAllPoints();
	MerchantRepairAllIcon:SetPoint('TOPLEFT', 1, -1);
	MerchantRepairAllIcon:SetPoint('BOTTOMRIGHT', -1, 1);
	MerchantRepairAllIcon:SetTexCoord(0.31375, 0.53, 0.06, 0.52);
	
	F.StyleButton(MerchantRepairItemButton); -- MerchantRepairItemButton;
	F.CreateBD(MerchantRepairItemButton);
	local ItemButton = MerchantRepairItemButton:GetRegions();
	ItemButton:SetTexture('Interface\\Icons\\INV_Hammer_20');
	ItemButton:SetTexCoord(unpack(F.TexCoords));

	F.StyleButton(MerchantGuildBankRepairButton); -- MerchantGuildBankRepairButton;
	F.CreateBD(MerchantGuildBankRepairButton);
	MerchantGuildBankRepairButtonIcon:ClearAllPoints();
	MerchantGuildBankRepairButtonIcon:SetPoint('TOPLEFT', 1, -1);
	MerchantGuildBankRepairButtonIcon:SetPoint('BOTTOMRIGHT', -1, 1);
	MerchantGuildBankRepairButtonIcon:SetTexCoord(0.595, 0.8075, 0.05, 0.52);
	
	F.StripTextures(MerchantBuyBackItem); -- MerchantBuyBackItem;
	F.CreateBD(MerchantBuyBackItem, .25);
	MerchantBuyBackItemSlotTexture:Hide();
	MerchantBuyBackItemNameFrame:Hide()
	MerchantBuyBackItemItemButton:SetNormalTexture('');
	F.StyleButton(MerchantBuyBackItemItemButton);
	F.CreateBD(MerchantBuyBackItemItemButton, 0);
	MerchantBuyBackItemItemButtonIconTexture:ClearAllPoints();
	MerchantBuyBackItemItemButtonIconTexture:SetPoint('TOPLEFT', 1, -1);
	MerchantBuyBackItemItemButtonIconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
	MerchantBuyBackItemItemButtonIconTexture:SetTexCoord(unpack(F.TexCoords));
	
	select(2, MerchantPrevPageButton:GetRegions()):Hide();
	F.ReskinArrow(MerchantPrevPageButton, 'left');
	
	select(2, MerchantNextPageButton:GetRegions()):Hide();
	F.ReskinArrow(MerchantNextPageButton, 'right');
	
	F.ReskinClose(MerchantFrameCloseButton, 'TOPRIGHT', MerchantFrame, 'TOPRIGHT', -38, -16);
	
	for i = 1, MerchantFrame.numTabs do
		local Tab = _G['MerchantFrameTab'..i];
		
		F.ReskinTab(Tab);
	end
	
	MerchantFrameTab2:SetPoint('LEFT', MerchantFrameTab1, 'RIGHT', -15, 0);
	
	hooksecurefunc('MerchantFrame_UpdateMerchantInfo', function()
		local numMerchantItems = GetMerchantNumItems();
		
		local name, texture, price, quantity, numAvailable, isUsable, extendedCost;
		for i = 1, BUYBACK_ITEMS_PER_PAGE do
			local index = (((MerchantFrame.page - 1) * MERCHANT_ITEMS_PER_PAGE) + i);
			local itemButton = _G['MerchantItem'..i..'ItemButton'];
			local itemName = _G['MerchantItem'..i..'Name'];
			local merchantButton = _G['MerchantItem'..i];
			local merchantAltCurrency = _G['MerchantItem'..i..'AltCurrencyFrame'];
			
			if ( index <= numMerchantItems ) then
				name, texture, price, quantity, numAvailable, isUsable, extendedCost = GetMerchantItemInfo(index);
				
				merchantButton.BD:SetPoint('TOPLEFT', 39, 0);
				
				if ( extendedCost and (price <= 0) ) then
					merchantAltCurrency:SetPoint('BOTTOMLEFT', 'MerchantItem'..i..'NameFrame', 'BOTTOMLEFT', 0, 35);
				end
				
				if ( AuroraConfig.qualityColour ) then
					if ( itemButton.link ) then
						local _, _, quality = GetItemInfo(itemButton.link);
						local r, g, b = GetItemQualityColor(quality);
						
						itemName:SetTextColor(r, g, b);
					else
						itemName:SetTextColor(1, 1, 1);
					end
				end
			else
				merchantButton.BD:SetPoint('TOPLEFT', -2, 0);
			end
			
			if ( AuroraConfig.qualityColour ) then
				local buybackName = GetBuybackItemInfo(GetNumBuybackItems());
				
				if ( buybackName ) then
					local _, _, quality = GetItemInfo(buybackName);
					local r, g, b = GetItemQualityColor(quality);

					MerchantBuyBackItemName:SetTextColor(r, g, b);
				end
			end
		end
	end);
	
	hooksecurefunc('MerchantFrame_UpdateBuybackInfo', function()
		local numBuybackItems = GetNumBuybackItems();
		
		local buybackName;
		for i = 1, BUYBACK_ITEMS_PER_PAGE do
			local itemName = _G['MerchantItem'..i..'Name'];
			local merchantButton = _G['MerchantItem'..i];
			
			if ( i <= numBuybackItems ) then
				buybackName = GetBuybackItemInfo(i);
				
				merchantButton.BD:SetPoint('TOPLEFT', 39, 0);
				
				if ( buybackName ) then
					local _, _, quality = GetItemInfo(buybackName);
					local r, g, b = GetItemQualityColor(quality);
					
					itemName:SetTextColor(r, g, b);
				else
					itemName:SetTextColor(1, 1, 1);
				end
			else
				merchantButton.BD:SetPoint('TOPLEFT', -2, 0);
			end
		end
	end);
end);