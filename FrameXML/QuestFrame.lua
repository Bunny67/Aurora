local F, C = unpack(select(2, ...))

tinsert(C.modules['Aurora'], function()
	local AllQuestFrameStripTextures = {'QuestFrame', 'QuestFrameDetailPanel', 'QuestLogDetailFrame', 'QuestLogDetailScrollFrame', 'QuestLogFrame', 'QuestLogCount', 'QuestFrameRewardPanel'}
	for i = 1, #AllQuestFrameStripTextures do
		F.StripTextures(_G[AllQuestFrameStripTextures[i]], true)
	end

	local AllQuestFrameScrollbars = {'QuestDetailScrollFrameScrollBar', 'QuestLogDetailScrollFrameScrollBar', 'QuestLogScrollFrameScrollBar', 'QuestRewardScrollFrameScrollBar'}
	for i = 1, #AllQuestFrameScrollbars do
		F.ReskinScroll(_G[AllQuestFrameScrollbars[i]])
	end

	local AllQuestFrameButtons = {'QuestFrameAcceptButton', 'QuestFrameDeclineButton', 'QuestFrameCompleteButton', 'QuestFrameGoodbyeButton', 'QuestFrameCompleteQuestButton', 'QuestFrameCancelButton', 'QuestLogFrameAbandonButton', 'QuestLogFramePushQuestButton', 'QuestLogFrameTrackButton', 'QuestLogFrameCancelButton'}
	for i = 1, #AllQuestFrameButtons do
		F.Reskin(_G[AllQuestFrameButtons[i]])
	end
	
	F.StripTextures(QuestLogFrameShowMapButton)
	QuestLogFrameShowMapButton:SetSize(QuestLogFrameShowMapButton.text:GetStringWidth() + 14, 22)
	QuestLogFrameShowMapButton.text:ClearAllPoints()
	QuestLogFrameShowMapButton.text:SetPoint('CENTER')
	F.Reskin(QuestLogFrameShowMapButton)

	local function QuestObjectiveText()
		local numObjectives = GetNumQuestLeaderBoards()
		local objective
		local type, finished
		local numVisibleObjectives = 0
		for i = 1, numObjectives do
			_, type, finished = GetQuestLogLeaderBoard(i)
			if (type ~= 'spell') then
				numVisibleObjectives = numVisibleObjectives+1
				objective = _G['QuestInfoObjective'..numVisibleObjectives]
				if ( finished ) then
					objective:SetTextColor(1, 1, 0)
				else
					objective:SetTextColor(0.6, 0.6, 0.6)
				end
			end
		end			
	end

	hooksecurefunc('QuestInfo_Display', function(template, parentFrame, acceptButton, material)								
		local textColor = {1, 1, 1}
		local titleTextColor = {1, 1, 0}
		
		QuestInfoTitleHeader:SetTextColor(unpack(titleTextColor))
		QuestInfoDescriptionHeader:SetTextColor(unpack(titleTextColor))
		QuestInfoObjectivesHeader:SetTextColor(unpack(titleTextColor))
		QuestInfoRewardsHeader:SetTextColor(unpack(titleTextColor))
		QuestInfoDescriptionText:SetTextColor(unpack(textColor))
		QuestInfoObjectivesText:SetTextColor(unpack(textColor))
		QuestInfoGroupSize:SetTextColor(unpack(textColor))
		QuestInfoRewardText:SetTextColor(unpack(textColor))
		QuestInfoItemChooseText:SetTextColor(unpack(textColor))
		QuestInfoItemReceiveText:SetTextColor(unpack(textColor))
		QuestInfoSpellLearnText:SetTextColor(unpack(textColor))
		QuestInfoHonorFrameReceiveText:SetTextColor(unpack(textColor))
		QuestInfoArenaPointsFrameReceiveText:SetTextColor(unpack(textColor))
		QuestInfoTalentFrameReceiveText:SetTextColor(unpack(textColor))
		QuestInfoXPFrameReceiveText:SetTextColor(unpack(textColor))
		QuestInfoReputationText:SetTextColor(unpack(textColor))

		QuestInfoTimerText:SetTextColor(unpack(textColor))
		QuestInfoAnchor:SetTextColor(unpack(textColor))
		QuestObjectiveText()
	end)
	
	hooksecurefunc('QuestInfo_ShowRequiredMoney', function()
		local requiredMoney = GetQuestLogRequiredMoney()
		if ( requiredMoney > 0 ) then
			if ( requiredMoney > GetMoney() ) then
				QuestInfoRequiredMoneyText:SetTextColor(0.6, 0.6, 0.6)
			else
				QuestInfoRequiredMoneyText:SetTextColor(1, 1, 0)
			end
		end			
	end)

	for i = 1, MAX_REQUIRED_ITEMS do
		local bu = _G['QuestProgressItem'..i]
		local ic = _G['QuestProgressItem'..i..'IconTexture']
		local na = _G['QuestProgressItem'..i..'NameFrame']
		local co = _G['QuestProgressItem'..i..'Count']

		ic:SetSize(40, 40)
		ic:SetTexCoord(.08, .92, .08, .92)
		ic:SetDrawLayer('OVERLAY')

		F.CreateBD(bu, .25)
		F.StyleButton(bu)
		na:Hide()
		co:SetDrawLayer('OVERLAY')

		local line = CreateFrame('Frame', nil, bu)
		line:SetSize(1, 40)
		line:SetPoint('RIGHT', ic, 1, 0)
		F.CreateBD(line)
	end

	for i = 1, MAX_NUM_ITEMS do
		local bu = _G['QuestInfoItem'..i]
		local ic = _G['QuestInfoItem'..i..'IconTexture']
		local na = _G['QuestInfoItem'..i..'NameFrame']
		local co = _G['QuestInfoItem'..i..'Count']

		ic:SetPoint('TOPLEFT', 1, -1)
		ic:SetSize(39, 39)
		ic:SetTexCoord(.08, .92, .08, .92)
		ic:SetDrawLayer('OVERLAY')
		F.StyleButton(bu)
		F.CreateBD(bu, .25)

		na:Hide()
		co:SetDrawLayer('OVERLAY')

		local line = CreateFrame('Frame', nil, bu)
		line:SetSize(1, 40)
		line:SetPoint('RIGHT', ic, 1, 0)
		F.CreateBD(line)
	end
	
	local function updateQuest()
		local numEntries = GetNumQuestLogEntries()

		local buttons = QuestLogScrollFrame.buttons
		local numButtons = #buttons
		local scrollOffset = HybridScrollFrame_GetOffset(QuestLogScrollFrame)
		local questLogTitle, questIndex
		local isHeader, isCollapsed

		for i = 1, numButtons do
			questLogTitle = buttons[i]
			questIndex = i + scrollOffset

			if not questLogTitle.reskinned then
				questLogTitle.reskinned = true

				questLogTitle:SetNormalTexture('')
				questLogTitle.SetNormalTexture = F.dummy
				questLogTitle:SetPushedTexture('')
				questLogTitle:SetHighlightTexture('')
				questLogTitle.SetHighlightTexture = F.dummy

				questLogTitle.bg = CreateFrame('Frame', nil, questLogTitle)
				questLogTitle.bg:SetSize(13, 13)
				questLogTitle.bg:SetPoint('LEFT', 4, 0)
				questLogTitle.bg:SetFrameLevel(questLogTitle:GetFrameLevel()-1)
				F.CreateBD(questLogTitle.bg, 0)

				questLogTitle.tex = F.CreateGradient(questLogTitle)
				questLogTitle.tex:SetAllPoints(questLogTitle.bg)

				questLogTitle.minus = questLogTitle:CreateTexture(nil, 'OVERLAY')
				questLogTitle.minus:SetSize(7, 1)
				questLogTitle.minus:SetPoint('CENTER', questLogTitle.bg)
				questLogTitle.minus:SetTexture(C.media.backdrop)
				questLogTitle.minus:SetVertexColor(1, 1, 1)

				questLogTitle.plus = questLogTitle:CreateTexture(nil, 'OVERLAY')
				questLogTitle.plus:SetSize(1, 7)
				questLogTitle.plus:SetPoint('CENTER', questLogTitle.bg)
				questLogTitle.plus:SetTexture(C.media.backdrop)
				questLogTitle.plus:SetVertexColor(1, 1, 1)
			end

			if questIndex <= numEntries then
				_, _, _, _, isHeader, isCollapsed = GetQuestLogTitle(questIndex)
				if isHeader then
					questLogTitle.bg:Show()
					questLogTitle.tex:Show()
					questLogTitle.minus:Show()
					if isCollapsed then
						questLogTitle.plus:Show()
					else
						questLogTitle.plus:Hide()
					end
				else
					questLogTitle.bg:Hide()
					questLogTitle.tex:Hide()
					questLogTitle.minus:Hide()
					questLogTitle.plus:Hide()
				end
			end
		end
	end

	hooksecurefunc('QuestLog_Update', updateQuest)
	QuestLogScrollFrame:HookScript('OnVerticalScroll', updateQuest)
	QuestLogScrollFrame:HookScript('OnMouseWheel', updateQuest)
	
	F.SetBD(QuestFrame, 10, -12, -31, 67)
	F.ReskinClose(QuestFrameCloseButton, 'TOPRIGHT', QuestFrame, 'TOPRIGHT', -35, -16)
	
	F.SetBD(QuestLogDetailFrame, 10, -12, 0, 4)
	F.ReskinClose(QuestLogDetailFrameCloseButton, 'TOPRIGHT', QuestLogDetailFrame, 'TOPRIGHT', -4, -16)
	
	F.SetBD(QuestLogFrame, 10, -12, 0, 8)
	F.ReskinClose(QuestLogFrameCloseButton, 'TOPRIGHT', QuestLogFrame, 'TOPRIGHT', -4, -16)
end)