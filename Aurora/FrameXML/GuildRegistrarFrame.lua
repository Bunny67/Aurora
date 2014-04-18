local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local select = select;

tinsert(C.Modules['Aurora'], function()
	F.SetBD(GuildRegistrarFrame, 14, -19, -30, 68);
	GuildRegistrarFramePortrait:Hide();
	
	for i = 2, 5 do
		select(i, GuildRegistrarFrame:GetRegions()):Hide();
	end
	
	F.ReskinClose(GuildRegistrarFrameCloseButton, 'TOPRIGHT', GuildRegistrarFrame, 'TOPRIGHT', -34, -23);
	
	for i = 1, 2 do
		local Button = _G['GuildRegistrarButton'..i];
		
		Button:GetFontString():SetTextColor(1, 1, 1);
	end
	
	GuildRegistrarPurchaseText:SetTextColor(1, 1, 1);
	AvailableServicesText:SetTextColor(1, 1, 1);
	AvailableServicesText:SetShadowColor(0, 0, 0);
	
	select(2, GuildRegistrarGreetingFrame:GetRegions()):Hide();
	
	select(6, GuildRegistrarFrameEditBox:GetRegions()):Hide();
	select(7, GuildRegistrarFrameEditBox:GetRegions()):Hide();
	F.ReskinInput(GuildRegistrarFrameEditBox, 20);
	
	F.Reskin(GuildRegistrarFramePurchaseButton);
	F.Reskin(GuildRegistrarFrameCancelButton);
	
	F.Reskin(GuildRegistrarFrameGoodbyeButton);
end)