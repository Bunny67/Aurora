local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	-- ArenaRegistrarFrame;
	F:SetBD(ArenaRegistrarFrame, 14, -18, -30, 67);
	ArenaRegistrarFramePortrait:Hide();
	
	for i = 2, 5 do
		select(i, ArenaRegistrarFrame:GetRegions()):SetTexture(nil);
	end
	
	F:ReskinClose(ArenaRegistrarFrameCloseButton, 'TOPRIGHT', ArenaRegistrarFrame, 'TOPRIGHT', -34, -22);
	-- ArenaRegistrarGreetingFrame;
	select(3, ArenaRegistrarGreetingFrame:GetRegions()):SetTexture(nil);
	
	select(1, ArenaRegistrarGreetingFrame:GetRegions()):SetTextColor(1, 1, 1)
	RegistrationText:SetTextColor(1, 1, 1);
	
	F:Reskin(ArenaRegistrarFrameGoodbyeButton);
	
	do
		local Button;
		
		for i = 1, MAX_TEAM_BORDERS do
			Button = select(3, _G['ArenaRegistrarButton'..i]:GetRegions());
			
			Button:SetTextColor(1, 1, 1);
		end
	end
	-- ArenaRegistrarPurchaseFrame;
	ArenaRegistrarPurchaseText:SetTextColor(1, 1, 1);

	F:Reskin(ArenaRegistrarFrameCancelButton);
	F:Reskin(ArenaRegistrarFramePurchaseButton);
	
	select(6, ArenaRegistrarFrameEditBox:GetRegions()):SetTexture(nil);
	select(7, ArenaRegistrarFrameEditBox:GetRegions()):SetTexture(nil);
	F:ReskinInput(ArenaRegistrarFrameEditBox, 18);
	-- PVPBannerFrame;
	F:SetBD(PVPBannerFrame, 10, -12, -33, 73);
	PVPBannerFramePortrait:Hide();
	
	PVPBannerFrame:DisableDrawLayer('BORDER');
	
	PVPBannerFrameBackground:SetTexture(nil);
	
	for i = 7, 20 do
		select(i, PVPBannerFrame:GetRegions()):SetTexture(nil);
	end
	-- PVPBannerFrameCustomizationFrame;
	PVPBannerFrameCustomizationFrame:DisableDrawLayer('BACKGROUND');
	
	do
		local Customization, CustomizationLeft, CustomizationRight;
		
		for i = 1, 2 do
			Customization = _G['PVPBannerFrameCustomization'..i];
			CustomizationLeft = _G['PVPBannerFrameCustomization'..i..'LeftButton'];
			CustomizationRight = _G['PVPBannerFrameCustomization'..i..'RightButton'];
			
			for j = 1, 3 do
				select(j, Customization:GetRegions()):SetTexture(nil);
			end
			
			F:ReskinArrow(CustomizationLeft, 'Left');
			F:ReskinArrow(CustomizationRight, 'Right');
		end
	end
	
	do
		local Button;
		
		for i = 1, 3 do
			Button = _G['PVPColorPickerButton'..i];
			
			F:Reskin(Button);
			
			if ( i == 2 ) then
				Button:SetPoint('TOP', PVPBannerFrameCustomization2, 'BOTTOM', 0, -33);
			elseif ( i == 3 ) then
				Button:SetPoint('TOP', PVPBannerFrameCustomization2, 'BOTTOM', 0, -59);
			end
		end
	end
	
	F:Reskin(PVPBannerFrameAcceptButton);
	F:Reskin(PVPBannerFrameCancelButton);
	
	F:ReskinClose(PVPBannerFrameCloseButton, 'TOPRIGHT', PVPBannerFrame, 'TOPRIGHT', -37, -16);
end);