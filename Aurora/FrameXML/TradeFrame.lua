local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;

tinsert(C.modules['Aurora'], function()
	F.StripTextures(TradeFrame, true);
	F.SetBD(TradeFrame, 10, -11, -28, 48);
	
	F.ReskinClose(TradeFrameCloseButton, 'TOPRIGHT', TradeFrame, 'TOPRIGHT', -32, -15);
	
	F.ReskinInput(TradePlayerInputMoneyFrameGold);
	F.ReskinInput(TradePlayerInputMoneyFrameSilver);
	F.ReskinInput(TradePlayerInputMoneyFrameCopper);
	
	for i = 1, MAX_TRADE_ITEMS do
		local Player = _G['TradePlayerItem'..i]
		local Recipient = _G['TradeRecipientItem'..i]
		local PlayerButton = _G['TradePlayerItem'..i..'ItemButton'];
		local PlayerButtonIconTexture = _G['TradePlayerItem'..i..'ItemButtonIconTexture'];
		local RecipientButton = _G['TradeRecipientItem'..i..'ItemButton'];
		local RecipientButtonIconTexture = _G['TradeRecipientItem'..i..'ItemButtonIconTexture'];
		
		F.StripTextures(Player);
		F.StripTextures(Recipient);
		
		F.StripTextures(PlayerButton);
		F.StyleButton(PlayerButton);
		F.CreateBD(PlayerButton, .25);
		
		PlayerButtonIconTexture:SetPoint('TOPLEFT', 1, -1);
		PlayerButtonIconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
		PlayerButtonIconTexture:SetTexCoord(unpack(F.TexCoords));
		
		F.StripTextures(RecipientButton);
		F.StyleButton(RecipientButton);
		F.CreateBD(RecipientButton, .25);
		
		RecipientButtonIconTexture:SetPoint('TOPLEFT', 1, -1);
		RecipientButtonIconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
		RecipientButtonIconTexture:SetTexCoord(unpack(F.TexCoords));
	end
	
	TradeHighlightPlayerTop:SetTexture(0, 1, 0, 0.2);
	TradeHighlightPlayerBottom:SetTexture(0, 1, 0, 0.2);
	TradeHighlightPlayerMiddle:SetTexture(0, 1, 0, 0.2);

	TradeHighlightPlayerEnchantTop:SetTexture(0, 1, 0, 0.2);
	TradeHighlightPlayerEnchantBottom:SetTexture(0, 1, 0, 0.2);
	TradeHighlightPlayerEnchantMiddle:SetTexture(0, 1, 0, 0.2);
	
	TradeHighlightRecipientTop:SetTexture(0, 1, 0, 0.2);
	TradeHighlightRecipientBottom:SetTexture(0, 1, 0, 0.2);
	TradeHighlightRecipientMiddle:SetTexture(0, 1, 0, 0.2);

	TradeHighlightRecipientEnchantTop:SetTexture(0, 1, 0, 0.2);
	TradeHighlightRecipientEnchantBottom:SetTexture(0, 1, 0, 0.2);
	TradeHighlightRecipientEnchantMiddle:SetTexture(0, 1, 0, 0.2);
	
	F.Reskin(TradeFrameTradeButton);
	F.Reskin(TradeFrameCancelButton);
end)