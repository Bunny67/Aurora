local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;
local find = string.find;
local gsub = string.gsub;
local tinsert = table.insert;

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
	
	do
		local Item, ItemIcon, ItemName, ItemCount;
		
		for i = 1, MAX_REQUIRED_ITEMS do
			Item = _G['QuestProgressItem'..i]
			ItemIcon = _G['QuestProgressItem'..i..'IconTexture'];
			ItemName = _G['QuestProgressItem'..i..'NameFrame'];
			ItemCount = _G['QuestProgressItem'..i..'Count'];
			
			F.StyleButton(Item);
			F.CreateBD(Item, .25);
			
			ItemIcon:SetPoint('TOPLEFT', 1, -1);
			ItemIcon:SetTexCoord(unpack(TexCoords));
			ItemIcon:SetDrawLayer('OVERLAY');

			ItemName:Hide();
			
			ItemCount:SetDrawLayer('OVERLAY');
		end
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
		local Button;
		
		for i = 1, MAX_NUM_QUESTS do
			Button = _G['QuestTitleButton'..i];
			
			if Button:GetFontString() then
				if Button:GetFontString():GetText() and Button:GetFontString():GetText():find('|cff000000') then
					Button:GetFontString():SetText(gsub(Button:GetFontString():GetText(), '|cff000000', '|cffFFFF00'));
				end
			end
		end
	end);
end);