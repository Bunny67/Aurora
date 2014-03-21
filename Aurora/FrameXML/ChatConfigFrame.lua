local F, C = unpack(select(2, ...))

local _G = getfenv(0);
local ipairs = ipairs;

tinsert(C.modules['Aurora'], function()
	F.SetBD(ChatConfigFrame);
	
	ChatConfigCategoryFrame:SetBackdrop(nil);
	ChatConfigBackgroundFrame:SetBackdrop(nil);
	
	F.CreateBD(ChatConfigChatSettingsClassColorLegend, .25);
	F.CreateBD(ChatConfigChannelSettingsClassColorLegend, .25);
	
	ChatConfigCombatSettingsFilters:SetBackdrop(nil); -- ChatConfigCombatSettingsFilters;
	
	local BG = CreateFrame('Frame', nil, ChatConfigCombatSettingsFilters);
	BG:SetPoint('TOPLEFT', 3, -3);
	BG:SetPoint('BOTTOMRIGHT', 0, 1);
	BG:SetFrameLevel(ChatConfigCombatSettingsFilters:GetFrameLevel() - 1);
	F.CreateBD(BG, .25);
	
	F.ReskinScroll(ChatConfigCombatSettingsFiltersScrollFrameScrollBar);
	ChatConfigCombatSettingsFiltersScrollFrameScrollBarBorder:Hide();
	
	F.Reskin(ChatConfigCombatSettingsFiltersDeleteButton);
	F.Reskin(ChatConfigCombatSettingsFiltersAddFilterButton);
	ChatConfigCombatSettingsFiltersAddFilterButton:SetPoint('RIGHT', ChatConfigCombatSettingsFiltersDeleteButton, 'LEFT', -1, 0);
	F.Reskin(ChatConfigCombatSettingsFiltersCopyFilterButton);
	ChatConfigCombatSettingsFiltersCopyFilterButton:SetPoint('RIGHT', ChatConfigCombatSettingsFiltersAddFilterButton, 'LEFT', -1, 0);
	
	F.ReskinArrow(ChatConfigMoveFilterUpButton, 'Up');
	ChatConfigMoveFilterUpButton:SetSize(28, 28);
	ChatConfigMoveFilterUpButton:SetPoint('TOPLEFT', ChatConfigCombatSettingsFilters, 'BOTTOMLEFT', 3, 0);
	F.ReskinArrow(ChatConfigMoveFilterDownButton, 'Down');
	ChatConfigMoveFilterDownButton:SetSize(28, 28);
	ChatConfigMoveFilterDownButton:SetPoint('LEFT', ChatConfigMoveFilterUpButton, 'RIGHT', 1, 0);
	
	CombatConfigColorsHighlighting:SetBackdrop(nil); -- CombatConfigColors;
	CombatConfigColorsColorizeUnitName:SetBackdrop(nil);
	CombatConfigColorsColorizeSpellNames:SetBackdrop(nil);
	
	F.ReskinColourSwatch(CombatConfigColorsColorizeSpellNamesColorSwatch);
	
	CombatConfigColorsColorizeDamageNumber:SetBackdrop(nil);
	
	F.ReskinColourSwatch(CombatConfigColorsColorizeDamageNumberColorSwatch);
	
	CombatConfigColorsColorizeDamageSchool:SetBackdrop(nil);
	CombatConfigColorsColorizeEntireLine:SetBackdrop(nil);
	
	F.ReskinRadio(CombatConfigColorsColorizeEntireLineBySource);
	F.ReskinRadio(CombatConfigColorsColorizeEntireLineByTarget);
	
	F.ReskinInput(CombatConfigSettingsNameEditBox); -- CombatConfigSettings;
	
	F.Reskin(CombatConfigSettingsSaveButton);
	
	local combatBoxes = {
		-- ConfigColors;
		CombatConfigColorsHighlightingLine, CombatConfigColorsHighlightingAbility, CombatConfigColorsHighlightingDamage, CombatConfigColorsHighlightingSchool,
		CombatConfigColorsColorizeUnitNameCheck,
		CombatConfigColorsColorizeSpellNamesCheck, CombatConfigColorsColorizeSpellNamesSchoolColoring,
		CombatConfigColorsColorizeDamageNumberCheck, CombatConfigColorsColorizeDamageNumberSchoolColoring,
		CombatConfigColorsColorizeDamageSchoolCheck,
		CombatConfigColorsColorizeEntireLineCheck,
		-- ConfigFormatting;
		CombatConfigFormattingShowTimeStamp, CombatConfigFormattingShowBraces, CombatConfigFormattingUnitNames, CombatConfigFormattingSpellNames, CombatConfigFormattingItemNames, CombatConfigFormattingFullText,
		-- ConfigSettings;
		CombatConfigSettingsShowQuickButton, CombatConfigSettingsSolo, CombatConfigSettingsParty, CombatConfigSettingsRaid
	};

	for _, box in next, combatBoxes do
		F.ReskinCheck(box);
	end
	
	for i = 1, 5 do
		local Tab = _G['CombatConfigTab'..i];
		
		_G['CombatConfigTab'..i..'Left']:Hide();
		_G['CombatConfigTab'..i..'Middle']:Hide();
		_G['CombatConfigTab'..i..'Right']:Hide();
		
		Tab:SetHighlightTexture(C.Media.Backdrop);
		local Highlight = Tab:GetHighlightTexture();
		Highlight:ClearAllPoints();
		Highlight:SetPoint('TOPLEFT', 2, -11);
		Highlight:SetPoint('BOTTOMRIGHT', -2, 1);
		Highlight:SetVertexColor(C.r, C.g, C.b, .25);
		
		local TabBG = CreateFrame('Frame', nil, Tab);
		TabBG:SetPoint('TOPLEFT', 1, -10);
		TabBG:SetPoint('BOTTOMRIGHT', -1, 0);
		TabBG:SetFrameLevel(Tab:GetFrameLevel() - 1);
		F.CreateBD(TabBG, 0);
		F.CreateGradient(TabBG);
	end
	
	F.Reskin(ChatConfigFrameDefaultButton);
	F.Reskin(CombatLogDefaultButton);
	F.Reskin(ChatConfigFrameCancelButton); -- Hide();
	F.Reskin(ChatConfigFrameOkayButton);
	
	hooksecurefunc('ChatConfig_CreateCheckboxes', function(frame, checkBoxTable, checkBoxTemplate)
		frame:SetBackdrop(nil);

		local checkBoxNameString = frame:GetName()..'CheckBox';

		if ( checkBoxTemplate == 'ChatConfigCheckBoxTemplate' ) then
			for index, value in ipairs(checkBoxTable) do
				local checkBoxName = checkBoxNameString..index;
				local checkbox = _G[checkBoxName];
				
				if ( not checkBox and not checkbox.BG ) then
					checkbox:SetBackdrop(nil);

					checkbox.BG = CreateFrame('Frame', nil, checkbox)
					checkbox.BG:SetPoint('TOPLEFT');
					checkbox.BG:SetPoint('BOTTOMRIGHT', 0, 1);
					checkbox.BG:SetFrameLevel(checkbox:GetFrameLevel() - 1);
					F.CreateBD(checkbox.BG, .25);

					F.ReskinCheck(_G[checkBoxName..'Check']);
				end
			end
		elseif ( checkBoxTemplate == 'ChatConfigCheckBoxWithSwatchTemplate' ) or ( checkBoxTemplate == 'ChatConfigCheckBoxWithSwatchAndClassColorTemplate' ) then
			for index, value in ipairs(checkBoxTable) do
				local checkBoxName = checkBoxNameString..index;
				local checkbox = _G[checkBoxName];
				
				if ( not checkBox and not checkbox.BG ) then
					checkbox:SetBackdrop(nil);

					checkbox.BG = CreateFrame('Frame', nil, checkbox);
					checkbox.BG:SetPoint('TOPLEFT');
					checkbox.BG:SetPoint('BOTTOMRIGHT', 0, 1);
					checkbox.BG:SetFrameLevel(checkbox:GetFrameLevel() - 1);
					F.CreateBD(checkbox.BG, .25);

					F.ReskinColourSwatch(_G[checkBoxName..'ColorSwatch']);

					F.ReskinCheck(_G[checkBoxName..'Check']);
					
					if ( checkBoxTemplate == 'ChatConfigCheckBoxWithSwatchAndClassColorTemplate' ) then
						F.ReskinCheck(_G[checkBoxName..'ColorClasses']);
					end
				end
			end
		end
	end);

	hooksecurefunc('ChatConfig_CreateTieredCheckboxes', function(frame, checkBoxTable, checkBoxTemplate, subCheckBoxTemplate)
		local checkBoxNameString = frame:GetName()..'CheckBox';

		for index, value in ipairs(checkBoxTable) do
			local checkBoxName = checkBoxNameString..index;
			
			if ( _G[checkBoxName] ) then
				F.ReskinCheck(_G[checkBoxName]);

				if value.subTypes then
					local subCheckBoxNameString = checkBoxName.."_";

					for k, v in ipairs(value.subTypes) do
						local subCheckBoxName = subCheckBoxNameString..k;
						if ( _G[subCheckBoxName] ) then
							F.ReskinCheck(_G[subCheckBoxNameString..k]);
						end
					end
				end
			end
		end
	end);

	hooksecurefunc('ChatConfig_CreateColorSwatches', function(frame, swatchTable, swatchTemplate)
		frame:SetBackdrop(nil);

		local nameString = frame:GetName()..'Swatch';

		for index, value in ipairs(swatchTable) do
			local swatchName = nameString..index;
			local swatch = _G[swatchName];
			
			if ( not swatch.BG ) then
				swatch:SetBackdrop(nil);

				swatch.BG = CreateFrame('Frame', nil, swatch);
				swatch.BG:SetPoint('TOPLEFT');
				swatch.BG:SetPoint('BOTTOMRIGHT', 0, 1);
				swatch.BG:SetFrameLevel(swatch:GetFrameLevel() - 1);
				F.CreateBD(swatch.BG, .25);

				F.ReskinColourSwatch(_G[swatchName..'ColorSwatch']);
			end
		end
	end);
end)