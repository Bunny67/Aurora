local F, C = unpack(select(2, ...))
-- ПРОФЕССИИ
C.modules['Blizzard_TradeSkillUI'] = function()
	if AuroraConfig.TradeSkillUI then
	-- [[ Чистка текстур ]]
		local AllTradeSkillUIStripTextures = {'TradeSkillFrame', 'TradeSkillListScrollFrame', 'TradeSkillDetailScrollFrame', 'TradeSkillExpandButtonFrame', 'TradeSkillDetailScrollChildFrame'}
		for i = 1, #AllTradeSkillUIStripTextures do
			F.StripTextures(_G[AllTradeSkillUIStripTextures[i]], true)
		end
	-- [[ Выпадающая кнопка ]]
		local AllTradeSkillUIDropDowns = {'TradeSkillSubClassDropDown', 'TradeSkillInvSlotDropDown'}
		for i = 1, #AllTradeSkillUIDropDowns do
			F.ReskinDropDown(_G[AllTradeSkillUIDropDowns[i]])
		end
	-- [[ Полоса прокрутки ]]
		local AllTradeSkillUIScrollbars = {'TradeSkillListScrollFrameScrollBar', 'TradeSkillDetailScrollFrameScrollBar'}
		for i = 1, #AllTradeSkillUIScrollbars do
			F.ReskinScroll(_G[AllTradeSkillUIScrollbars[i]])
		end
	-- [[ Поля ввода ]]
		local AllTradeSkillUIInputs = {'TradeSkillFrameEditBox', 'TradeSkillInputBox'}
		for i = 1, #AllTradeSkillUIInputs do
			F.ReskinInput(_G[AllTradeSkillUIInputs[i]])
		end
	-- [[ Флажки ]]
		local AllTradeSkillUICheckBoxes = {'TradeSkillFrameAvailableFilterCheckButton'}
		for i = 1, #AllTradeSkillUICheckBoxes do
			F.ReskinCheck(_G[AllTradeSkillUICheckBoxes[i]])
		end
	-- [[ Кнопки ]]
		local AllTradeSkillUIButtons = {'TradeSkillCreateAllButton', 'TradeSkillCreateButton', 'TradeSkillCancelButton'}
		for i = 1, #AllTradeSkillUIButtons do
			F.Reskin(_G[AllTradeSkillUIButtons[i]])
		end
		
		hooksecurefunc("TradeSkillFrame_SetSelection", function()
			local ic = TradeSkillSkillIcon:GetNormalTexture()
			if ic then
				ic:SetTexCoord(.08, .92, .08, .92)
				ic:SetPoint("TOPLEFT", 1, -1)
				ic:SetPoint("BOTTOMRIGHT", -1, 1)
				F.CreateBD(TradeSkillSkillIcon)
			else
				TradeSkillSkillIcon:SetBackdrop(nil)
			end
		end)
		
		local colourExpandOrCollapse = F.colourExpandOrCollapse
		local clearExpandOrCollapse = F.clearExpandOrCollapse
		
		local function styleSkillButton(skillButton)
			skillButton:SetNormalTexture("")
			skillButton.SetNormalTexture = F.dummy
			skillButton:SetPushedTexture("")

			skillButton.bg = CreateFrame("Frame", nil, skillButton)
			skillButton.bg:SetSize(13, 13)
			skillButton.bg:SetPoint("LEFT", 4, 1)
			skillButton.bg:SetFrameLevel(skillButton:GetFrameLevel()-1)
			F.CreateBD(skillButton.bg, 0)

			skillButton.tex = F.CreateGradient(skillButton)
			skillButton.tex:SetPoint("TOPLEFT", skillButton.bg, 1, -1)
			skillButton.tex:SetPoint("BOTTOMRIGHT", skillButton.bg, -1, 1)

			skillButton.minus = skillButton:CreateTexture(nil, "OVERLAY")
			skillButton.minus:SetSize(7, 1)
			skillButton.minus:SetPoint("CENTER", skillButton.bg)
			skillButton.minus:SetTexture(C.media.backdrop)
			skillButton.minus:SetVertexColor(1, 1, 1)

			skillButton.plus = skillButton:CreateTexture(nil, "OVERLAY")
			skillButton.plus:SetSize(1, 7)
			skillButton.plus:SetPoint("CENTER", skillButton.bg)
			skillButton.plus:SetTexture(C.media.backdrop)
			skillButton.plus:SetVertexColor(1, 1, 1)

			skillButton:HookScript("OnEnter", colourExpandOrCollapse)
			skillButton:HookScript("OnLeave", clearExpandOrCollapse)
		end

		styleSkillButton(TradeSkillCollapseAllButton)
		TradeSkillCollapseAllButton:SetDisabledTexture("")
		TradeSkillCollapseAllButton:SetHighlightTexture("")

		hooksecurefunc("TradeSkillFrame_Update", function()
			for i = 1, TRADE_SKILLS_DISPLAYED do

				if TradeSkillCollapseAllButton.collapsed == 1 then
					TradeSkillCollapseAllButton.plus:Show()
				else
					TradeSkillCollapseAllButton.plus:Hide()
				end
			end
		end)
	-- [[ Иконки ]]
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
		
		hooksecurefunc("TradeSkillFrame_SetSelection", function()
			local ic = TradeSkillSkillIcon:GetNormalTexture()
			if ic then
				ic:SetTexCoord(.08, .92, .08, .92)
				ic:SetPoint("TOPLEFT", 1, -1)
				ic:SetPoint("BOTTOMRIGHT", -1, 1)
				F.CreateBD(TradeSkillSkillIcon)
			else
				TradeSkillSkillIcon:SetBackdrop(nil)
			end
		end)
		
		
		F.SetBD(TradeSkillFrame, 10, -12, -31, 74)
		F.ReskinClose(TradeSkillFrameCloseButton, 'TOPRIGHT', TradeSkillFrame, 'TOPRIGHT', -35, -16)
		
		F.StripTextures(TradeSkillRankFrame, true)
		TradeSkillRankFrame:SetStatusBarTexture(C.media.backdrop)
		TradeSkillRankFrame.SetStatusBarColor = F.dummy
		TradeSkillRankFrame:GetStatusBarTexture():SetGradient("VERTICAL", .1, .3, .9, .2, .4, 1)
		
		local bg = CreateFrame("Frame", nil, TradeSkillRankFrame)
		bg:SetPoint("TOPLEFT", -1, 1)
		bg:SetPoint("BOTTOMRIGHT", 1, -1)
		bg:SetFrameLevel(TradeSkillRankFrame:GetFrameLevel()-1)
		F.CreateBD(bg, .25)
		
		F.ReskinArrow(TradeSkillDecrementButton, "left")
		F.ReskinArrow(TradeSkillIncrementButton, "right")
	end
end