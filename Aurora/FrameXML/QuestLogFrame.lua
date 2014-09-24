local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

local Noop = F.dummy;

tinsert(C.Modules['Aurora'], function()
	-- QuestLogControlPanel
	F:Reskin(QuestLogFrameAbandonButton);
	F:Reskin(QuestLogFrameTrackButton);
	QuestLogFramePushQuestButton:SetPoint('LEFT', QuestLogFrameAbandonButton, 'RIGHT', 1, 0);
	QuestLogFramePushQuestButton:SetPoint('RIGHT', QuestLogFrameTrackButton, 'LEFT', -1, 0);
	F:Reskin(QuestLogFramePushQuestButton);
	-- QuestLogDetailFrame
	F:SetBD(QuestLogDetailFrame, 10, -12, 0, 4);
	
	QuestLogDetailFrame:DisableDrawLayer('BACKGROUND');
	QuestLogDetailFrame:DisableDrawLayer('BORDER');
	QuestLogDetailFrame:DisableDrawLayer('ARTWORK');
	
	QuestLogDetailTitleText:SetDrawLayer("OVERLAY")
	
	F:ReskinClose(QuestLogDetailFrameCloseButton, 'TOPRIGHT', QuestLogDetailFrame, 'TOPRIGHT', -4, -16);
	
	QuestLogDetailScrollFrame:DisableDrawLayer('BACKGROUND');
	F:ReskinScroll(QuestLogDetailScrollFrameScrollBar);
	-- QuestLogFrame
	F:SetBD(QuestLogFrame, 13, -12, -2, 9);
	
	QuestLogFrame:DisableDrawLayer('BACKGROUND');
	QuestLogFrame:DisableDrawLayer('BORDER');
	
	F:ReskinClose(QuestLogFrameCloseButton, 'TOPRIGHT', QuestLogFrame, 'TOPRIGHT', -6, -16);
	
	F:Reskin(QuestLogFrameCancelButton);
	
	QuestLogFrameShowMapButton:SetSize(QuestLogFrameShowMapButton.text:GetStringWidth() + 14, 22);
	QuestLogFrameShowMapButton.texture:Hide();
	QuestLogFrameShowMapButton.text:ClearAllPoints();
	QuestLogFrameShowMapButton.text:SetPoint('CENTER');
	QuestLogFrameShowMapButtonHighlight:SetTexture(nil);
	F:Reskin(QuestLogFrameShowMapButton);
	
	EmptyQuestLogFrame:DisableDrawLayer('BACKGROUND');
	
	F:CreateBD(QuestLogCount, .25);
	
	for i = 1, 9 do
		select(i, QuestLogCount:GetRegions()):Hide();
	end
	
	F:ReskinScroll(QuestLogScrollFrameScrollBar);
	
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
				QuestLogTitle:SetNormalTexture(nil);
				QuestLogTitle.SetNormalTexture = Noop;
				QuestLogTitle:SetPushedTexture(nil);
				QuestLogTitle:SetHighlightTexture(nil);
				QuestLogTitle.SetHighlightTexture = Noop;

				QuestLogTitle.BG = CreateFrame('Frame', nil, QuestLogTitle);
				QuestLogTitle.BG:SetSize(13, 13);
				QuestLogTitle.BG:SetPoint('LEFT', 4, 0);
				QuestLogTitle.BG:SetFrameLevel(QuestLogTitle:GetFrameLevel() - 1);
				F:CreateBD(QuestLogTitle.BG, 0);

				QuestLogTitle.Gradient = F:CreateGradient(QuestLogTitle);
				QuestLogTitle.Gradient:SetAllPoints(QuestLogTitle.BG);

				QuestLogTitle.Minus = QuestLogTitle:CreateTexture(nil, 'OVERLAY');
				QuestLogTitle.Minus:SetSize(7, 1);
				QuestLogTitle.Minus:SetPoint('CENTER', QuestLogTitle.BG);
				QuestLogTitle.Minus:SetTexture(C.Media.Backdrop);
				QuestLogTitle.Minus:SetVertexColor(1, 1, 1);

				QuestLogTitle.Plus = QuestLogTitle:CreateTexture(nil, 'OVERLAY');
				QuestLogTitle.Plus:SetSize(1, 7);
				QuestLogTitle.Plus:SetPoint('CENTER', QuestLogTitle.BG);
				QuestLogTitle.Plus:SetTexture(C.Media.Backdrop);
				QuestLogTitle.Plus:SetVertexColor(1, 1, 1);
				
				QuestLogTitle.Skins = true;
			end
			
			if (QuestIndex <= NumEntries) then
				_, _, _, _, isHeader, isCollapsed = GetQuestLogTitle(QuestIndex);
				
				if (isHeader) then
					QuestLogTitle.BG:Show();
					QuestLogTitle.Gradient:Show();
					QuestLogTitle.Minus:Show();
					
					if (isCollapsed) then
						QuestLogTitle.Plus:Show();
					else
						QuestLogTitle.Plus:Hide();
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