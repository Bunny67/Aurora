local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.StripTextures(GuildRegistrarFrame, true);
	F.SetBD(GuildRegistrarFrame, 10, -12, -32, 67);
	
	F.ReskinClose(GuildRegistrarFrameCloseButton, 'TOPRIGHT', GuildRegistrarFrame, 'TOPRIGHT', -36, -16);
	
	for i=1, 2 do
		local Button = _G['GuildRegistrarButton'..i];
		
		Button:GetFontString():SetTextColor(1, 1, 1);
	end
	
	GuildRegistrarPurchaseText:SetTextColor(1, 1, 1);
	AvailableServicesText:SetTextColor(1, 1, 1);
	AvailableServicesText:SetShadowColor(0, 0, 0);
	
	F.StripTextures(GuildRegistrarGreetingFrame);
	
	select(6, GuildRegistrarFrameEditBox:GetRegions()):Hide();
	select(7, GuildRegistrarFrameEditBox:GetRegions()):Hide();
	F.ReskinInput(GuildRegistrarFrameEditBox, 20);
	
	F.Reskin(GuildRegistrarFramePurchaseButton);
	F.Reskin(GuildRegistrarFrameCancelButton);
	
	F.Reskin(GuildRegistrarFrameGoodbyeButton);
end)