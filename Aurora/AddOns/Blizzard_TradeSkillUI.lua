local F, C = unpack(select(2, ...));

local _G = getfenv(0);

C.modules['Blizzard_TradeSkillUI'] = function()
	F.StripTextures(TradeSkillFrame, true);
	F.SetBD(TradeSkillFrame, 10, -12, -31, 74);
	
	F.ReskinClose(TradeSkillFrameCloseButton, 'TOPRIGHT', TradeSkillFrame, 'TOPRIGHT', -35, -16);
	
	F.StripTextures(TradeSkillRankFrame, true);
	TradeSkillRankFrame:SetStatusBarTexture(C.Media.Backdrop);
	TradeSkillRankFrame.SetStatusBarColor = F.dummy;
	TradeSkillRankFrame:GetStatusBarTexture():SetGradient('VERTICAL', .1, .3, .9, .2, .4, 1);
	
	local BD = CreateFrame('Frame', nil, TradeSkillRankFrame);
	BD:SetFrameLevel(TradeSkillRankFrame:GetFrameLevel() - 1);
	BD:SetPoint('TOPLEFT', -1, 1);
	BD:SetPoint('BOTTOMRIGHT', 1, -1);
	F.CreateBD(BD, .25);
	
	F.ReskinCheck(TradeSkillFrameAvailableFilterCheckButton);
	
	F.ReskinInput(TradeSkillFrameEditBox);
	
	F.ReskinDropDown(TradeSkillSubClassDropDown);
	F.ReskinDropDown(TradeSkillInvSlotDropDown);
	
	F.StripTextures(TradeSkillExpandButtonFrame);
	
	local ColourExpandOrCollapse = F.ColourExpandOrCollapse
	local ClearExpandOrCollapse = F.ClearExpandOrCollapse
	
	local function StyleSkillButton(SkillButton)
		SkillButton:SetNormalTexture('');
		SkillButton.SetNormalTexture = F.dummy;
		SkillButton:SetPushedTexture('');

		SkillButton.BD = CreateFrame('Frame', nil, SkillButton);
		SkillButton.BD:SetSize(13, 13);
		SkillButton.BD:SetPoint("LEFT", 4, 1);
		SkillButton.BD:SetFrameLevel(SkillButton:GetFrameLevel()-1);
		F.CreateBD(SkillButton.BD, 0);

		SkillButton.Gradient = F.CreateGradient(SkillButton);
		SkillButton.Gradient:SetPoint('TOPLEFT', SkillButton.BD, 1, -1);
		SkillButton.Gradient:SetPoint('BOTTOMRIGHT', SkillButton.BD, -1, 1);

		SkillButton.Minus = SkillButton:CreateTexture(nil, 'OVERLAY');
		SkillButton.Minus:SetSize(7, 1);
		SkillButton.Minus:SetPoint('CENTER', SkillButton.BD);
		SkillButton.Minus:SetTexture(C.Media.Backdrop);
		SkillButton.Minus:SetVertexColor(1, 1, 1);

		SkillButton.Plus = SkillButton:CreateTexture(nil, 'OVERLAY');
		SkillButton.Plus:SetSize(1, 7);
		SkillButton.Plus:SetPoint('CENTER', SkillButton.BD);
		SkillButton.Plus:SetTexture(C.Media.Backdrop);
		SkillButton.Plus:SetVertexColor(1, 1, 1);

		SkillButton:HookScript('OnEnter', ColourExpandOrCollapse);
		SkillButton:HookScript('OnLeave', ClearExpandOrCollapse);
	end

	StyleSkillButton(TradeSkillCollapseAllButton);
	TradeSkillCollapseAllButton:SetDisabledTexture('');
	TradeSkillCollapseAllButton:SetHighlightTexture('');
	
	hooksecurefunc('TradeSkillFrame_Update', function()
		local numTradeSkills = GetNumTradeSkills()
		local skillOffset = FauxScrollFrame_GetOffset(TradeSkillListScrollFrame)
		local buttonIndex = 0

		for i = 1, TRADE_SKILLS_DISPLAYED do
			local skillIndex = i + skillOffset
			_, skillType, _, isExpanded = GetTradeSkillInfo(skillIndex)
			buttonIndex = i

			local skillButton = _G['TradeSkillSkill'..buttonIndex]

			if not skillButton.styled then
				skillButton.styled = true

				local buttonHighlight = _G['TradeSkillSkill'..buttonIndex..'Highlight']
				buttonHighlight:SetTexture('')
				buttonHighlight.SetTexture = F.dummy

				StyleSkillButton(skillButton)
			end

			if skillIndex <= numTradeSkills then
				if skillType == 'header' then
					skillButton.BD:SetPoint('LEFT', 4, 1);

					skillButton.BD:Show();
					skillButton.Gradient:Show();
					skillButton.Minus:Show();
					if isExpanded then
						skillButton.Plus:Hide();
					else
						skillButton.Plus:Show();
					end
				else
					skillButton.BD:Hide();
					skillButton.Gradient:Hide();
					skillButton.Minus:Hide();
					skillButton.Plus:Hide();
				end
			end
		end
		
		if TradeSkillCollapseAllButton.collapsed == 1 then
			TradeSkillCollapseAllButton.Plus:Show();
		else
			TradeSkillCollapseAllButton.Plus:Hide();
		end
	end)
	
	F.StripTextures(TradeSkillListScrollFrame);
	F.ReskinScroll(TradeSkillListScrollFrameScrollBar);
	
	F.StripTextures(TradeSkillDetailScrollChildFrame);
	
	hooksecurefunc('TradeSkillFrame_SetSelection', function()
		local Icon = TradeSkillSkillIcon:GetNormalTexture();
		
		if Icon then
			Icon:SetPoint("TOPLEFT", 1, -1);
			Icon:SetPoint("BOTTOMRIGHT", -1, 1);
			Icon:SetTexCoord(unpack(F.TexCoords));
			F.CreateBD(TradeSkillSkillIcon);
		else
			TradeSkillSkillIcon:SetBackdrop(nil);
		end
	end)
	
	for i = 1, MAX_TRADE_SKILL_REAGENTS do
		local bu = _G["TradeSkillReagent"..i]
		local ic = _G["TradeSkillReagent"..i.."IconTexture"]

		_G["TradeSkillReagent"..i.."NameFrame"]:SetAlpha(0)

		ic:SetTexCoord(.08, .92, .08, .92)
		ic:SetDrawLayer("ARTWORK")
		F.CreateBG(ic)

		local bd = CreateFrame("Frame", nil, bu)
		bd:SetPoint("TOPLEFT", 39, -1)
		bd:SetPoint("BOTTOMRIGHT", 0, 1)
		bd:SetFrameLevel(0)
		F.CreateBD(bd, .25)

		_G["TradeSkillReagent"..i.."Name"]:SetParent(bd)
	end
	
	F.StripTextures(TradeSkillDetailScrollFrame);
	F.ReskinScroll(TradeSkillDetailScrollFrameScrollBar);
	
	F.Reskin(TradeSkillCreateAllButton);
	
	F.ReskinArrow(TradeSkillDecrementButton, 'Left');
	F.ReskinInput(TradeSkillInputBox);
	F.ReskinArrow(TradeSkillIncrementButton, 'Right');
	
	F.Reskin(TradeSkillCreateButton);
	F.Reskin(TradeSkillCancelButton);
end