local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local select = select;
local unpack = unpack;
local tinsert = table.insert;

local TexCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	F:SetBD(TradeFrame, 11, -12, -28, 51);
	
	TradeFrame:DisableDrawLayer('BACKGROUND');
	
	for i = 3, 6 do
		select(i, TradeFrame:GetRegions()):SetTexture(nil);
	end
	
	TradeHighlightPlayerTop:SetTexture(0, 1, 0, 0.2);
	TradeHighlightPlayerBottom:SetTexture(0, 1, 0, 0.2);
	TradeHighlightPlayerMiddle:SetTexture(0, 1, 0, 0.2);
	
	TradeHighlightRecipientTop:SetTexture(0, 1, 0, 0.2);
	TradeHighlightRecipientBottom:SetTexture(0, 1, 0, 0.2);
	TradeHighlightRecipientMiddle:SetTexture(0, 1, 0, 0.2);
	
	TradeHighlightPlayerEnchantTop:SetTexture(0, 1, 0, 0.2);
	TradeHighlightPlayerEnchantBottom:SetTexture(0, 1, 0, 0.2);
	TradeHighlightPlayerEnchantMiddle:SetTexture(0, 1, 0, 0.2);
	
	TradeHighlightRecipientEnchantTop:SetTexture(0, 1, 0, 0.2);
	TradeHighlightRecipientEnchantBottom:SetTexture(0, 1, 0, 0.2);
	TradeHighlightRecipientEnchantMiddle:SetTexture(0, 1, 0, 0.2);
	
	do
		local RecipientItem, RecipientItemName, RecipientItemButton, RecipientItemButtonTexture;
		local PlayerItem, PlayerItemName, PlayerItemButton, PlayerItemButtonTexture;
		
		for i = 1, MAX_TRADE_ITEMS do
			RecipientItem = _G['TradeRecipientItem'..i];
			RecipientItemName = _G['TradeRecipientItem'..i..'NameFrame'];
			RecipientItemButton = _G['TradeRecipientItem'..i..'ItemButton'];
			RecipientItemButtonTexture = _G['TradeRecipientItem'..i..'ItemButtonIconTexture'];
			
			PlayerItem = _G['TradePlayerItem'..i];
			PlayerItemName = _G['TradePlayerItem'..i..'NameFrame'];
			PlayerItemButton = _G['TradePlayerItem'..i..'ItemButton'];
			PlayerItemButtonTexture = _G['TradePlayerItem'..i..'ItemButtonIconTexture'];
			
			_G['TradeRecipientItem'..i..'SlotTexture']:SetTexture(nil);
			RecipientItemName:SetTexture(0, 0, 0, .25);
			RecipientItemName:SetSize(109, 35);
			RecipientItemName:SetPoint('LEFT', _G['TradeRecipientItem'..i..'SlotTexture'], 'RIGHT', -15, 0);
			
			RecipientItemName.BG = CreateFrame('Frame', nil, RecipientItem);
			RecipientItemName.BG:SetAllPoints(RecipientItemName);
			F:CreateBD(RecipientItemName.BG, 0);
			
			RecipientItemButton:SetNormalTexture(nil);
			F:StyleButton(RecipientItemButton);
			F:CreateBD(RecipientItemButton, .25);
			
			RecipientItemButtonTexture:SetPoint('TOPLEFT', 1, -1);
			RecipientItemButtonTexture:SetPoint('BOTTOMRIGHT', -1, 1);
			RecipientItemButtonTexture:SetTexCoord(unpack(TexCoords));
			
			_G['TradePlayerItem'..i..'SlotTexture']:SetTexture(nil);
			PlayerItemName:SetTexture(0, 0, 0, .25);
			PlayerItemName:SetSize(109, 35);
			PlayerItemName:SetPoint('LEFT', _G['TradePlayerItem'..i..'SlotTexture'], 'RIGHT', -15, 0);
			
			PlayerItemName.BG = CreateFrame('Frame', nil, PlayerItem);
			PlayerItemName.BG:SetAllPoints(PlayerItemName);
			F:CreateBD(PlayerItemName.BG, 0);
			
			PlayerItemButton:SetNormalTexture(nil);
			F:StyleButton(PlayerItemButton);
			F:CreateBD(PlayerItemButton, .25);
			
			PlayerItemButtonTexture:SetPoint('TOPLEFT', 1, -1);
			PlayerItemButtonTexture:SetPoint('BOTTOMRIGHT', -1, 1);
			PlayerItemButtonTexture:SetTexCoord(unpack(TexCoords));
			
			if(i == MAX_TRADE_ITEMS) then
				RecipientItem:DisableDrawLayer('ARTWORK');
				PlayerItem:DisableDrawLayer('ARTWORK');
			end
		end
	end
	
	F:Reskin(TradeFrameTradeButton);
	F:Reskin(TradeFrameCancelButton);
	
	F:ReskinClose(TradeFrameCloseButton, 'TOPRIGHT', TradeFrame, 'TOPRIGHT', -32, -16);
	
	F:ReskinInput(TradePlayerInputMoneyFrameGold);
	F:ReskinInput(TradePlayerInputMoneyFrameSilver);
	F:ReskinInput(TradePlayerInputMoneyFrameCopper);
end);