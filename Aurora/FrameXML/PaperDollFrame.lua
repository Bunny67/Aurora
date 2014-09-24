local _G = getfenv(0);
local unpack = unpack;
local select = select;

local F, C = unpack(select(2, ...));

local TexCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	-- PaperDollFrame;
	for i = 1, 4 do
		select(i, PaperDollFrame:GetRegions()):SetTexture(nil);
	end
	
	for i = 1, 3 do
		select(i, PlayerTitleFrame:GetRegions()):SetTexture(nil);
	end
	
	do
		local PTF = CreateFrame('Frame', nil, PlayerTitleFrame);
		PTF:SetPoint('TOPLEFT', 20, 5);
		PTF:SetPoint('BOTTOMRIGHT', -16, 13);
		PTF:SetFrameLevel(PlayerTitleFrame:GetFrameLevel() - 1);
		F:CreateBD(PTF, 0);
		F:CreateGradient(PTF);
	end
	
	F:Reskin(PlayerTitleFrameButton);
	
	do
		local PTFB = PlayerTitleFrameButton:CreateTexture(nil, 'ARTWORK');
		PTFB:SetTexture(C.Media.ArrowDown);
		PTFB:SetSize(10, 10);
		PTFB:SetPoint('CENTER');
		PTFB:SetVertexColor(1, 1, 1);
	end
	
	F:CreateBD(PlayerTitlePickerFrame);
	
	F:ReskinScroll(PlayerTitlePickerScrollFrameScrollBar);
	
	F:ReskinArrow(CharacterModelFrameRotateLeftButton, 'Left');
	F:ReskinArrow(CharacterModelFrameRotateRightButton, 'Right');
	
	CharacterAttributesFrame:DisableDrawLayer('BACKGROUND');
	
	do
		local PlayerStatsLeft = CreateFrame('Frame', nil, CharacterAttributesFrame)
		PlayerStatsLeft:SetPoint('TOPLEFT', -1, -1);
		PlayerStatsLeft:SetPoint('BOTTOMRIGHT', -116, -7);
		F:CreateBD(PlayerStatsLeft, .25);
		
		local PlayerStatsRight = CreateFrame('Frame', nil, CharacterAttributesFrame)
		PlayerStatsRight:SetPoint('TOPLEFT', 116, -1);
		PlayerStatsRight:SetPoint('BOTTOMRIGHT', -1, -7);
		F:CreateBD(PlayerStatsRight, .25);
	end
	
	F:ReskinDropDown(PlayerStatFrameLeftDropDown);
	F:ReskinDropDown(PlayerStatFrameRightDropDown);
	
	F:CreateBDFrame(CharacterResistanceFrame);
	CharacterResistanceFrame:SetSize(28, 140);
	
	do
		local MagicRes, MagicResTexture;
		
		for i = 1, 5 do
			MagicRes = _G['MagicResFrame'..i];
			MagicResTexture = select(1, MagicRes:GetRegions());
			
			MagicRes:SetSize(28, 28);
			
			if ( i == 1 ) then
				MagicResTexture:SetTexCoord(0.21875, 0.78125, 0.25, 0.3203125);
			elseif ( i == 2 ) then
				MagicResTexture:SetTexCoord(0.21875, 0.78125, 0.0234375, 0.09375);
			elseif ( i == 3 ) then
				MagicResTexture:SetTexCoord(0.21875, 0.78125, 0.13671875, 0.20703125);
			elseif ( i == 4 ) then
				MagicResTexture:SetTexCoord(0.21875, 0.78125, 0.36328125, 0.43359375);
			else
				MagicResTexture:SetTexCoord(0.21875, 0.78125, 0.4765625, 0.546875);
			end
		end
	end
	
	do
		local Slots = { 'HeadSlot', 'NeckSlot', 'ShoulderSlot', 'BackSlot', 'ChestSlot', 'ShirtSlot', 'TabardSlot', 'WristSlot', 'HandsSlot', 'WaistSlot', 'LegsSlot', 'FeetSlot', 'Finger0Slot', 'Finger1Slot', 'Trinket0Slot', 'Trinket1Slot', 'MainHandSlot', 'SecondaryHandSlot', 'RangedSlot' };
		local Slot, SlotIcon, SlotPopoup;
		
		for i = 1, #Slots do
			Slot = _G['Character'..Slots[i]];
			SlotIcon = _G['Character'..Slots[i]..'IconTexture']
			SlotPopoup = _G['Character'..Slots[i]..'PopoutButton'];
			
			Slot:SetNormalTexture('');
			F:StyleButton(Slot);
			F:CreateBD(Slot);
			
			SlotIcon:SetPoint('TOPLEFT', 1, -1);
			SlotIcon:SetPoint('BOTTOMRIGHT', -1, 1);
			SlotIcon:SetTexCoord(unpack(TexCoords));
			
			SlotPopoup:SetNormalTexture('');
			SlotPopoup:SetHighlightTexture('');
			
			SlotPopoup.Arrow = SlotPopoup:CreateTexture(nil, 'OVERLAY');
			
			if Slot.verticalFlyout then
				SlotPopoup.Arrow:SetSize(13, 8);
				SlotPopoup.Arrow:SetTexture(C.Media.ArrowDown);
				SlotPopoup.Arrow:SetPoint('TOP', Slot, 'BOTTOM', 0, 3);
			else
				SlotPopoup.Arrow:SetSize(8, 14);
				SlotPopoup.Arrow:SetTexture(C.Media.ArrowRight);
				SlotPopoup.Arrow:SetPoint('LEFT', Slot, 'RIGHT', -3, 0);
			end
		end
		
		hooksecurefunc('PaperDollItemSlotButton_Update', function(self)
			local quality = GetInventoryItemQuality("player", self:GetID());
			
			if(quality and quality > ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
				self:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b);
			else
				self:SetBackdropBorderColor(0, 0, 0);
			end
		end);
		
		CharacterAmmoSlot:SetNormalTexture('');
		F:StyleButton(CharacterAmmoSlot);
		F:CreateBD(CharacterAmmoSlot);
		
		select(1, CharacterAmmoSlot:GetRegions()):Hide();
		select(5, CharacterAmmoSlot:GetRegions()):Hide();
		
		CharacterAmmoSlotIconTexture:SetPoint('TOPLEFT', 1, -1);
		CharacterAmmoSlotIconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
		CharacterAmmoSlotIconTexture:SetTexCoord(unpack(TexCoords));
	end
	
	GearManagerToggleButton:SetSize(24, 30);
	F:CreateBDFrame(GearManagerToggleButton);
	
	GearManagerToggleButton:GetNormalTexture():SetTexCoord(0.1875, 0.796875, 0.125, 0.890625);
	GearManagerToggleButton:GetPushedTexture():SetTexCoord(0.1875, 0.796875, 0.125, 0.890625);
	GearManagerToggleButton:GetHighlightTexture():SetAllPoints();
	GearManagerToggleButton:GetHighlightTexture():SetTexture(1, 1, 1, 0.3);
	-- PaperDollFrameItemFlyout;
	PaperDollFrameItemFlyout:DisableDrawLayer('OVERLAY');
	
	local function SkinItemFlyouts(button)
		button.icon = _G[button:GetName()..'IconTexture'];
		
		if ( not button.Styled ) then
			F:StyleButton(button)
			F:CreateBD(button)
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
	-- GearManagerDialog;
	F:SetBD(GearManagerDialog, 5, -3, -2, 6);
	GearManagerDialog:DisableDrawLayer('OVERLAY');
	GearManagerDialog:DisableDrawLayer('BACKGROUND');
	
	F:Reskin(GearManagerDialogDeleteSet);
	F:Reskin(GearManagerDialogEquipSet);
	F:Reskin(GearManagerDialogSaveSet);
	
	F:SetBD(GearManagerDialogPopup, 5, -3, -2, 6);
	GearManagerDialogPopup:DisableDrawLayer('BACKGROUND');
	
	GearManagerDialogPopupScrollFrame:DisableDrawLayer('BACKGROUND');
	F:ReskinScroll(GearManagerDialogPopupScrollFrameScrollBar);
	
	F:ReskinInput(GearManagerDialogPopupEditBox);
	
	F:Reskin(GearManagerDialogPopupCancel);
	F:Reskin(GearManagerDialogPopupOkay);
	
	do
		local Button, ButtonIcon;
		
		for i = 1, 10 do
			Button = _G['GearSetButton'..i];
			ButtonIcon = _G['GearSetButton'..i..'Icon'];
			
			F:StyleButton(Button, nil, true);
			F:CreateBD(Button, .25);
			
			select(2, Button:GetRegions()):SetTexture(nil);
			
			ButtonIcon:SetPoint('TOPLEFT', 1, -1);
			ButtonIcon:SetPoint('BOTTOMRIGHT', -1, 1);
			ButtonIcon:SetTexCoord(unpack(TexCoords));
		end
	end
	
	do
		local Button, ButtonIcon;
		
		for i = 1, NUM_GEARSET_ICONS_SHOWN do
			Button = _G['GearManagerDialogPopupButton'..i];
			ButtonIcon = Button.icon;
			
			if(Button) then
				F:StyleButton(Button, nil, true);
				F:CreateBD(Button);
				
				select(2, Button:GetRegions()):SetTexture(nil);
				
				ButtonIcon:SetTexCoord(unpack(TexCoords))
				_G['GearManagerDialogPopupButton'..i..'Icon']:SetTexture(nil);

				ButtonIcon:SetPoint('TOPLEFT', 1, -1);
				ButtonIcon:SetPoint('BOTTOMRIGHT', -1, 1);
				Button:SetFrameLevel(Button:GetFrameLevel() + 2);
			end
		end
	end
	
	F:ReskinClose(GearManagerDialogClose, 'TOPRIGHT', GearManagerDialog, 'TOPRIGHT', -6, -7);
end);