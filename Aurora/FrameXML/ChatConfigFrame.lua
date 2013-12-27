local F, C = unpack(select(2, ...))

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.StripTextures(ChatConfigFrame, true);
	F.SetBD(ChatConfigFrame);
	
	hooksecurefunc('ChatConfig_CreateCheckboxes', function(frame, checkBoxTable, checkBoxTemplate)
		if frame.styled then return; end

		frame:SetBackdrop(nil);

		local checkBoxNameString = frame:GetName()..'CheckBox';

		if checkBoxTemplate == 'ChatConfigCheckBoxTemplate' then
			for index, value in ipairs(checkBoxTable) do
				local checkBoxName = checkBoxNameString..index;
				local checkbox = _G[checkBoxName];

				checkbox:SetBackdrop(nil);

				local bg = CreateFrame("Frame", nil, checkbox)
				bg:SetPoint("TOPLEFT");
				bg:SetPoint("BOTTOMRIGHT", 0, 1);
				bg:SetFrameLevel(checkbox:GetFrameLevel() - 1);
				F.CreateBD(bg, .25);

				F.ReskinCheck(_G[checkBoxName..'Check'])
			end
		elseif checkBoxTemplate == 'ChatConfigCheckBoxWithSwatchTemplate' or checkBoxTemplate == 'ChatConfigCheckBoxWithSwatchAndClassColorTemplate' then
			for index, value in ipairs(checkBoxTable) do
				local checkBoxName = checkBoxNameString..index;
				local checkbox = _G[checkBoxName];

				checkbox:SetBackdrop(nil);

				local bg = CreateFrame('Frame', nil, checkbox);
				bg:SetPoint('TOPLEFT');
				bg:SetPoint('BOTTOMRIGHT', 0, 1);
				bg:SetFrameLevel(checkbox:GetFrameLevel() - 1);
				F.CreateBD(bg, .25);

				F.ReskinColourSwatch(_G[checkBoxName..'ColorSwatch']);

				F.ReskinCheck(_G[checkBoxName..'Check']);

				if checkBoxTemplate == 'ChatConfigCheckBoxWithSwatchAndClassColorTemplate' then
					F.ReskinCheck(_G[checkBoxName..'ColorClasses']);
				end
			end
		end

		frame.styled = true;
	end)

	hooksecurefunc('ChatConfig_CreateTieredCheckboxes', function(frame, checkBoxTable, checkBoxTemplate, subCheckBoxTemplate)
		if frame.styled then return; end

		local checkBoxNameString = frame:GetName()..'CheckBox'

		for index, value in ipairs(checkBoxTable) do
			local checkBoxName = checkBoxNameString..index;

			F.ReskinCheck(_G[checkBoxName]);

			if value.subTypes then
				local subCheckBoxNameString = checkBoxName.."_";

				for k, v in ipairs(value.subTypes) do
					F.ReskinCheck(_G[subCheckBoxNameString..k]);
				end
			end
		end

		frame.styled = true;
	end)

	hooksecurefunc('ChatConfig_CreateColorSwatches', function(frame, swatchTable, swatchTemplate)
		if frame.styled then return; end

		frame:SetBackdrop(nil);

		local nameString = frame:GetName()..'Swatch';

		for index, value in ipairs(swatchTable) do
			local swatchName = nameString..index;
			local swatch = _G[swatchName];

			swatch:SetBackdrop(nil);

			local bg = CreateFrame('Frame', nil, swatch);
			bg:SetPoint('TOPLEFT');
			bg:SetPoint('BOTTOMRIGHT', 0, 1);
			bg:SetFrameLevel(swatch:GetFrameLevel()-1);
			F.CreateBD(bg, .25);

			F.ReskinColourSwatch(_G[swatchName..'ColorSwatch']);
		end

		frame.styled = true;
	end)

	for i = 1, 5 do
		_G["CombatConfigTab"..i.."Left"]:Hide()
		_G["CombatConfigTab"..i.."Middle"]:Hide()
		_G["CombatConfigTab"..i.."Right"]:Hide()
	end

	ChatConfigCategoryFrame:SetBackdrop(nil)
	ChatConfigBackgroundFrame:SetBackdrop(nil)
	ChatConfigCombatSettingsFilters:SetBackdrop(nil)
	CombatConfigColorsHighlighting:SetBackdrop(nil)
	CombatConfigColorsColorizeUnitName:SetBackdrop(nil)
	CombatConfigColorsColorizeSpellNames:SetBackdrop(nil)
	CombatConfigColorsColorizeDamageNumber:SetBackdrop(nil)
	CombatConfigColorsColorizeDamageSchool:SetBackdrop(nil)
	CombatConfigColorsColorizeEntireLine:SetBackdrop(nil)

	local combatBoxes = {CombatConfigColorsHighlightingLine, CombatConfigColorsHighlightingAbility, CombatConfigColorsHighlightingDamage, CombatConfigColorsHighlightingSchool, CombatConfigColorsColorizeUnitNameCheck, CombatConfigColorsColorizeSpellNamesCheck, CombatConfigColorsColorizeSpellNamesSchoolColoring, CombatConfigColorsColorizeDamageNumberCheck, CombatConfigColorsColorizeDamageNumberSchoolColoring, CombatConfigColorsColorizeDamageSchoolCheck, CombatConfigColorsColorizeEntireLineCheck, CombatConfigFormattingShowTimeStamp, CombatConfigFormattingShowBraces, CombatConfigFormattingUnitNames, CombatConfigFormattingSpellNames, CombatConfigFormattingItemNames, CombatConfigFormattingFullText, CombatConfigSettingsShowQuickButton, CombatConfigSettingsSolo, CombatConfigSettingsParty, CombatConfigSettingsRaid}

	for _, box in next, combatBoxes do
		F.ReskinCheck(box)
	end

	local bg = CreateFrame("Frame", nil, ChatConfigCombatSettingsFilters)
	bg:SetPoint("TOPLEFT", 3, 0)
	bg:SetPoint("BOTTOMRIGHT", 0, 1)
	bg:SetFrameLevel(ChatConfigCombatSettingsFilters:GetFrameLevel()-1)
	F.CreateBD(bg, .25)

	F.Reskin(CombatLogDefaultButton)
	F.Reskin(ChatConfigCombatSettingsFiltersCopyFilterButton)
	F.Reskin(ChatConfigCombatSettingsFiltersAddFilterButton)
	F.Reskin(ChatConfigCombatSettingsFiltersDeleteButton)
	F.Reskin(CombatConfigSettingsSaveButton)
	F.Reskin(ChatConfigFrameDefaultButton)
	F.Reskin(ChatConfigFrameOkayButton)
	F.ReskinArrow(ChatConfigMoveFilterUpButton, "up")
	F.ReskinArrow(ChatConfigMoveFilterDownButton, "down")
	F.ReskinInput(CombatConfigSettingsNameEditBox)
	F.ReskinRadio(CombatConfigColorsColorizeEntireLineBySource)
	F.ReskinRadio(CombatConfigColorsColorizeEntireLineByTarget)
	F.ReskinColourSwatch(CombatConfigColorsColorizeSpellNamesColorSwatch)
	F.ReskinColourSwatch(CombatConfigColorsColorizeDamageNumberColorSwatch)
	
	F.CreateBD(ChatConfigChatSettingsClassColorLegend, .25)
	F.CreateBD(ChatConfigChannelSettingsClassColorLegend, .25)
	
	ChatConfigMoveFilterUpButton:SetSize(28, 28)
	ChatConfigMoveFilterDownButton:SetSize(28, 28)

	ChatConfigCombatSettingsFiltersAddFilterButton:SetPoint("RIGHT", ChatConfigCombatSettingsFiltersDeleteButton, "LEFT", -1, 0)
	ChatConfigCombatSettingsFiltersCopyFilterButton:SetPoint("RIGHT", ChatConfigCombatSettingsFiltersAddFilterButton, "LEFT", -1, 0)
	ChatConfigMoveFilterUpButton:SetPoint("TOPLEFT", ChatConfigCombatSettingsFilters, "BOTTOMLEFT", 3, 0)
	ChatConfigMoveFilterDownButton:SetPoint("LEFT", ChatConfigMoveFilterUpButton, "RIGHT", 1, 0)
end)