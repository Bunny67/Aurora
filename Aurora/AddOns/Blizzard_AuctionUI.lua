local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;
local select = select;

C.modules['Blizzard_AuctionUI'] = function()
	local function AuctionSortButton(Frame)
		Frame:DisableDrawLayer('BACKGROUND');

		local BG = CreateFrame('Frame', nil, Frame);
		BG:SetPoint('TOPLEFT', 2, 0);
		BG:SetPoint('BOTTOMRIGHT', -1, 0);
		BG:SetFrameLevel(Frame:GetFrameLevel() -1 );
		F.CreateBD(BG, 0);
		F.CreateGradient(BG);
		
		Frame:SetHighlightTexture(C.media.backdrop);
		Frame:GetHighlightTexture():ClearAllPoints();
		Frame:GetHighlightTexture():SetPoint('TOPLEFT', 3, -1);
		Frame:GetHighlightTexture():SetPoint('BOTTOMRIGHT', -2, 1);
		Frame:GetHighlightTexture():SetVertexColor(C.r, C.g, C.b, .25);
	end
	-- AuctionFrame;
	AuctionFrame:DisableDrawLayer('BACKGROUND');
	AuctionFrame:DisableDrawLayer('ARTWORK');
	
	F.SetBD(AuctionFrame, 11, -12, -1, 10);
	
	for i = 1, 3 do
		local Tab = _G['AuctionFrameTab'..i];
		
		F.ReskinTab(Tab);
	end
	
	F.ReskinClose(AuctionFrameCloseButton, 'TOPRIGHT', AuctionFrame, 'TOPRIGHT', -5, -16);
	-- AuctionFrameBrowse;
	for i = 1, NUM_FILTERS_TO_DISPLAY do
		local Button = _G['AuctionFilterButton'..i];
		
		Button:DisableDrawLayer('BACKGROUND');
		Button:GetNormalTexture():SetTexture(nil);
		
		F.StyleButton(Button);
	end
	
	BrowseFilterScrollFrame:DisableDrawLayer('ARTWORK');
	F.ReskinScroll(BrowseFilterScrollFrameScrollBar);
	
	BrowseScrollFrame:DisableDrawLayer('ARTWORK');
	F.ReskinScroll(BrowseScrollFrameScrollBar);
	
	AuctionSortButton(BrowseQualitySort);
	AuctionSortButton(BrowseLevelSort);
	AuctionSortButton(BrowseDurationSort);
	AuctionSortButton(BrowseHighBidderSort);
	AuctionSortButton(BrowseCurrentBidSort);
	
	for i = 1, NUM_BROWSE_TO_DISPLAY do
		local Button = _G['BrowseButton'..i];
		local Item = _G['BrowseButton'..i..'Item'];
		local ItemIconTexture = _G['BrowseButton'..i..'ItemIconTexture'];
		
		_G['BrowseButton'..i..'Left']:Hide();
		_G['BrowseButton'..i..'Right']:Hide();
		
		select(6, Button:GetRegions()):Hide();
		
		Button:SetHighlightTexture(C.media.backdrop);
		Button:GetHighlightTexture():SetVertexColor(C.r, C.g, C.b, .25);
		Button:GetHighlightTexture():ClearAllPoints();
		Button:GetHighlightTexture():SetPoint('TOPLEFT', 0, -1);
		Button:GetHighlightTexture():SetPoint('BOTTOMRIGHT', -1, 6);
		
		local BD = CreateFrame('Frame', nil, Button);
		BD:SetPoint('TOPLEFT');
		BD:SetPoint('BOTTOMRIGHT', 0, 5);
		BD:SetFrameLevel(Button:GetFrameLevel() - 1);
		F.CreateBD(BD, .25);
		
		Item:SetNormalTexture(nil);
		F.StyleButton(Item);
		F.CreateBG(Item);
		
		Item.Hover:SetAllPoints();
		Item.Pushed:SetAllPoints();
		
		ItemIconTexture:SetTexCoord(unpack(F.TexCoords));
	end
	
	F.ReskinInput(BrowseName);
	F.ReskinInput(BrowseMinLevel);
	F.ReskinInput(BrowseMaxLevel);
	
	BrowseDropDownLeft:SetAlpha(0);
	BrowseDropDownMiddle:SetAlpha(0);
	BrowseDropDownRight:SetAlpha(0);

	local a1, p, a2, x, y = BrowseDropDownButton:GetPoint();
	BrowseDropDownButton:SetPoint(a1, p, a2, x, y-4);
	BrowseDropDownButton:SetSize(16, 16);
	F.Reskin(BrowseDropDownButton, true);

	local Texture = BrowseDropDownButton:CreateTexture(nil, 'OVERLAY');
	Texture:SetTexture(C.media.arrowDown);
	Texture:SetSize(8, 8);
	Texture:SetPoint('CENTER');
	Texture:SetVertexColor(1, 1, 1);
	BrowseDropDownButton.Texture = Texture;
	
	BrowseDropDownButton:HookScript('OnEnter', F.ColourArrow);
	BrowseDropDownButton:HookScript('OnLeave', F.ClearArrow);
	
	local bg = CreateFrame('Frame', nil, BrowseDropDown);
	bg:SetPoint('TOPLEFT', 22, -5);
	bg:SetPoint('BOTTOMRIGHT', 109, 11);
	bg:SetFrameLevel(BrowseDropDown:GetFrameLevel() - 1);
	F.CreateBD(bg, 0);
	F.CreateGradient(bg);
	
	F.ReskinCheck(IsUsableCheckButton);
	F.ReskinCheck(ShowOnPlayerCheckButton);
	
	F.Reskin(BrowseSearchButton);
	
	F.ReskinArrow(BrowsePrevPageButton, 'left');
	F.ReskinArrow(BrowseNextPageButton, 'right');
	
	F.Reskin(BrowseCloseButton);
	BrowseBuyoutButton:SetPoint('RIGHT', BrowseCloseButton, 'LEFT', -1, 0);
	F.Reskin(BrowseBuyoutButton);
	BrowseBidButton:SetPoint('RIGHT', BrowseBuyoutButton, 'LEFT', -1, 0);
	F.Reskin(BrowseBidButton);
	
	F.ReskinInput(BrowseBidPriceGold);
	F.ReskinInput(BrowseBidPriceSilver);
	F.ReskinInput(BrowseBidPriceCopper);
	
	F.Reskin(BrowseResetButton);
	-- AuctionFrameBid;
	AuctionSortButton(BidQualitySort);
	AuctionSortButton(BidLevelSort);
	AuctionSortButton(BidDurationSort);
	AuctionSortButton(BidBuyoutSort);
	AuctionSortButton(BidStatusSort);
	AuctionSortButton(BidBidSort);
	
	BidScrollFrame:DisableDrawLayer('ARTWORK');
	F.ReskinScroll(BidScrollFrameScrollBar);
	
	for i = 1, NUM_BIDS_TO_DISPLAY do
		local Button = _G['BidButton'..i];
		local Item = _G['BidButton'..i..'Item'];
		local ItemIconTexture = _G['BidButton'..i..'ItemIconTexture'];
		
		_G['BidButton'..i..'Left']:Hide();
		_G['BidButton'..i..'Right']:Hide();
		
		select(6, Button:GetRegions()):Hide();
		
		Button:SetHighlightTexture(C.media.backdrop);
		Button:GetHighlightTexture():SetVertexColor(C.r, C.g, C.b, .25);
		Button:GetHighlightTexture():ClearAllPoints();
		Button:GetHighlightTexture():SetPoint('TOPLEFT', 0, -1);
		Button:GetHighlightTexture():SetPoint('BOTTOMRIGHT', -1, 6);
		
		local BD = CreateFrame('Frame', nil, Button);
		BD:SetPoint('TOPLEFT');
		BD:SetPoint('BOTTOMRIGHT', 0, 5);
		BD:SetFrameLevel(Button:GetFrameLevel() - 1);
		F.CreateBD(BD, .25);
		
		Item:SetNormalTexture(nil);
		F.StyleButton(Item);
		F.CreateBG(Item);
		
		Item.Hover:SetAllPoints();
		Item.Pushed:SetAllPoints();
		
		ItemIconTexture:SetTexCoord(unpack(F.TexCoords));
	end
	
	F.ReskinInput(BidBidPriceGold);
	F.ReskinInput(BidBidPriceSilver);
	F.ReskinInput(BidBidPriceCopper);
	
	F.Reskin(BidCloseButton);
	BidBuyoutButton:SetPoint('RIGHT', BidCloseButton, 'LEFT', -1, 0);
	F.Reskin(BidBuyoutButton);
	BidBidButton:SetPoint('RIGHT', BidBuyoutButton, 'LEFT', -1, 0);
	F.Reskin(BidBidButton);
	-- AuctionFrameAuctions;
	AuctionSortButton(AuctionsQualitySort);
	AuctionSortButton(AuctionsDurationSort);
	AuctionSortButton(AuctionsHighBidderSort);
	AuctionSortButton(AuctionsBidSort);
	
	AuctionsScrollFrame:DisableDrawLayer('ARTWORK');
	F.ReskinScroll(AuctionsScrollFrameScrollBar);
	
	for i = 1, NUM_AUCTIONS_TO_DISPLAY do
		local Button = _G['AuctionsButton'..i];
		local Item = _G['AuctionsButton'..i..'Item'];
		local ItemIconTexture = _G['AuctionsButton'..i..'ItemIconTexture'];
		
		_G['AuctionsButton'..i..'Left']:Hide();
		_G['AuctionsButton'..i..'Right']:Hide();
		
		select(5, Button:GetRegions()):Hide();
		
		Button:SetHighlightTexture(C.media.backdrop);
		Button:GetHighlightTexture():SetVertexColor(C.r, C.g, C.b, .25);
		Button:GetHighlightTexture():ClearAllPoints();
		Button:GetHighlightTexture():SetPoint('TOPLEFT', 0, -1);
		Button:GetHighlightTexture():SetPoint('BOTTOMRIGHT', -1, 6);
		
		local BD = CreateFrame('Frame', nil, Button);
		BD:SetPoint('TOPLEFT');
		BD:SetPoint('BOTTOMRIGHT', 0, 5);
		BD:SetFrameLevel(Button:GetFrameLevel() - 1);
		F.CreateBD(BD, .25);
		
		Item:SetNormalTexture(nil);
		F.StyleButton(Item);
		F.CreateBG(Item);
		
		Item.Hover:SetAllPoints();
		Item.Pushed:SetAllPoints();
		
		ItemIconTexture:SetTexCoord(unpack(F.TexCoords));
	end
	
	select(2, AuctionsItemButton:GetRegions()):Hide();
	
	F.StyleButton(AuctionsItemButton, nil, true);
	F.CreateBD(AuctionsItemButton, .25);
	
	AuctionsItemButton:HookScript('OnEvent', function(self, event)
		if ( event == 'NEW_AUCTION_UPDATE' and self:GetNormalTexture() ) then
			self:GetNormalTexture():SetTexCoord(unpack(F.TexCoords));
			self:GetNormalTexture():SetPoint('TOPLEFT', 1, -1);
			self:GetNormalTexture():SetPoint('BOTTOMRIGHT', -1, 1);
		end
	end);
	
	F.ReskinInput(AuctionsStackSizeEntry);
	F.Reskin(AuctionsStackSizeMaxButton, nil, true);
	
	F.ReskinInput(AuctionsNumStacksEntry);
	F.Reskin(AuctionsNumStacksMaxButton, nil, true);
	
	F.ReskinDropDown(PriceDropDown);
	
	F.ReskinInput(StartPriceGold);
	F.ReskinInput(StartPriceSilver);
	F.ReskinInput(StartPriceCopper);
	
	F.ReskinInput(BuyoutPriceGold);
	F.ReskinInput(BuyoutPriceSilver);
	F.ReskinInput(BuyoutPriceCopper);
	
	F.ReskinDropDown(DurationDropDown);
	
	F.Reskin(AuctionsCloseButton);
	AuctionsCancelAuctionButton:SetPoint('RIGHT', AuctionsCloseButton, 'LEFT', -1, 0);
	F.Reskin(AuctionsCancelAuctionButton, nil, true);
	F.Reskin(AuctionsCreateAuctionButton, nil, true);
	-- AuctionProgressFrame;
	AuctionProgressFrame:DisableDrawLayer('ARTWORK');
	
	F.CreateBD(AuctionProgressFrame);
	
	AuctionProgressFrameFill:Hide();
	
	select(2, AuctionProgressBar:GetRegions()):Hide();
	
	F.CreateBD(AuctionProgressBar, .25);
	AuctionProgressBar:SetStatusBarTexture(C.media.backdrop);
	
	AuctionProgressBarIcon:SetTexCoord(unpack(F.TexCoords))
	F.CreateBG(AuctionProgressBarIcon);
	--AuctionDressUpFrame
	AuctionDressUpFrameTop:Hide()
	select(2, AuctionDressUpFrame:GetRegions()):Hide();
	AuctionDressUpBackgroundTop:Hide();
	AuctionDressUpBackgroundBot:Hide();
	
	F.CreateBD(AuctionDressUpFrame);
	
	AuctionDressUpModelRotateLeftButton:SetPoint('TOPLEFT', AuctionDressUpFrame, 4, -4);
	F.ReskinArrow(AuctionDressUpModelRotateLeftButton, 'left');
	AuctionDressUpModelRotateRightButton:SetPoint('TOPLEFT', AuctionDressUpModelRotateLeftButton, 'TOPRIGHT', -1, 0);
	F.ReskinArrow(AuctionDressUpModelRotateRightButton, 'right');
	
	F.Reskin(AuctionDressUpFrameResetButton);
	
	AuctionDressUpFrameCloseButton:DisableDrawLayer('BACKGROUND');
	F.ReskinClose(AuctionDressUpFrameCloseButton, 'CENTER', AuctionDressUpFrame, 'TOPRIGHT', -14, -13);
end