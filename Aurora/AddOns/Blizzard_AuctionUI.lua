local F, C = unpack(select(2, ...))

local _G = _G
local r, g, b = C.classcolours[F.Class].r, C.classcolours[F.Class].g, C.classcolours[F.Class].b

C.modules['Blizzard_AuctionUI'] = function()
	local AllAuctionUIStripTextures = {'AuctionFrame', 'BrowseFilterScrollFrame', 'BrowseScrollFrame', 'BidScrollFrame', 'AuctionsScrollFrame'}
	for i = 1, #AllAuctionUIStripTextures do
		F.StripTextures(_G[AllAuctionUIStripTextures[i]], true);
	end
	
	F.ReskinDropDown(_G['PriceDropDown']);
	F.ReskinDropDown(_G['DurationDropDown']);
	
	BrowseDropDownLeft:SetAlpha(0);
	BrowseDropDownMiddle:SetAlpha(0);
	BrowseDropDownRight:SetAlpha(0);

	local a1, p, a2, x, y = BrowseDropDownButton:GetPoint();
	BrowseDropDownButton:SetPoint(a1, p, a2, x, y-4);
	BrowseDropDownButton:SetSize(16, 16);
	F.Reskin(BrowseDropDownButton, true);

	local tex = BrowseDropDownButton:CreateTexture(nil, 'OVERLAY');
	tex:SetTexture(C.media.arrowDown);
	tex:SetSize(8, 8);
	tex:SetPoint('CENTER');
	tex:SetVertexColor(1, 1, 1);
	BrowseDropDownButton.tex = tex;

	local bg = CreateFrame('Frame', nil, BrowseDropDown);
	bg:SetPoint('TOPLEFT', 16, -5);
	bg:SetPoint('BOTTOMRIGHT', 109, 11);
	bg:SetFrameLevel(BrowseDropDown:GetFrameLevel(-1));
	F.CreateBD(bg, 0);
	F.CreateGradient(bg);

	local AllAuctionUIScrollbars = {'BrowseFilterScrollFrameScrollBar', 'BrowseScrollFrameScrollBar', 'BidScrollFrameScrollBar', 'AuctionsScrollFrameScrollBar'}
	for i = 1, #AllAuctionUIScrollbars do
		F.ReskinScroll(_G[AllAuctionUIScrollbars[i]])
	end
	
	local AllAuctionUIInputs = {'BrowseName', 'BrowseMinLevel', 'BrowseMaxLevel', 'BrowseBidPriceGold', 'BrowseBidPriceSilver', 'BrowseBidPriceCopper', 'BidBidPriceGold', 'BidBidPriceSilver', 'BidBidPriceCopper', 'AuctionsStackSizeEntry', 'AuctionsNumStacksEntry', 'StartPriceGold', 'StartPriceSilver', 'StartPriceCopper', 'BuyoutPriceGold', 'BuyoutPriceSilver', 'BuyoutPriceCopper'}
	for i = 1, #AllAuctionUIInputs do
		F.ReskinInput(_G[AllAuctionUIInputs[i]])
	end
	
	F.ReskinCheck(_G['IsUsableCheckButton']);
	F.ReskinCheck(_G['ShowOnPlayerCheckButton']);
	
	for i = 1, 3 do
		F.ReskinTab(_G['AuctionFrameTab'..i]);
	end
	
	local AllAuctionUISortTabs = {'BrowseQualitySort', 'BrowseLevelSort', 'BrowseDurationSort', 'BrowseHighBidderSort', 'BrowseCurrentBidSort', 'BidQualitySort', 'BidLevelSort', 'BidDurationSort', 'BidBuyoutSort', 'BidStatusSort', 'BidBidSort', 'AuctionsQualitySort', 'AuctionsDurationSort', 'AuctionsHighBidderSort', 'AuctionsBidSort'}
	for _, AllAuctionUISortTab in pairs(AllAuctionUISortTabs) do
		F.Kill(_G[AllAuctionUISortTab..'Left']);
		F.Kill(_G[AllAuctionUISortTab..'Middle']);
		F.Kill(_G[AllAuctionUISortTab..'Right']);
		_G[AllAuctionUISortTab]:SetHighlightTexture(C.media.backdrop);
		local ght = _G[AllAuctionUISortTab]:GetHighlightTexture();
		ght:SetVertexColor(r, g, b, .25)
	end
	
	local AllAuctionUIButtons = {'BrowseResetButton', 'BrowseSearchButton', 'BrowseBidButton', 'BrowseBuyoutButton', 'BrowseCloseButton', 'BidBidButton', 'BidBuyoutButton', 'BidCloseButton', 'AuctionsCloseButton'}
	for i = 1, #AllAuctionUIButtons do
		F.Reskin(_G[AllAuctionUIButtons[i]]);
	end
	
	F.Reskin(_G['AuctionsStackSizeMaxButton'], nil, true);
	F.Reskin(_G['AuctionsNumStacksMaxButton'], nil, true);
	F.Reskin(_G['AuctionsCreateAuctionButton'], nil, true);
	F.Reskin(_G['AuctionsCancelAuctionButton'], nil, true);
	
	for i=1, NUM_FILTERS_TO_DISPLAY do
		local btn = _G['AuctionFilterButton'..i];
		F.StripTextures(btn);
		F.StyleButton(btn);
	end
	
	for i = 1, NUM_BROWSE_TO_DISPLAY do
		local bu = _G["BrowseButton"..i];
		local it = _G["BrowseButton"..i.."Item"];
		
		if _G["BrowseButton"..i.."ItemIconTexture"] then
			_G["BrowseButton"..i.."ItemIconTexture"]:SetTexCoord(.08, .92, .08, .92);
		end
		
		if bu and it then
			it:SetNormalTexture("");
			F.StyleButton(it);
			F.CreateBG(it);
			
			F.StripTextures(bu)
			local bd = CreateFrame("Frame", nil, bu)
			bd:SetPoint("TOPLEFT")
			bd:SetPoint("BOTTOMRIGHT", 0, 5)
			bd:SetFrameLevel(bu:GetFrameLevel()-1)
			F.CreateBD(bd, .25)

			bu:SetHighlightTexture(C.media.backdrop)
			local hl = bu:GetHighlightTexture()
			hl:SetVertexColor(r, g, b, .25)
			hl:ClearAllPoints()
			hl:SetPoint("TOPLEFT", 0, -1)
			hl:SetPoint("BOTTOMRIGHT", -1, 6)
		end
	end

	for i = 1, NUM_BIDS_TO_DISPLAY do
		local bu = _G["BidButton"..i]
		local it = _G["BidButton"..i.."Item"]
		
		if _G["BidButton"..i.."ItemIconTexture"] then
			_G["BidButton"..i.."ItemIconTexture"]:SetTexCoord(.08, .92, .08, .92)
		end

		it:SetNormalTexture("")
		F.StyleButton(it)
		F.CreateBG(it)

		F.StripTextures(bu)
		local bd = CreateFrame("Frame", nil, bu)
		bd:SetPoint("TOPLEFT")
		bd:SetPoint("BOTTOMRIGHT", 0, 5)
		bd:SetFrameLevel(bu:GetFrameLevel()-1)
		F.CreateBD(bd, .25)

		bu:SetHighlightTexture(C.media.backdrop)
		local hl = bu:GetHighlightTexture()
		hl:SetVertexColor(r, g, b, .25)
		hl:ClearAllPoints()
		hl:SetPoint("TOPLEFT", 0, -1)
		hl:SetPoint("BOTTOMRIGHT", -1, 6)
	end

	for i = 1, NUM_AUCTIONS_TO_DISPLAY do
		local bu = _G["AuctionsButton"..i]
		local it = _G["AuctionsButton"..i.."Item"]
		
		if _G["AuctionsButton"..i.."ItemIconTexture"] then
			_G["AuctionsButton"..i.."ItemIconTexture"]:SetTexCoord(.08, .92, .08, .92)
		end

		it:SetNormalTexture("")
		F.StyleButton(it)
		F.CreateBG(it)

		F.StripTextures(bu)
		local bd = CreateFrame("Frame", nil, bu)
		bd:SetPoint("TOPLEFT")
		bd:SetPoint("BOTTOMRIGHT", 0, 5)
		bd:SetFrameLevel(bu:GetFrameLevel()-1)
		F.CreateBD(bd, .25)

		bu:SetHighlightTexture(C.media.backdrop)
		local hl = bu:GetHighlightTexture()
		hl:SetVertexColor(r, g, b, .25)
		hl:ClearAllPoints()
		hl:SetPoint("TOPLEFT", 0, -1)
		hl:SetPoint("BOTTOMRIGHT", -1, 6)
	end
	
	F.StripTextures(AuctionsItemButton)
	F.StyleButton(AuctionsItemButton)
	F.CreateBD(AuctionsItemButton, .25)

	AuctionsItemButton:SetScript("OnUpdate", function()
		if AuctionsItemButton:GetNormalTexture() then
			AuctionsItemButton:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
		end
	end)
	
	F.SetBD(AuctionFrame, 10, -12, 0, 10)
	F.ReskinClose(AuctionFrameCloseButton, 'TOPRIGHT', AuctionFrame, 'TOPRIGHT', -4, -16)
	F.ReskinArrow(BrowsePrevPageButton, "left")
	F.ReskinArrow(BrowseNextPageButton, "right")
end