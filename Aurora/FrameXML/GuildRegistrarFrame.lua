local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	F:SetBD(GuildRegistrarFrame, 14, -19, -30, 68);
	GuildRegistrarFramePortrait:Hide();
	
	for i = 2, 5 do
		select(i, GuildRegistrarFrame:GetRegions()):SetTexture(nil);
	end
	
	F:ReskinClose(GuildRegistrarFrameCloseButton, 'TOPRIGHT', GuildRegistrarFrame, 'TOPRIGHT', -34, -23);
	
	do
		local Button;
		
		for i = 1, 2 do
			Button = _G['GuildRegistrarButton'..i];
			
			Button:GetFontString():SetTextColor(1, 1, 1);
		end
	end
	
	GuildRegistrarPurchaseText:SetTextColor(1, 1, 1);
	AvailableServicesText:SetTextColor(1, 1, 1);
	AvailableServicesText:SetShadowColor(0, 0, 0);
	
	select(2, GuildRegistrarGreetingFrame:GetRegions()):SetTexture(nil);
	
	select(6, GuildRegistrarFrameEditBox:GetRegions()):SetTexture(nil);
	select(7, GuildRegistrarFrameEditBox:GetRegions()):SetTexture(nil);
	F:ReskinInput(GuildRegistrarFrameEditBox, 20);
	
	F:Reskin(GuildRegistrarFramePurchaseButton);
	F:Reskin(GuildRegistrarFrameCancelButton);
	
	F:Reskin(GuildRegistrarFrameGoodbyeButton);
end);