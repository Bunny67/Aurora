local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;
local select = select;

C.Modules['Blizzard_GuildBankUI'] = function()
	-- GuildBankFrame;
	F.SetBD(GuildBankFrame, 11, -12, 0, 6);
	
	GuildBankTabTitleBackground:SetAlpha(0);
	GuildBankTabTitleBackgroundLeft:SetAlpha(0);
	GuildBankTabTitleBackgroundRight:SetAlpha(0);
	GuildBankTabLimitBackground:SetAlpha(0);
	GuildBankTabLimitBackgroundLeft:SetAlpha(0);
	GuildBankTabLimitBackgroundRight:SetAlpha(0);
	
	GuildBankFrameLeft:Hide();
	GuildBankFrameRight:Hide();
	
	GuildBankEmblemFrame:DisableDrawLayer('ARTWORK');
	GuildBankEmblemFrame:DisableDrawLayer('BACKGROUND');
	GuildBankEmblemFrame:DisableDrawLayer('BORDER');
	
	do
		local Column;
		
		for i = 1, NUM_GUILDBANK_COLUMNS do
			Column = _G['GuildBankColumn'..i];
			
			Column:DisableDrawLayer('BACKGROUND');
			
			local Button, ButtonIcon, ButtonNormal, ButtonCount;
			
			for x = 1, NUM_SLOTS_PER_GUILDBANK_GROUP do
				Button = _G['GuildBankColumn'..i..'Button'..x];
				ButtonIcon = _G['GuildBankColumn'..i..'Button'..x..'IconTexture'];
				ButtonNormal = _G['GuildBankColumn'..i..'Button'..x..'NormalTexture'];
				ButtonCount = _G['GuildBankColumn'..i..'Button'..x..'Count'];
				
				F.StyleButton(Button);
				F.CreateBD(Button, .25);
				
				if ButtonNormal then ButtonNormal:SetTexture(nil); end
				
				ButtonIcon:SetPoint('TOPLEFT', 1, -1);
				ButtonIcon:SetPoint('BOTTOMRIGHT', -1, 1);
				ButtonIcon:SetTexCoord(unpack(F.TexCoords));
				ButtonIcon:SetDrawLayer('OVERLAY');
				
				ButtonCount:SetDrawLayer('OVERLAY');
			end
		end
	end
	
	F.Reskin(GuildBankFrameDepositButton, nil, true);
	F.Reskin(GuildBankFrameWithdrawButton, nil, true);
	GuildBankFrameWithdrawButton:SetPoint('RIGHT', GuildBankFrameDepositButton, 'LEFT', -2, 0);
	
	do
		local Child;
		
		for i = 1, _G['GuildBankFrame']:GetNumChildren() do
			Child = select(i, _G['GuildBankFrame']:GetChildren());
			
			if Child.GetPushedTexture and Child:GetPushedTexture() and not Child:GetName() then
				F.ReskinClose(Child, 'TOPRIGHT', GuildBankFrame, 'TOPRIGHT', -4, -16);
			end
		end
	end
	
	do
		local Tab;
		
		for i = 1, 4 do
			Tab = _G['GuildBankFrameTab'..i];
			
			F.ReskinTab(Tab);
			
			if ( i ~= 1 ) then
				Tab:SetPoint('LEFT', _G['GuildBankFrameTab'..i-1], 'RIGHT', -15, 0);
			end
		end
	end
	
	do
		local Tab, Button, ButtonIcon;
		
		for i = 1, 6 do
			Tab = _G['GuildBankTab'..i];
			Button = _G['GuildBankTab'..i..'Button'];
			ButtonIcon = _G['GuildBankTab'..i..'ButtonIconTexture'];
			
			Tab:DisableDrawLayer('BACKGROUND');
			
			Button:GetNormalTexture():SetTexture(nil);
			Button:GetPushedTexture():SetTexture(nil);
			F.StyleButton(Button, nil, true);
			F.CreateBD(Button);

			ButtonIcon:SetPoint('TOPLEFT', 1, -1);
			ButtonIcon:SetPoint('BOTTOMRIGHT', -1, 1);
			ButtonIcon:SetTexCoord(unpack(F.TexCoords));
		end
	end
	
	F.Reskin(GuildBankFramePurchaseButton, nil, true);
	
	GuildBankTransactionsScrollFrame:DisableDrawLayer('ARTWORK');
	F.ReskinScroll(GuildBankTransactionsScrollFrameScrollBar);
	
	F.Reskin(GuildBankInfoSaveButton, nil, true);
	
	F.ReskinScroll(GuildBankInfoScrollFrameScrollBar);
	-- GuildBankPopupFrame;
	F.SetBD(GuildBankPopupFrame, 3, -15, -25, 26);
	
	for i = 1, 4 do
		select(i, GuildBankPopupFrame:GetRegions()):Hide();
	end
	
	GuildBankPopupEditBox:DisableDrawLayer('BACKGROUND');
	F.ReskinInput(GuildBankPopupEditBox);
	
	GuildBankPopupScrollFrame:GetRegions():Hide()
	select(2, GuildBankPopupScrollFrame:GetRegions()):Hide()
	F.ReskinScroll(GuildBankPopupScrollFrameScrollBar);
	
	do
		local Button, ButtonIcon;
		
		for i = 1, 16 do
			Button = _G['GuildBankPopupButton'..i];
			ButtonIcon = _G[Button:GetName()..'Icon'];
			
			Button:DisableDrawLayer('BACKGROUND');
			F.CreateBD(Button);
			F.StyleButton(Button, nil, true);
			
			ButtonIcon:SetPoint('TOPLEFT', 1, -1);
			ButtonIcon:SetPoint('BOTTOMRIGHT', -1, 1);
			ButtonIcon:SetTexCoord(unpack(F.TexCoords));
		end
	end
	
	F.Reskin(GuildBankPopupCancelButton);
	F.Reskin(GuildBankPopupOkayButton);
	
	if ( AuroraConfig.QualityColour ) then
		hooksecurefunc('GuildBankFrame_Update', function()
			if ( GuildBankFrame.mode == 'bank' ) then
				local tab = GetCurrentGuildBankTab();
				
				local button, index, column;
				local itemLink;
				
				for i = 1, MAX_GUILDBANK_SLOTS_PER_TAB do
					index = mod(i, NUM_SLOTS_PER_GUILDBANK_GROUP);
					
					if ( index == 0 ) then
						index = NUM_SLOTS_PER_GUILDBANK_GROUP;
					end
					
					column = ceil((i-0.5)/NUM_SLOTS_PER_GUILDBANK_GROUP);
					button = _G['GuildBankColumn'..column..'Button'..index];

					itemLink = GetGuildBankItemLink(tab, i);
					
					F.ColourQuality(button, itemLink);
				end
			end
		end);
	end
end
