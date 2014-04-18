local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;
local pairs = pairs;
local select = select;

local TexCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	F.StripTextures(PaperDollFrame, true);
	
	F.StripTextures(PlayerTitleFrame);
	local PTF = CreateFrame('Frame', nil, PlayerTitleFrame);
	PTF:SetPoint('TOPLEFT', 20, 5);
	PTF:SetPoint('BOTTOMRIGHT', -16, 13);
	PTF:SetFrameLevel(PlayerTitleFrame:GetFrameLevel() - 1);
	F.CreateBD(PTF, 0);
	F.CreateGradient(PTF);
	
	F.Reskin(PlayerTitleFrameButton);
	local PTFB = PlayerTitleFrameButton:CreateTexture(nil, 'ARTWORK');
	PTFB:SetTexture(C.Media.ArrowDown);
	PTFB:SetSize(10, 10);
	PTFB:SetPoint('CENTER');
	PTFB:SetVertexColor(1, 1, 1);
	
	F.StripTextures(PlayerTitlePickerFrame);
	F.CreateBD(PlayerTitlePickerFrame);
	
	F.ReskinScroll(PlayerTitlePickerScrollFrameScrollBar);
	
	F.ReskinArrow(CharacterModelFrameRotateLeftButton, 'Left');
	F.ReskinArrow(CharacterModelFrameRotateRightButton, 'Right');
	
	F.StripTextures(CharacterAttributesFrame);
	
	local PlayerStatsLeft = CreateFrame('Frame', nil, CharacterAttributesFrame)
	PlayerStatsLeft:SetPoint('TOPLEFT', -1, -1);
	PlayerStatsLeft:SetPoint('BOTTOMRIGHT', -116, -7);
	F.CreateBD(PlayerStatsLeft, .25);
	
	local PlayerStatsRight = CreateFrame('Frame', nil, CharacterAttributesFrame)
	PlayerStatsRight:SetPoint('TOPLEFT', 116, -1);
	PlayerStatsRight:SetPoint('BOTTOMRIGHT', -1, -7);
	F.CreateBD(PlayerStatsRight, .25);
	
	F.ReskinDropDown(PlayerStatFrameLeftDropDown);
	F.ReskinDropDown(PlayerStatFrameRightDropDown);
	
	F.CreateBDFrame(CharacterResistanceFrame);
	CharacterResistanceFrame:SetSize(28, 140);
	
	MagicResFrame1:SetSize(28, 28);
	select(1, MagicResFrame1:GetRegions()):SetTexCoord(0.21875, 0.78125, 0.25, 0.3203125);
	MagicResFrame2:SetSize(28, 28);
	select(1, MagicResFrame2:GetRegions()):SetTexCoord(0.21875, 0.78125, 0.0234375, 0.09375);
	MagicResFrame3:SetSize(28, 28);
	select(1, MagicResFrame3:GetRegions()):SetTexCoord(0.21875, 0.78125, 0.13671875, 0.20703125);
	MagicResFrame4:SetSize(28, 28);
	select(1, MagicResFrame4:GetRegions()):SetTexCoord(0.21875, 0.78125, 0.36328125, 0.43359375);
	MagicResFrame5:SetSize(28, 28);
	select(1, MagicResFrame5:GetRegions()):SetTexCoord(0.21875, 0.78125, 0.4765625, 0.546875);
	
	local Slots = { 'HeadSlot', 'NeckSlot', 'ShoulderSlot', 'BackSlot', 'ChestSlot', 'ShirtSlot', 'TabardSlot', 'WristSlot', 'HandsSlot', 'WaistSlot', 'LegsSlot', 'FeetSlot', 'Finger0Slot', 'Finger1Slot', 'Trinket0Slot', 'Trinket1Slot', 'MainHandSlot', 'SecondaryHandSlot', 'RangedSlot' };
	for _, slot in pairs(Slots) do
		local Slot = _G['Character'..slot];
		local IconTexture = _G['Character'..slot..'IconTexture']
		local PopoutButton = _G['Character'..slot..'PopoutButton'];
		
		Slot:SetNormalTexture('');
		F.StyleButton(Slot);
		F.CreateBD(Slot);
		
		IconTexture:SetPoint('TOPLEFT', 1, -1);
		IconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
		IconTexture:SetTexCoord(unpack(TexCoords));

		F.StripTextures(PopoutButton);

		PopoutButton.Arrow = PopoutButton:CreateTexture(nil, 'OVERLAY');

		if Slot.verticalFlyout then
			PopoutButton.Arrow:SetSize(13, 8);
			PopoutButton.Arrow:SetTexture(C.Media.ArrowDown);
			PopoutButton.Arrow:SetPoint('TOP', Slot, 'BOTTOM', 0, 3);
		else
			PopoutButton.Arrow:SetSize(8, 14);
			PopoutButton.Arrow:SetTexture(C.Media.ArrowRight);
			PopoutButton.Arrow:SetPoint('LEFT', Slot, 'RIGHT', -3, 0);
		end
	end
	
	if ( AuroraConfig.QualityColour ) then
		hooksecurefunc('PaperDollItemSlotButton_Update', function(self)
			for _, slot in pairs(Slots) do
				local Slot = _G['Character'..slot];
				local SlotPopoutButton = _G['Character'..slot..'PopoutButton'];
				local SlotInfo, _, _ = GetInventorySlotInfo(slot);
				local ItemId = GetInventoryItemID('player', SlotInfo);

				if ItemId then
					local _, _, Rarity, _, _, _, _, _, _, _, _ = GetItemInfo(ItemId);
					
					if Rarity and Rarity > 1 then
						Slot:SetBackdropBorderColor(GetItemQualityColor(Rarity));
						SlotPopoutButton.Arrow:SetVertexColor(GetItemQualityColor(Rarity));
					else
						Slot:SetBackdropBorderColor(0, 0, 0);
						SlotPopoutButton.Arrow:SetVertexColor(C.r, C.g, C.b);
					end
				else
					Slot:SetBackdropBorderColor(0, 0, 0);
					SlotPopoutButton.Arrow:SetVertexColor(C.r, C.g, C.b);
				end
			end
		end);
	end
	
	CharacterAmmoSlot:SetNormalTexture('');
	F.StyleButton(CharacterAmmoSlot);
	F.CreateBD(CharacterAmmoSlot);
	
	select(1, CharacterAmmoSlot:GetRegions()):Hide();
	select(5, CharacterAmmoSlot:GetRegions()):Hide();
	
	CharacterAmmoSlotIconTexture:SetPoint('TOPLEFT', 1, -1);
	CharacterAmmoSlotIconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
	CharacterAmmoSlotIconTexture:SetTexCoord(unpack(TexCoords));
	
	GearManagerToggleButton:SetSize(24, 30);
	F.CreateBDFrame(GearManagerToggleButton);
	
	GearManagerToggleButton:GetNormalTexture():SetTexCoord(0.1875, 0.796875, 0.125, 0.890625);
	GearManagerToggleButton:GetPushedTexture():SetTexCoord(0.1875, 0.796875, 0.125, 0.890625);
	GearManagerToggleButton:GetHighlightTexture():SetTexture(1, 1, 1, 0.3);
	GearManagerToggleButton:GetHighlightTexture():SetAllPoints();
	-- PaperDollFrameItemFlyout
	PaperDollFrameItemFlyoutHighlight:Hide();
	
	local function SkinItemFlyouts(button)
		button.icon = _G[button:GetName()..'IconTexture'];
		
		if not button.Styled then
			F.StyleButton(button)
			F.CreateBD(button)
			button:GetNormalTexture():SetTexture(nil)
			
			button.icon:SetPoint('TOPLEFT', 1, -1);
			button.icon:SetPoint('BOTTOMRIGHT', -1, 1);
			button.icon:SetTexCoord(unpack(TexCoords));
			
			button.Styled = true
		end
		
		if ( AuroraConfig.QualityColour ) then
			local location = button.location;
			if not location then return; end
			if location >= PDFITEMFLYOUT_FIRST_SPECIAL_LOCATION then return; end

			local id = EquipmentManager_GetItemInfoByLocation(location);
			local _, _, quality = GetItemInfo(id);
			local r, g, b = GetItemQualityColor(quality);

			button:SetBackdropBorderColor(r, g, b);
		end
	end
	
	hooksecurefunc('PaperDollFrameItemFlyout_DisplayButton', SkinItemFlyouts)
	
	PaperDollFrameItemFlyoutButtons.bg1:SetAlpha(0);
	PaperDollFrameItemFlyoutButtons:DisableDrawLayer('ARTWORK');
	-- GearManagerDialog
	F.StripTextures(GearManagerDialog);
	F.CreateBD(GearManagerDialog);
	
	F.Reskin(GearManagerDialogDeleteSet);
	F.Reskin(GearManagerDialogEquipSet);
	F.Reskin(GearManagerDialogSaveSet);
	
	F.StripTextures(GearManagerDialogPopup);
	F.CreateBD(GearManagerDialogPopup);
	
	F.StripTextures(GearManagerDialogPopupScrollFrame);
	F.ReskinScroll(GearManagerDialogPopupScrollFrameScrollBar);
	
	F.ReskinInput(GearManagerDialogPopupEditBox);
	
	F.Reskin(GearManagerDialogPopupOkay);
	F.Reskin(GearManagerDialogPopupCancel);
	
	for i = 1, 10 do
		local Button = _G['GearSetButton'..i];
		local Icon = _G['GearSetButton'..i..'Icon'];
		
		F.StripTextures(Button);
		F.StyleButton(Button, nil, true);
		F.CreateBD(Button, .25);
		
		Icon:SetPoint('TOPLEFT', 1, -1);
		Icon:SetPoint('BOTTOMRIGHT', -1, 1);
		Icon:SetTexCoord(unpack(TexCoords));
	end
	
	for i=1, NUM_GEARSET_ICONS_SHOWN do
		local Button = _G['GearManagerDialogPopupButton'..i];
		local Icon = Button.icon
		
		if Button then
			F.StripTextures(Button);
			F.StyleButton(Button, nil, true);
			
			Icon:SetTexCoord(unpack(TexCoords))
			_G["GearManagerDialogPopupButton"..i.."Icon"]:SetTexture(nil)

			Icon:SetPoint('TOPLEFT', 1, -1);
			Icon:SetPoint('BOTTOMRIGHT', -1, 1);
			Button:SetFrameLevel(Button:GetFrameLevel() + 2)
			
			if not Button.Style then
				F.CreateBD(Button);
				
				Button.Style = true;
			end
		end
	end
	
	F.ReskinClose(GearManagerDialogClose);
end);