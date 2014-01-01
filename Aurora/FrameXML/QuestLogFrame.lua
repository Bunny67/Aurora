local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	-- QuestLogControlPanel
	F.Reskin(QuestLogFrameAbandonButton);
	F.Reskin(QuestLogFrameTrackButton);
	F.Reskin(QuestLogFramePushQuestButton);
	-- QuestLogDetailFrame
	F.StripTextures(QuestLogDetailFrame);
	F.SetBD(QuestLogDetailFrame, 10, -12, 0, 4);
	
	F.ReskinClose(QuestLogDetailFrameCloseButton, 'TOPRIGHT', QuestLogDetailFrame, 'TOPRIGHT', -4, -16);
	
	F.StripTextures(QuestLogDetailScrollFrame);
	F.ReskinScroll(QuestLogDetailScrollFrameScrollBar);
	-- QuestLogFrame
	F.StripTextures(QuestLogFrame);
	F.SetBD(QuestLogFrame, 13, -12, -2, 9);
	
	F.ReskinClose(QuestLogFrameCloseButton, 'TOPRIGHT', QuestLogFrame, 'TOPRIGHT', -6, -16);
	
	F.Reskin(QuestLogFrameCancelButton);
	
	F.StripTextures(QuestLogFrameShowMapButton);
	QuestLogFrameShowMapButton:SetSize(QuestLogFrameShowMapButton.text:GetStringWidth() + 14, 22);
	QuestLogFrameShowMapButton.text:ClearAllPoints();
	QuestLogFrameShowMapButton.text:SetPoint('CENTER');
	F.Reskin(QuestLogFrameShowMapButton);
	
	F.StripTextures(QuestLogCount);
	F.CreateBD(QuestLogCount, .25);
	
	F.ReskinScroll(QuestLogScrollFrameScrollBar);
	
	local function UpdateQuest()
		local NumEntries = GetNumQuestLogEntries();

		local Buttons = QuestLogScrollFrame.buttons;
		local NumButtons = #Buttons;
		local ScrollOffset = HybridScrollFrame_GetOffset(QuestLogScrollFrame);
		local QuestLogTitle, QuestIndex;
		local isHeader, isCollapsed;

		for i = 1, NumButtons do
			QuestLogTitle = Buttons[i];
			QuestIndex = i + ScrollOffset;
			
			if not QuestLogTitle.Skins then
				QuestLogTitle.Skins = true

				QuestLogTitle:SetNormalTexture('');
				QuestLogTitle.SetNormalTexture = F.dummy;
				QuestLogTitle:SetPushedTexture('');
				QuestLogTitle:SetHighlightTexture('');
				QuestLogTitle.SetHighlightTexture = F.dummy;

				QuestLogTitle.BG = CreateFrame('Frame', nil, QuestLogTitle);
				QuestLogTitle.BG:SetSize(13, 13);
				QuestLogTitle.BG:SetPoint('LEFT', 4, 0);
				QuestLogTitle.BG:SetFrameLevel(QuestLogTitle:GetFrameLevel() - 1);
				F.CreateBD(QuestLogTitle.BG, 0);

				QuestLogTitle.Gradient = F.CreateGradient(QuestLogTitle);
				QuestLogTitle.Gradient:SetAllPoints(QuestLogTitle.BG);

				QuestLogTitle.Minus = QuestLogTitle:CreateTexture(nil, 'OVERLAY');
				QuestLogTitle.Minus:SetSize(7, 1);
				QuestLogTitle.Minus:SetPoint('CENTER', QuestLogTitle.BG);
				QuestLogTitle.Minus:SetTexture(C.media.backdrop);
				QuestLogTitle.Minus:SetVertexColor(1, 1, 1);

				QuestLogTitle.Plus = QuestLogTitle:CreateTexture(nil, 'OVERLAY');
				QuestLogTitle.Plus:SetSize(1, 7);
				QuestLogTitle.Plus:SetPoint('CENTER', QuestLogTitle.BG);
				QuestLogTitle.Plus:SetTexture(C.media.backdrop);
				QuestLogTitle.Plus:SetVertexColor(1, 1, 1);
			end
			
			if ( QuestIndex <= NumEntries ) then
				_, _, _, _, isHeader, isCollapsed = GetQuestLogTitle(QuestIndex);
				
				if ( isHeader ) then
					QuestLogTitle.BG:Show();
					QuestLogTitle.Gradient:Hide();
					QuestLogTitle.Minus:Show()
					if isCollapsed then
						QuestLogTitle.Plus:Show()
					else
						QuestLogTitle.Plus:Hide()
					end
				else
					QuestLogTitle.BG:Hide();
					QuestLogTitle.Gradient:Hide();
					QuestLogTitle.Minus:Hide();
					QuestLogTitle.Plus:Hide();
				end
			end
		end
	end
	
	hooksecurefunc('QuestLog_Update', UpdateQuest)
	QuestLogScrollFrame:HookScript('OnVerticalScroll', UpdateQuest);
	QuestLogScrollFrame:HookScript('OnMouseWheel', UpdateQuest);
end);