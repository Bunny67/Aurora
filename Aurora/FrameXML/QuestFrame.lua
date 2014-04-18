local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;
local find = string.find;
local gsub = string.gsub;

local TexCoords = F.TexCoords;
local Hoop = F.dummy;

tinsert(C.Modules['Aurora'], function()
	F.SetBD(QuestFrame, 14, -18, -30, 67);
	QuestFramePortrait:Hide();
	
	F.ReskinClose(QuestFrameCloseButton, 'TOPRIGHT', QuestFrame, 'TOPRIGHT', -34, -22);
	-- QuestFrameRewardPanel
	QuestFrameRewardPanel:DisableDrawLayer('BACKGROUND');
	QuestFrameRewardPanel:DisableDrawLayer('BORDER');
	
	F.Reskin(QuestFrameCancelButton);
	F.Reskin(QuestFrameCompleteQuestButton);
	
	F.ReskinScroll(QuestRewardScrollFrameScrollBar);
	-- QuestFrameProgressPanel
	QuestFrameProgressPanel:DisableDrawLayer('BACKGROUND');
	QuestFrameProgressPanel:DisableDrawLayer('BORDER');
	
	F.Reskin(QuestFrameGoodbyeButton);
	F.Reskin(QuestFrameCompleteButton);
	
	F.ReskinScroll(QuestProgressScrollFrameScrollBar);
	
	QuestProgressTitleText:SetTextColor(1, 1, 1);
	QuestProgressTitleText.SetTextColor = Hoop;
	QuestProgressText:SetTextColor(1, 1, 1);
	QuestProgressText.SetTextColor = Hoop;
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
		ItemIconTexture:SetTexCoord(unpack(TexCoords));
		ItemIconTexture:SetDrawLayer('OVERLAY');

		ItemNameFrame:Hide();
		
		ItemCount:SetDrawLayer('OVERLAY');
	end
	-- QuestFrameDetailPanel
	QuestFrameDetailPanel:DisableDrawLayer('BACKGROUND');
	QuestFrameDetailPanel:DisableDrawLayer('BORDER');
	
	F.Reskin(QuestFrameDeclineButton);
	F.Reskin(QuestFrameAcceptButton);
	
	F.ReskinScroll(QuestDetailScrollFrameScrollBar);
	-- QuestFrameGreetingPanel
	QuestFrameGreetingPanel:DisableDrawLayer('BACKGROUND');
	QuestFrameGreetingPanel:DisableDrawLayer('BORDER');
	QuestFrameGreetingPanel:DisableDrawLayer('ARTWORK');
	
	F.Reskin(QuestFrameGreetingGoodbyeButton);
	
	F.ReskinScroll(QuestGreetingScrollFrameScrollBar);
	
	GreetingText:SetTextColor(1, 1, 1);
	GreetingText.SetTextColor = Hoop;
	CurrentQuestsText:SetTextColor(1, 1, 1);
	CurrentQuestsText.SetTextColor = Hoop;
	CurrentQuestsText:SetShadowColor(0, 0, 0);
	
	QuestGreetingFrameHorizontalBreak:Hide();
	QuestGreetingFrameHorizontalBreak.Show = Hoop;
	
	AvailableQuestsText:SetTextColor(1, 1, 1);
	AvailableQuestsText.SetTextColor = Hoop;
	AvailableQuestsText:SetShadowColor(0, 0, 0);
	
	QuestFrameGreetingPanel:HookScript('OnShow', function()
		for i=1, MAX_NUM_QUESTS do
			local Button = _G['QuestTitleButton'..i];
			
			if Button:GetFontString() then
				if Button:GetFontString():GetText() and Button:GetFontString():GetText():find('|cff000000') then
					Button:GetFontString():SetText(gsub(Button:GetFontString():GetText(), '|cff000000', '|cffFFFF00'));
				end
			end
		end
	end);
end);