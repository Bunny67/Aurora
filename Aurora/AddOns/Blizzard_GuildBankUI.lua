local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;
local select = select;

C.modules['Blizzard_GuildBankUI'] = function()
	-- GuildBankFrame;
	F.SetBD(GuildBankFrame, 11, -12, 0, 6);
	
	GuildBankEmblemFrame:DisableDrawLayer('ARTWORK');
	GuildBankEmblemFrame:DisableDrawLayer('BACKGROUND');
	GuildBankEmblemFrame:DisableDrawLayer('BORDER');
	
	for i = 1, NUM_GUILDBANK_COLUMNS do
		local Column = _G['GuildBankColumn'..i];
		
		Column:DisableDrawLayer('BACKGROUND');
		
		for x = 1, NUM_SLOTS_PER_GUILDBANK_GROUP do
			local Button = _G['GuildBankColumn'..i..'Button'..x];
			local IconTexture = _G['GuildBankColumn'..i..'Button'..x..'IconTexture'];
			local NormalTexture = _G['GuildBankColumn'..i..'Button'..x..'NormalTexture'];
			local Count = _G['GuildBankColumn'..i..'Button'..x..'Count'];
			
			F.StyleButton(Button);
			F.CreateBD(Button, .25);
			
			if NormalTexture then NormalTexture:SetTexture(nil); end
			
			IconTexture:SetPoint('TOPLEFT', 1, -1);
			IconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
			IconTexture:SetTexCoord(unpack(F.TexCoords));
			IconTexture:SetDrawLayer('OVERLAY');
			
			Count:SetDrawLayer('OVERLAY');
		end
	end
	
	F.Reskin(GuildBankFrameDepositButton, nil, true);
	F.Reskin(GuildBankFrameWithdrawButton, nil, true);
	GuildBankFrameWithdrawButton:SetPoint('RIGHT', GuildBankFrameDepositButton, 'LEFT', -2, 0);
	
	for i = 1, _G['GuildBankFrame']:GetNumChildren() do
		local Child = select(i, _G['GuildBankFrame']:GetChildren());
		if Child.GetPushedTexture and Child:GetPushedTexture() and not Child:GetName() then
			F.ReskinClose(Child, 'TOPRIGHT', GuildBankFrame, 'TOPRIGHT', -4, -16);
		end
	end
	
	for i = 1, 4 do
		local Tab = _G['GuildBankFrameTab'..i];
		
		F.ReskinTab(Tab);
	end
	
	for i = 1, 6 do
		local Tab = _G['GuildBankTab'..i];
		local Button = _G['GuildBankTab'..i..'Button'];
		local IconTexture = _G['GuildBankTab'..i..'ButtonIconTexture'];
		
		Tab:DisableDrawLayer('BACKGROUND');
		
		Button:GetNormalTexture():SetTexture(nil);
		Button:GetPushedTexture():SetTexture(nil);
		F.StyleButton(Button, nil, true);
		F.CreateBD(Button);

		IconTexture:SetPoint('TOPLEFT', 1, -1);
		IconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
		IconTexture:SetTexCoord(unpack(F.TexCoords));
	end
	
	F.Reskin(GuildBankFramePurchaseButton, nil, true);
	
	GuildBankTransactionsScrollFrame:DisableDrawLayer('ARTWORK');
	F.ReskinScroll(GuildBankTransactionsScrollFrameScrollBar);
	
	F.Reskin(GuildBankInfoSaveButton, nil, true);
	
	F.ReskinScroll(GuildBankInfoScrollFrameScrollBar);
	-- GuildBankPopupFrame;
	F.SetBD(GuildBankPopupFrame, 3, -15, -25, 26);
	
	GuildBankPopupEditBox:DisableDrawLayer('BACKGROUND');
	F.ReskinInput(GuildBankPopupEditBox);
	
	GuildBankPopupScrollFrame:GetRegions():Hide()
	select(2, GuildBankPopupScrollFrame:GetRegions()):Hide()
	F.ReskinScroll(GuildBankPopupScrollFrameScrollBar);
	
	for i = 1, 16 do
		local Button = _G['GuildBankPopupButton'..i];
		local Icon = _G[Button:GetName()..'Icon'];
		
		Button:DisableDrawLayer('BACKGROUND');
		F.CreateBD(Button);
		F.StyleButton(Button, nil, true);
		
		Icon:SetPoint('TOPLEFT', 1, -1);
		Icon:SetPoint('BOTTOMRIGHT', -1, 1);
		Icon:SetTexCoord(unpack(F.TexCoords));
	end
	
	F.Reskin(GuildBankPopupCancelButton);
	F.Reskin(GuildBankPopupOkayButton);
	
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
