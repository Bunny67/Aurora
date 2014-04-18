local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local select = select;

tinsert(C.Modules['Aurora'], function()
	-- ArenaRegistrarFrame;
	F.SetBD(ArenaRegistrarFrame, 14, -18, -30, 67);
	
	ArenaRegistrarFramePortrait:Hide();
	
	F.ReskinClose(ArenaRegistrarFrameCloseButton, 'TOPRIGHT', ArenaRegistrarFrame, 'TOPRIGHT', -34, -22);
	
	F.StripTextures(ArenaRegistrarGreetingFrame); -- ArenaRegistrarGreetingFrame;
	
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
	
	for i = 1, ArenaRegistrarFrameEditBox:GetNumRegions() do
		local Region = select(i, ArenaRegistrarFrameEditBox:GetRegions());
		
		if ( Region and Region:GetObjectType() == 'Texture' ) then
			if ( Region:GetTexture() == 'Interface\\ChatFrame\\UI-ChatInputBorder-Left' ) or ( Region:GetTexture() == 'Interface\\ChatFrame\\UI-ChatInputBorder-Right' ) then
				F.Kill(Region);
			end
		end
	end
	
	F.ReskinInput(ArenaRegistrarFrameEditBox, 18);
	-- PVPBannerFrame;
	F.SetBD(PVPBannerFrame, 10, -12, -33, 73);
	
	PVPBannerFramePortrait:Hide();
	-- PVPBannerFrameCustomizationFrame;
	F.StripTextures(PVPBannerFrameCustomizationFrame);
	
	for i = 1, 2 do
		local Customization = _G['PVPBannerFrameCustomization'..i];
		local CustomizationLeft = _G['PVPBannerFrameCustomization'..i..'LeftButton'];
		local CustomizationRight = _G['PVPBannerFrameCustomization'..i..'RightButton'];
		
		F.StripTextures(Customization);
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