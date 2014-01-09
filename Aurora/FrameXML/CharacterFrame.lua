local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.StripTextures(CharacterFrame, true);
	F.SetBD(CharacterFrame, 10, -12, -32, 76);
	
	F.ReskinClose(CharacterFrameCloseButton, 'TOPRIGHT', CharacterFrame, 'TOPRIGHT', -36, -16);
	
	for i = 1, #CHARACTERFRAME_SUBFRAMES do
		local Tab = _G['CharacterFrameTab'..i];
		
		F.ReskinTab(Tab);
	end
	
	F.StripTextures(GearManagerDialog);
	F.CreateBD(GearManagerDialog);
	
	F.ReskinClose(GearManagerDialogClose);
	
	for i = 1, 10 do
		local Button = _G['GearSetButton'..i];
		local Icon = _G['GearSetButton'..i..'Icon'];
		
		F.StripTextures(Button);
		F.StyleButton(Button, nil, true);
		F.CreateBD(Button, .25);
		
		Icon:SetPoint('TOPLEFT', 1, -1);
		Icon:SetPoint('BOTTOMRIGHT', -1, 1);
		Icon:SetTexCoord(unpack(F.TexCoords));
	end
	
	F.Reskin(GearManagerDialogDeleteSet);
	F.Reskin(GearManagerDialogEquipSet);
	F.Reskin(GearManagerDialogSaveSet);
	
	F.Kill(PaperDollFrameItemFlyoutHighlight)
	
	PaperDollFrameItemFlyoutButtons.bg1:SetAlpha(0);
	PaperDollFrameItemFlyoutButtons:DisableDrawLayer('ARTWORK');
	
	local function SkinItemFlyouts(button)
		button.icon = _G[button:GetName()..'IconTexture'];
		
		if not button.Styled then
			F.StyleButton(button)
			F.CreateBD(button)
			button:GetNormalTexture():SetTexture(nil)
			
			button.icon:SetPoint('TOPLEFT', 1, -1);
			button.icon:SetPoint('BOTTOMRIGHT', -1, 1);
			button.icon:SetTexCoord(unpack(F.TexCoords));
			
			button.Styled = true
		end
		
		local location = button.location
		if not location then return end
		if location >= PDFITEMFLYOUT_FIRST_SPECIAL_LOCATION then return end

		local id = EquipmentManager_GetItemInfoByLocation(location)
		local _, _, quality = GetItemInfo(id)
		local r, g, b = GetItemQualityColor(quality)

		button:SetBackdropBorderColor(r, g, b)
	end
	
	hooksecurefunc('PaperDollFrameItemFlyout_DisplayButton', SkinItemFlyouts)
	
	F.StripTextures(GearManagerDialogPopup);
	F.CreateBD(GearManagerDialogPopup);
	
	F.ReskinInput(GearManagerDialogPopupEditBox);
	
	F.StripTextures(GearManagerDialogPopupScrollFrame);
	F.ReskinScroll(GearManagerDialogPopupScrollFrameScrollBar);
	
	for i=1, NUM_GEARSET_ICONS_SHOWN do
		local Button = _G['GearManagerDialogPopupButton'..i];
		local Icon = Button.icon
		
		if Button then
			F.StripTextures(Button);
			F.StyleButton(Button, nil, true);
			
			Icon:SetTexCoord(unpack(F.TexCoords))
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
	
	F.Reskin(GearManagerDialogPopupOkay);
	F.Reskin(GearManagerDialogPopupCancel);
	
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
	PTFB:SetTexture(C.media.arrowDown);
	PTFB:SetSize(10, 10);
	PTFB:SetPoint('CENTER');
	PTFB:SetVertexColor(1, 1, 1);
	
	F.StripTextures(PlayerTitlePickerFrame);
	F.CreateBD(PlayerTitlePickerFrame);
	
	F.ReskinScroll(PlayerTitlePickerScrollFrameScrollBar);
	
	local PlayerStatsLeft = CreateFrame('Frame', nil, CharacterAttributesFrame)
	PlayerStatsLeft:SetPoint('TOPLEFT', -1, -1);
	PlayerStatsLeft:SetPoint('BOTTOMRIGHT', -116, -7);
	F.CreateBD(PlayerStatsLeft, .25);
	
	local PlayerStatsRight = CreateFrame('Frame', nil, CharacterAttributesFrame)
	PlayerStatsRight:SetPoint('TOPLEFT', 116, -1);
	PlayerStatsRight:SetPoint('BOTTOMRIGHT', -1, -7);
	F.CreateBD(PlayerStatsRight, .25);
	
	local Slots = { 'HeadSlot', 'NeckSlot', 'ShoulderSlot', 'BackSlot', 'ChestSlot', 'ShirtSlot', 'TabardSlot', 'WristSlot', 'HandsSlot', 'WaistSlot', 'LegsSlot', 'FeetSlot', 'Finger0Slot', 'Finger1Slot', 'Trinket0Slot', 'Trinket1Slot', 'MainHandSlot', 'SecondaryHandSlot', 'RangedSlot' };
	for _, slot in pairs(Slots) do
		local Slot = _G['Character'..slot];
		local IconTexture = _G['Character'..slot..'IconTexture']
		local PopoutButton = _G['Character'..slot..'PopoutButton'];
		
		F.StripTextures(Slot);
		F.StyleButton(Slot);
		F.CreateBD(Slot);
		
		IconTexture:SetPoint('TOPLEFT', 1, -1);
		IconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
		IconTexture:SetTexCoord(unpack(F.TexCoords));

		F.StripTextures(PopoutButton);

		PopoutButton.Arrow = PopoutButton:CreateTexture(nil, 'OVERLAY');

		if Slot.verticalFlyout then
			PopoutButton.Arrow:SetSize(13, 8);
			PopoutButton.Arrow:SetTexture(C.media.arrowDown);
			PopoutButton.Arrow:SetPoint('TOP', Slot, 'BOTTOM', 0, 3);
		else
			PopoutButton.Arrow:SetSize(8, 14);
			PopoutButton.Arrow:SetTexture(C.media.arrowRight);
			PopoutButton.Arrow:SetPoint('LEFT', Slot, 'RIGHT', -3, 0);
		end
	end	
	
	F.StripTextures(CharacterAmmoSlot);
	F.StyleButton(CharacterAmmoSlot);
	F.CreateBD(CharacterAmmoSlot);
	
	CharacterAmmoSlotIconTexture:SetPoint('TOPLEFT', 1, -1);
	CharacterAmmoSlotIconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
	CharacterAmmoSlotIconTexture:SetTexCoord(unpack(F.TexCoords));
	
	local function ColorItemBorder()
		for _, slot in pairs(Slots) do
			local Target = _G['Character'..slot];
			local PopoutButton = _G['Character'..slot..'PopoutButton'];
			local SlotId, _, _ = GetInventorySlotInfo(slot);
			local ItemId = GetInventoryItemID('player', SlotId);

			if ItemId then
				local _, _, rarity, _, _, _, _, _, _, _, _ = GetItemInfo(ItemId);
				if rarity and rarity > 1 then
					Target:SetBackdropBorderColor(GetItemQualityColor(rarity))
					PopoutButton.Arrow:SetVertexColor(GetItemQualityColor(rarity))
				else
					Target:SetBackdropBorderColor(0, 0, 0);
					PopoutButton.Arrow:SetVertexColor(C.r, C.g, C.b);
				end
			else
				Target:SetBackdropBorderColor(0, 0, 0);
				PopoutButton.Arrow:SetVertexColor(C.r, C.g, C.b);
			end
		end
	end
	
	local CheckItemBorderColor = CreateFrame('Frame');
	CheckItemBorderColor:RegisterEvent('PLAYER_EQUIPMENT_CHANGED');
	CheckItemBorderColor:SetScript('OnEvent', ColorItemBorder);
	CharacterFrame:HookScript('OnShow', ColorItemBorder);
	ColorItemBorder();
	
	F.ReskinArrow(CharacterModelFrameRotateLeftButton, 'left');
	F.ReskinArrow(CharacterModelFrameRotateRightButton, 'right');
	
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
	
	F.StripTextures(CharacterAttributesFrame);
	-- Питомцы
	F.StripTextures(PetPaperDollFrame, true);
	
	for i=1, 3 do
		local Tab = _G['PetPaperDollFrameTab'..i];
		
		F.StripTextures(Tab);
	end
	
	F.ReskinArrow(PetModelFrameRotateLeftButton, 'left');
	F.ReskinArrow(PetModelFrameRotateRightButton, 'right');
	
	F.StripTextures(PetAttributesFrame);
	
	F.Reskin(PetPaperDollCloseButton);
	
	F.StripTextures(PetPaperDollFrameExpBar)
	PetPaperDollFrameExpBar:SetStatusBarTexture(C.media.backdrop)
	F.CreateBDFrame(PetPaperDollFrameExpBar, .25)
	
	F.StripTextures(PetPaperDollFrameCompanionFrame);
	
	F.CreateBD(CompanionModelFrame, .25);
	
	CompanionModelFrameRotateLeftButton:SetPoint('TOPLEFT', PetPaperDollFrame, 39, -90);
	F.ReskinArrow(CompanionModelFrameRotateLeftButton, 'left');
	F.ReskinArrow(CompanionModelFrameRotateRightButton, 'right');
	
	F.Reskin(CompanionSummonButton);
	
	hooksecurefunc('PetPaperDollFrame_UpdateCompanions', function()
		local Button, IconNormal, IconDisabled, ActiveTexture;
		
		for i = 1, NUM_COMPANIONS_PER_PAGE do
			Button = _G["CompanionButton"..i];
			IconNormal = Button:GetNormalTexture();
			IconDisabled = Button:GetDisabledTexture();
			ActiveTexture = _G['CompanionButton'..i..'ActiveTexture'];
			
			F.StyleButton(Button, nil, true);
			F.CreateBD(Button, .25);
			
			if IconNormal then
				IconNormal:SetPoint('TOPLEFT', 1, -1);
				IconNormal:SetPoint('BOTTOMRIGHT', -1, 1);
				IconNormal:SetTexCoord(unpack(F.TexCoords));
			end
			
			IconDisabled:SetTexture(nil);
			
			ActiveTexture:SetPoint('TOPLEFT', Button, 1, -1);
			ActiveTexture:SetPoint('BOTTOMRIGHT', Button, -1, 1);
			ActiveTexture:SetTexture(1, 1, 1, .25);
		end
	end)
	
	CompanionPrevPageButton:SetPoint('BOTTOMLEFT', 123, 91);
	F.ReskinArrow(CompanionPrevPageButton, 'left');
    F.ReskinArrow(CompanionNextPageButton, 'right');
	-- Репутация
	F.StripTextures(ReputationFrame, true);

	local function UpdateFactionSkins()
		for i = 1, GetNumFactions() do
			local ReputationBar = _G["ReputationBar"..i.."ReputationBar"];

			if ReputationBar then
				ReputationBar:SetStatusBarTexture(C.media.backdrop);

				if not ReputationBar.Skins then
					F.CreateBD(ReputationBar, .25);
					
					ReputationBar.Skins = true;
				end

				_G['ReputationBar'..i..'Background']:SetTexture(nil);
				_G['ReputationBar'..i..'ReputationBarHighlight1']:SetTexture(nil);
				_G['ReputationBar'..i..'ReputationBarHighlight2']:SetTexture(nil);
				_G['ReputationBar'..i..'ReputationBarAtWarHighlight1']:SetTexture(nil);
				_G['ReputationBar'..i..'ReputationBarAtWarHighlight2']:SetTexture(nil);
				_G['ReputationBar'..i..'ReputationBarLeftTexture']:SetTexture(nil);
				_G['ReputationBar'..i..'ReputationBarRightTexture']:SetTexture(nil);
			end
		end
	end

	ReputationFrame:HookScript('OnShow', UpdateFactionSkins);
	ReputationFrame:HookScript('OnEvent', UpdateFactionSkins);

	for i = 1, NUM_FACTIONS_DISPLAYED do
		local Button = _G['ReputationBar'..i..'ExpandOrCollapseButton'];
		
		F.ReskinExpandOrCollapse(Button);
	end

	hooksecurefunc('ReputationFrame_Update', function()
		local numFactions = GetNumFactions();
		local factionIndex, factionButton, isCollapsed;
		local factionOffset = FauxScrollFrame_GetOffset(ReputationListScrollFrame)

		for i = 1, NUM_FACTIONS_DISPLAYED do
			factionIndex = factionOffset + i;
			factionButton = _G['ReputationBar'..i..'ExpandOrCollapseButton'];

			if factionIndex <= numFactions then
				_, _, _, _, _, _, _, _, _, isCollapsed = GetFactionInfo(factionIndex);
				if isCollapsed then
					factionButton.Plus:Show();
				else
					factionButton.Plus:Hide();
				end
			end
		end
	end)
	
	F.StripTextures(ReputationListScrollFrame);
	F.ReskinScroll(ReputationListScrollFrameScrollBar);
	
	F.StripTextures(ReputationDetailFrame);
	F.CreateBD(ReputationDetailFrame);
	
	F.ReskinClose(ReputationDetailCloseButton);
	
	F.ReskinCheck(ReputationDetailAtWarCheckBox);
	F.ReskinCheck(ReputationDetailInactiveCheckBox);
	F.ReskinCheck(ReputationDetailMainScreenCheckBox);
	-- Навыки
	F.StripTextures(SkillFrame, true);
	
	F.StripTextures(SkillFrameExpandButtonFrame);
	F.ReskinExpandOrCollapse(SkillFrameCollapseAllButton);
	
	hooksecurefunc('SkillFrame_SetStatusBar', function(statusBarID, skillIndex, numSkills, adjustedSkillPoints)
		local _, header, isExpanded, _, _, _, _, _, _, _, _, _ = GetSkillLineInfo(skillIndex);
		
		local StatusBar = _G['SkillRankFrame'..statusBarID];
		local StatusBarBorder = _G['SkillRankFrame'..statusBarID..'Border'];
		local StatusBarBackground = _G['SkillRankFrame'..statusBarID..'Background'];
		
		StatusBar:SetStatusBarTexture(C.media.backdrop);

		F.CreateBD(StatusBar, .25)
		
		F.StripTextures(StatusBarBorder);
		StatusBarBackground:SetTexture(nil);
		
		local Label = _G['SkillTypeLabel'..statusBarID];
		
		F.ReskinExpandOrCollapse(Label);
		
		if ( header ) then
			if ( isExpanded ) then
				Label.Plus:Hide();
			else
				Label.Plus:Show();
			end
		end
	end)
	
	hooksecurefunc('SkillDetailFrame_SetStatusBar', function()
		local StatusBar = _G["SkillDetailStatusBar"];
		local StatusBarBorder = _G['SkillDetailStatusBarBorder'];
		local StatusBarBackground = _G['SkillDetailStatusBarBackground'];
		
		StatusBar:SetStatusBarTexture(C.media.backdrop);
		F.CreateBD(StatusBar, .25);
		
		StatusBarBorder:SetTexture(nil);
		StatusBarBackground:SetTexture(nil);
	end)
	
	hooksecurefunc('SkillFrame_UpdateSkills', function()
		local NumSkills = GetNumSkillLines();
		
		SkillFrameCollapseAllButton.isExpanded = 1;
		SkillFrameCollapseAllButton.Minus:Show();
		SkillFrameCollapseAllButton.Plus:Hide()
		for i=1, NumSkills do
			local temp, header, isExpanded = GetSkillLineInfo(i);
			if ( header ) then
				if ( not isExpanded ) then
					SkillFrameCollapseAllButton.isExpanded = nil;
					SkillFrameCollapseAllButton.Plus:Show()
					break;
				end
			end
		end
	end)
	
	F.StripTextures(SkillListScrollFrame);
	F.ReskinScroll(SkillListScrollFrameScrollBar);
	
	F.StripTextures(SkillDetailScrollFrame);
	F.ReskinScroll(SkillDetailScrollFrameScrollBar);
	
	F.Reskin(SkillFrameCancelButton);
	-- Валюта
	F.StripTextures(TokenFrame, true);
	
	hooksecurefunc('TokenFrame_Update', function()
		local scrollFrame = TokenFrameContainer;
		local offset = HybridScrollFrame_GetOffset(scrollFrame);
		local buttons = scrollFrame.buttons;
		local numButtons = #buttons;
		local name, isHeader, extraCurrencyType, icon, itemID;
		local button, index;
		
		for i = 1, numButtons do
			index = offset+i;
			name, isHeader, _, _, _, _, extraCurrencyType, icon, itemID = GetCurrencyListInfo(index);

			button = buttons[i];
			if name or name == "" then
				F.Kill(button.categoryLeft);
				F.Kill(button.categoryRight);
				F.Kill(button.highlight);
				
				if ( not isHeader ) then
					if ( extraCurrencyType == 1 ) then
						button.icon:SetTexCoord(unpack(F.TexCoords));
					elseif ( extraCurrencyType == 2 ) then
						local factionGroup = UnitFactionGroup('player');
						if ( factionGroup ) then
							button.icon:SetTexture("Interface\\TargetingFrame\\UI-PVP-"..factionGroup);
							button.icon:SetTexCoord( 0.03125, 0.59375, 0.03125, 0.59375 );
						else
							button.icon:SetTexCoord(unpack(F.TexCoords));
						end
					else
						button.icon:SetTexture(icon);
						button.icon:SetTexCoord(unpack(F.TexCoords));
					end
				end
			end
		end
	end)
	
	F.ReskinScroll(TokenFrameContainerScrollBar);
	
	F.Reskin(TokenFrameCancelButton);
	
	F.StripTextures(TokenFramePopup);
	F.CreateBD(TokenFramePopup);
	
	F.ReskinClose(TokenFramePopupCloseButton);
	
	F.ReskinCheck(TokenFramePopupInactiveCheckBox);
	F.ReskinCheck(TokenFramePopupBackpackCheckBox);
end)