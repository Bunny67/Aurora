local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local select = select;

tinsert(C.Modules['Aurora'], function()
	-- ArenaRegistrarFrame;
	F.SetBD(ArenaRegistrarFrame, 14, -18, -30, 67);
	ArenaRegistrarFramePortrait:Hide();
	
	for i = 2, 5 do
		select(i, ArenaRegistrarFrame:GetRegions()):Hide();
	end
	
	F.ReskinClose(ArenaRegistrarFrameCloseButton, 'TOPRIGHT', ArenaRegistrarFrame, 'TOPRIGHT', -34, -22);
	-- ArenaRegistrarGreetingFrame;
	select(3, ArenaRegistrarGreetingFrame:GetRegions()):Hide();
	
	select(1, ArenaRegistrarGreetingFrame:GetRegions()):SetTextColor(1, 1, 1)
	RegistrationText:SetTextColor(1, 1, 1);
	
	F.Reskin(ArenaRegistrarFrameGoodbyeButton);
	
	for i = 1, MAX_TEAM_BORDERS do
		local Button = select(3, _G['ArenaRegistrarButton'..i]:GetRegions());
		
		Button:SetTextColor(1, 1, 1);
	end
	-- ArenaRegistrarPurchaseFrame;
	ArenaRegistrarPurchaseText:SetTextColor(1, 1, 1);

	F.Reskin(ArenaRegistrarFrameCancelButton);
	F.Reskin(ArenaRegistrarFramePurchaseButton);
	
	select(6, ArenaRegistrarFrameEditBox:GetRegions()):Hide();
	select(7, ArenaRegistrarFrameEditBox:GetRegions()):Hide();
	F.ReskinInput(ArenaRegistrarFrameEditBox, 18);
	-- PVPBannerFrame;
	F.SetBD(PVPBannerFrame, 10, -12, -33, 73);
	PVPBannerFramePortrait:Hide();
	
	PVPBannerFrame:DisableDrawLayer('BORDER');
	
	PVPBannerFrameBackground:Hide();
	
	for i = 7, 20 do
		select(i, PVPBannerFrame:GetRegions()):Hide();
	end
	-- PVPBannerFrameCustomizationFrame;
	PVPBannerFrameCustomizationFrame:DisableDrawLayer('BACKGROUND');
	
	for i = 1, 2 do
		local Customization = _G['PVPBannerFrameCustomization'..i];
		local CustomizationLeft = _G['PVPBannerFrameCustomization'..i..'LeftButton'];
		local CustomizationRight = _G['PVPBannerFrameCustomization'..i..'RightButton'];
		
		for j = 1, 3 do
			select(j, Customization:GetRegions()):SetAlpha(0);
		end
		
		F.ReskinArrow(CustomizationLeft, 'Left');
		F.ReskinArrow(CustomizationRight, 'Right');
	end
	
	for i = 1, 3 do
		local Button = _G['PVPColorPickerButton'..i];
		
		F.Reskin(Button);
	end
	
	F.Reskin(PVPBannerFrameAcceptButton);
	F.Reskin(PVPBannerFrameCancelButton);
	
	F.ReskinClose(PVPBannerFrameCloseButton, 'TOPRIGHT', PVPBannerFrame, 'TOPRIGHT', -37, -16);
end)