local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.StripTextures(QuestFrame, true);
	F.SetBD(QuestFrame, 14, -18, -30, 67);
	
	F.ReskinClose(QuestFrameCloseButton, 'TOPRIGHT', QuestFrame, 'TOPRIGHT', -34, -22);
	-- QuestFrameRewardPanel
	F.StripTextures(QuestFrameRewardPanel);
	
	F.Reskin(QuestFrameCancelButton);
	F.Reskin(QuestFrameCompleteQuestButton);
	
	F.ReskinScroll(QuestRewardScrollFrameScrollBar);
	-- QuestFrameProgressPanel
	F.StripTextures(QuestFrameProgressPanel);
	
	F.Reskin(QuestFrameGoodbyeButton);
	F.Reskin(QuestFrameCompleteButton);
	
	F.ReskinScroll(QuestProgressScrollFrameScrollBar);
	
	QuestProgressTitleText:SetTextColor(1, 1, 1);
	QuestProgressTitleText.SetTextColor = F.dummy;
	QuestProgressText:SetTextColor(1, 1, 1);
	QuestProgressText.SetTextColor = F.dummy;
	QuestProgressRequiredItemsText:SetTextColor(1, 1, 1);
	QuestProgressRequiredItemsText:SetShadowColor(0, 0, 0);
	
	for i = 1, MAX_REQUIRED_ITEMS do
		local Item = _G['QuestProgressItem'..i]
		local ItemIconTexture = _G['QuestProgressItem'..i..'IconTexture'];
		local ItemNameFrame = _G['QuestProgressItem'..i..'NameFrame'];
		local ItemCount = _G['QuestProgressItem'..i..'Count'];
		
		F.StyleButton(Item);
		F.CreateBD(Item, .25);
		
		ItemIconTexture:SetPoint('TOPLEFT', 1, -1);
		ItemIconTexture:SetTexCoord(unpack(F.TexCoords));
		ItemIconTexture:SetDrawLayer('OVERLAY');

		ItemNameFrame:Hide();
		
		ItemCount:SetDrawLayer('OVERLAY');
	end
	-- QuestFrameDetailPanel
	F.StripTextures(QuestFrameDetailPanel);
	
	F.Reskin(QuestFrameDeclineButton);
	F.Reskin(QuestFrameAcceptButton);
	
	F.ReskinScroll(QuestDetailScrollFrameScrollBar);
	-- QuestFrameGreetingPanel
	F.StripTextures(QuestFrameGreetingPanel);
	
	F.Reskin(QuestFrameGreetingGoodbyeButton);
	
	F.ReskinScroll(QuestGreetingScrollFrameScrollBar);
	
	GreetingText:SetTextColor(1, 1, 1);
	GreetingText.SetTextColor = F.dummy;
	CurrentQuestsText:SetTextColor(1, 1, 1);
	CurrentQuestsText.SetTextColor = F.dummy;
	CurrentQuestsText:SetShadowColor(0, 0, 0);
	
	F.Kill(QuestGreetingFrameHorizontalBreak);
	
	AvailableQuestsText:SetTextColor(1, 1, 1);
	AvailableQuestsText.SetTextColor = F.dummy;
	AvailableQuestsText:SetShadowColor(0, 0, 0);
	
	QuestFrameGreetingPanel:HookScript('OnShow', function()
		for i=1, MAX_NUM_QUESTS do
			local Button = _G['QuestTitleButton'..i];
			
			if Button:GetFontString() then
				if Button:GetFontString():GetText() and Button:GetFontString():GetText():find('|cff000000') then
					Button:GetFontString():SetText(string.gsub(Button:GetFontString():GetText(), '|cff000000', '|cffFFFF00'));
				end
			end
		end
	end);
end);