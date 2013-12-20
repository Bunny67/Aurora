local F, C = unpack(select(2, ...));

local _G = getfenv(0);

C.modules['Blizzard_GuildBankUI'] = function()
	F.StripTextures(GuildBankFrame);
	F.SetBD(GuildBankFrame, 12, -11, 0, 6);
	
	for i = 1, _G['GuildBankFrame']:GetNumChildren() do
		local Child = select(i, _G['GuildBankFrame']:GetChildren());
		if Child.GetPushedTexture and Child:GetPushedTexture() and not Child:GetName() then
			F.ReskinClose(Child, 'TOPRIGHT', GuildBankFrame, 'TOPRIGHT', -4, -15);
		end
	end
	
	for i = 1, NUM_GUILDBANK_COLUMNS do
		local Column = _G['GuildBankColumn'..i];
		
		F.StripTextures(Column);
		
		for x = 1, NUM_SLOTS_PER_GUILDBANK_GROUP do
			local Button = _G['GuildBankColumn'..i..'Button'..x];
			local IconTexture = _G['GuildBankColumn'..i..'Button'..x..'IconTexture'];
			local NormalTexture = _G['GuildBankColumn'..i..'Button'..x..'NormalTexture'];
			local Count = _G['GuildBankColumn'..i..'Button'..x..'Count'];
			
			F.StyleButton(Button);
			F.CreateBD(Button);
			
			if NormalTexture then NormalTexture:SetTexture(nil); end
			
			IconTexture:SetPoint('TOPLEFT', 1, -1);
			IconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
			IconTexture:SetTexCoord(unpack(F.TexCoords));
			IconTexture:SetDrawLayer('OVERLAY');
			
			Count:SetDrawLayer('OVERLAY');
		end
	end
	
	hooksecurefunc('GuildBankFrame_Update', function()
		if GuildBankFrame.mode ~= 'bank' then return; end
		
		local Tab = GetCurrentGuildBankTab();
		local Button, Index, Column, ItemLink, ItemRarity, r, g, b;
		
		for i=1, MAX_GUILDBANK_SLOTS_PER_TAB do
			Index = mod(i, NUM_SLOTS_PER_GUILDBANK_GROUP);
			
			if ( Index == 0 ) then
				Index = NUM_SLOTS_PER_GUILDBANK_GROUP;
			end
			
			Column = ceil((i-0.5)/NUM_SLOTS_PER_GUILDBANK_GROUP);
			Button = _G['GuildBankColumn'..Column..'Button'..Index];

			ItemLink  = GetGuildBankItemLink(Tab, i);
			
			if ItemLink then
				ItemRarity = select(3, GetItemInfo(ItemLink));
				
				if ItemRarity > 1 then
					r, g, b = GetItemQualityColor(ItemRarity);
				else
					r, g, b = 0, 0, 0;
				end
			else
				r, g, b = 0, 0, 0;
			end
			
			Button:SetBackdropBorderColor(r, g, b);
		end		
	end)
	
	for i = 1, 6 do
		local Tab = _G['GuildBankTab'..i];
		local Button = _G['GuildBankTab'..i..'Button'];
		local IconTexture = _G['GuildBankTab'..i..'ButtonIconTexture'];
		
		F.StripTextures(Tab, true);
		
		F.StripTextures(Button);
		F.StyleButton(Button, nil, true);
		F.CreateBD(Button);

		IconTexture:SetPoint('TOPLEFT', 1, -1);
		IconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
		IconTexture:SetTexCoord(unpack(F.TexCoords));
	end
	
	F.Reskin(GuildBankFrameWithdrawButton, nil, true);
	F.Reskin(GuildBankFrameDepositButton, nil, true);
	F.Reskin(GuildBankInfoSaveButton, nil, true);
	F.Reskin(GuildBankFramePurchaseButton, nil, true);
	
	F.StripTextures(GuildBankTransactionsScrollFrame);
	F.ReskinScroll(GuildBankTransactionsScrollFrameScrollBar);
	
	F.StripTextures(GuildBankInfoScrollFrame);
	F.ReskinScroll(GuildBankInfoScrollFrameScrollBar);
	
	for i=1, 4 do
		local Tab = _G['GuildBankFrameTab'..i];
		
		F.ReskinTab(Tab);
	end
	
	F.StripTextures(GuildBankEmblemFrame, true);
	
	
	F.StripTextures(GuildBankPopupFrame);
	F.CreateBD(GuildBankPopupFrame);
	_G['GuildBankPopupFrame']:SetPoint('TOPLEFT', GuildBankFrame, 'TOPRIGHT', 1, -30);
	
	F.StripTextures(GuildBankPopupScrollFrame);
	
	F.Kill(GuildBankPopupNameLeft);
	F.Kill(GuildBankPopupNameRight);
	F.Kill(GuildBankPopupNameMiddle);
	
	F.ReskinInput(GuildBankPopupEditBox);

	for i = 1, 16 do
		local Button = _G['GuildBankPopupButton'..i];
		local Icon = _G[Button:GetName()..'Icon'];
		
		F.StripTextures(Button);
		F.CreateBD(Button);
		F.StyleButton(Button, nil, true);
		
		Icon:SetPoint('TOPLEFT', 1, -1);
		Icon:SetPoint('BOTTOMRIGHT', -1, 1);
		Icon:SetTexCoord(unpack(F.TexCoords));
	end
	
	F.Reskin(GuildBankPopupOkayButton);
	F.Reskin(GuildBankPopupCancelButton);
end
