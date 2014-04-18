local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;
local pairs = pairs;
local select = select;
local band = bit.band;

local TexCoords = F.TexCoords;
local Noop = F.dummy;

C.Modules['Blizzard_AchievementUI'] = function()
	-- AchievementFrame
	F.SetBD(AchievementFrame);
	
	AchievementFrame:DisableDrawLayer('BACKGROUND');
	AchievementFrame:DisableDrawLayer('ARTWORK');
	AchievementFrame:DisableDrawLayer('OVERLAY');
	
	AchievementFrameHeader:DisableDrawLayer('BACKGROUND');
	AchievementFrameHeader:DisableDrawLayer('BORDER');
	
	AchievementFrameHeaderTitle:ClearAllPoints();
	AchievementFrameHeaderTitle:SetPoint('TOPLEFT', AchievementFrame, 'TOPLEFT', -30, -8);
	AchievementFrameHeaderPoints:ClearAllPoints();
	AchievementFrameHeaderPoints:SetPoint('LEFT', AchievementFrameHeaderTitle, 'RIGHT', 2, 0);
	-- AchievementFrameCategories;
	AchievementFrameCategories:SetBackdrop(nil);
	
	F.ReskinScroll(AchievementFrameCategoriesContainerScrollBar);
	AchievementFrameCategoriesContainerScrollBarBG:SetTexture(nil);
	-- AchievementFrameAchievements;
	select(2, AchievementFrameAchievements:GetChildren()):Hide();
	select(3, AchievementFrameAchievements:GetRegions()):Hide();
	AchievementFrameAchievementsBackground:Hide();
	
	for i = 1, 7 do
		local Button = _G['AchievementFrameAchievementsContainerButton'..i];
		local ButtonIcon = _G['AchievementFrameAchievementsContainerButton'..i..'Icon'];
		local ButtonIconTexture = _G['AchievementFrameAchievementsContainerButton'..i..'IconTexture'];
		local ButtonIconOverlay = _G['AchievementFrameAchievementsContainerButton'..i..'IconOverlay'];
		local ButtonTracked = _G['AchievementFrameAchievementsContainerButton'..i..'Tracked'];
		
		local BG = CreateFrame('Frame', nil, Button);
		BG:SetPoint('TOPLEFT', 2, -2);
		BG:SetPoint('BOTTOMRIGHT', -2, 2);
		F.CreateBD(BG, 0);
		
		_G['AchievementFrameAchievementsContainerButton'..i..'Background']:SetTexture(C.Media.Backdrop);
		_G['AchievementFrameAchievementsContainerButton'..i..'Background']:SetVertexColor(0, 0, 0, .25);
		
		Button:DisableDrawLayer('BORDER');
		Button:DisableDrawLayer('ARTWORK');
		
		_G['AchievementFrameAchievementsContainerButton'..i..'Description']:SetTextColor(.9, .9, .9);
		_G['AchievementFrameAchievementsContainerButton'..i..'Description'].SetTextColor = Noop;
		_G['AchievementFrameAchievementsContainerButton'..i..'Description']:SetShadowOffset(1, -1);
		_G['AchievementFrameAchievementsContainerButton'..i..'Description'].SetShadowOffset = Noop;
		
		_G['AchievementFrameAchievementsContainerButton'..i..'PlusMinus']:SetAlpha(0);
		_G['AchievementFrameAchievementsContainerButton'..i..'Highlight']:SetAlpha(0);
		
		
		F.CreateBG(ButtonIconTexture);
		ButtonIconTexture:SetTexCoord(unpack(TexCoords));
		
		ButtonIconOverlay:Hide();
		ButtonIconOverlay.Show = Noop;
		
		ButtonTracked:SetNormalTexture('');
		ButtonTracked:SetPushedTexture('');
		
		F.CreateBD(ButtonTracked);
		
		ButtonTracked:SetHighlightTexture(C.Media.Backdrop);
		ButtonTracked:GetHighlightTexture():SetPoint('TOPLEFT', 1, -1);
		ButtonTracked:GetHighlightTexture():SetPoint('BOTTOMRIGHT', -1, 1);
		ButtonTracked:GetHighlightTexture():SetVertexColor(C.r, C.g, C.b, .2);
	end
	
	F.ReskinScroll(AchievementFrameAchievementsContainerScrollBar);
	-- AchievementFrameStats;
	select(3, AchievementFrameStats:GetChildren()):Hide();
	AchievementFrameStatsBG:Hide();
	
	for i = 1, 20 do
		local Button = _G['AchievementFrameStatsContainerButton'..i];
		
		F.StyleButton(Button);
		
		Button.background:SetTexture(nil);
		Button.left:SetAlpha(0);
		Button.middle:SetAlpha(0);
		Button.right:SetAlpha(0);
	end
	
	F.ReskinScroll(AchievementFrameStatsContainerScrollBar);
	-- AchievementFrameSummary;
	AchievementFrameSummary:SetBackdrop(nil);
	AchievementFrameSummary:GetChildren():Hide();
	AchievementFrameSummaryBackground:Hide();
	
	AchievementFrameSummaryAchievementsHeaderHeader:Hide();
	
	AchievementFrameSummaryCategoriesHeaderTexture:Hide();
	
	AchievementFrameSummaryCategoriesStatusBar:SetStatusBarTexture(C.Media.Backdrop);
	AchievementFrameSummaryCategoriesStatusBar:GetStatusBarTexture():SetGradient('VERTICAL', 0, .4, 0, 0, .6, 0);
	AchievementFrameSummaryCategoriesStatusBarTitle:SetTextColor(1, 1, 1);
	AchievementFrameSummaryCategoriesStatusBarTitle:SetPoint('LEFT', AchievementFrameSummaryCategoriesStatusBar, 'LEFT', 6, 0);
	AchievementFrameSummaryCategoriesStatusBarText:SetPoint('RIGHT', AchievementFrameSummaryCategoriesStatusBar, 'RIGHT', -5, 0);
	AchievementFrameSummaryCategoriesStatusBarLeft:Hide();
	AchievementFrameSummaryCategoriesStatusBarMiddle:Hide();
	AchievementFrameSummaryCategoriesStatusBarRight:Hide();
	AchievementFrameSummaryCategoriesStatusBarFillBar:Hide();
	
	AchievementFrameSummaryCategoriesStatusBar.BG = CreateFrame('Frame', nil, AchievementFrameSummaryCategoriesStatusBar);
	AchievementFrameSummaryCategoriesStatusBar.BG:SetPoint('TOPLEFT', -1, 1);
	AchievementFrameSummaryCategoriesStatusBar.BG:SetPoint('BOTTOMRIGHT', 1, -1);
	AchievementFrameSummaryCategoriesStatusBar.BG:SetFrameLevel(AchievementFrameSummaryCategoriesStatusBar:GetFrameLevel() - 1);
	F.CreateBD(AchievementFrameSummaryCategoriesStatusBar.BG, .25);
	
	for i = 1, 8 do
		local Category = _G['AchievementFrameSummaryCategoriesCategory'..i];
		local CategoryLabel = _G['AchievementFrameSummaryCategoriesCategory'..i..'Label'];
		
		Category:SetStatusBarTexture(C.Media.Backdrop);
		Category:GetStatusBarTexture():SetGradient('VERTICAL', 0, .4, 0, 0, .6, 0);
		
		Category.BG = CreateFrame('Frame', nil, Category);
		Category.BG:SetPoint('TOPLEFT', -1, 1);
		Category.BG:SetPoint('BOTTOMRIGHT', 1, -1);
		Category.BG:SetFrameLevel(Category:GetFrameLevel() - 1);
		F.CreateBD(Category.BG, .25);
		
		CategoryLabel:SetTextColor(1, 1, 1);
		CategoryLabel:SetPoint('LEFT', Category, 'LEFT', 6, 0);
		
		_G['AchievementFrameSummaryCategoriesCategory'..i..'Text']:SetPoint('RIGHT', Category, 'RIGHT', -5, 0);
		_G['AchievementFrameSummaryCategoriesCategory'..i..'Left']:Hide();
		_G['AchievementFrameSummaryCategoriesCategory'..i..'Middle']:Hide();
		_G['AchievementFrameSummaryCategoriesCategory'..i..'Right']:Hide();
		_G['AchievementFrameSummaryCategoriesCategory'..i..'FillBar']:Hide();
		_G['AchievementFrameSummaryCategoriesCategory'..i..'ButtonHighlight']:SetAlpha(0);
	end
	-- AchievementFrameComparison;
	select(5, AchievementFrameComparison:GetChildren()):Hide();
	AchievementFrameComparisonHeaderBG:Hide();
	AchievementFrameComparisonHeaderPortrait:Hide();
	
	local ComparisonSummary = { AchievementFrameComparisonSummaryPlayer, AchievementFrameComparisonSummaryFriend };

	for _, Frame in pairs(ComparisonSummary) do
		local Background = _G[Frame:GetName()..'Background'];
		local StatusBar = _G[Frame:GetName()..'StatusBar'];
		
		Frame:SetBackdrop(nil);
		
		Frame.BG = CreateFrame('Frame', nil, Frame);
		Frame.BG:SetPoint('TOPLEFT', 2, -2);
		Frame.BG:SetPoint('BOTTOMRIGHT', -2, 0);
		Frame.BG:SetFrameLevel(Frame:GetFrameLevel() - 1);
		F.CreateBD(Frame.BG, .25);
		
		Background:Hide();
		
		StatusBar:SetStatusBarTexture(C.Media.Backdrop);
		StatusBar:GetStatusBarTexture():SetGradient('VERTICAL', 0, .4, 0, 0, .6, 0);
		
		StatusBar.BG = CreateFrame('Frame', nil, StatusBar);
		StatusBar.BG:SetPoint('TOPLEFT', -1, 1);
		StatusBar.BG:SetPoint('BOTTOMRIGHT', 1, -1);
		StatusBar.BG:SetFrameLevel(StatusBar:GetFrameLevel() - 1);
		F.CreateBD(StatusBar.BG, .25);
		
		_G[StatusBar:GetName()..'Title']:SetTextColor(1, 1, 1);
		_G[StatusBar:GetName()..'Title']:SetPoint('LEFT', StatusBar, 'LEFT', 6, 0);
		_G[StatusBar:GetName()..'Text']:SetPoint('RIGHT', StatusBar, 'RIGHT', -5, 0);
		_G[StatusBar:GetName()..'Left']:Hide();
		_G[StatusBar:GetName()..'Right']:Hide();
		_G[StatusBar:GetName()..'Middle']:Hide();
		_G[StatusBar:GetName()..'FillBar']:Hide();
	end
	
	for i = 1, 9 do
		local Buttons = { _G['AchievementFrameComparisonContainerButton'..i..'Player'], _G['AchievementFrameComparisonContainerButton'..i..'Friend'] };

		for _, Button in pairs(Buttons) do
			Button:DisableDrawLayer('BORDER');
			
			Button.BG = CreateFrame('Frame', nil, Button);
			Button.BG:SetPoint('TOPLEFT', 2, -3);
			Button.BG:SetPoint('BOTTOMRIGHT', -2, 3);
			F.CreateBD(Button.BG, 0);
		end
		
		_G['AchievementFrameComparisonContainerButton'..i..'PlayerBackground']:SetTexture(C.Media.Backdrop);
		_G['AchievementFrameComparisonContainerButton'..i..'PlayerBackground']:SetVertexColor(0, 0, 0, .25);
		
		_G['AchievementFrameComparisonContainerButton'..i..'FriendBackground']:SetTexture(C.Media.Backdrop);
		_G['AchievementFrameComparisonContainerButton'..i..'FriendBackground']:SetVertexColor(0, 0, 0, .25);

		local PlayerDescription = _G['AchievementFrameComparisonContainerButton'..i..'PlayerDescription'];
		PlayerDescription:SetTextColor(.9, .9, .9);
		PlayerDescription.SetTextColor = Noop;
		PlayerDescription:SetShadowOffset(1, -1);
		PlayerDescription.SetShadowOffset = Noop;

		_G['AchievementFrameComparisonContainerButton'..i..'PlayerTitleBackground']:Hide();
		_G['AchievementFrameComparisonContainerButton'..i..'PlayerGlow']:Hide();
		_G['AchievementFrameComparisonContainerButton'..i..'PlayerIconOverlay']:Hide();
		_G['AchievementFrameComparisonContainerButton'..i..'FriendTitleBackground']:Hide();
		_G['AchievementFrameComparisonContainerButton'..i..'FriendGlow']:Hide();
		_G['AchievementFrameComparisonContainerButton'..i..'FriendIconOverlay']:Hide();

		local PlayerIconTexture = _G['AchievementFrameComparisonContainerButton'..i..'PlayerIconTexture'];
		PlayerIconTexture:SetPoint('TOPLEFT', 3, -4);
		PlayerIconTexture:SetTexCoord(unpack(TexCoords));
		F.CreateBG(PlayerIconTexture);

		local FriendIconTexture = _G['AchievementFrameComparisonContainerButton'..i..'FriendIconTexture'];
		FriendIconTexture:SetPoint('TOPLEFT', 3, -4);
		FriendIconTexture:SetTexCoord(unpack(TexCoords));
		F.CreateBG(FriendIconTexture);
	end
	
	F.ReskinScroll(AchievementFrameComparisonContainerScrollBar);
	
	for i = 1, 20 do
		local Button = _G['AchievementFrameComparisonStatsContainerButton'..i];
		
		F.StyleButton(Button);
		
		_G['AchievementFrameComparisonStatsContainerButton'..i..'BG']:SetTexture(nil);
		_G['AchievementFrameComparisonStatsContainerButton'..i..'HeaderLeft']:SetAlpha(0);
		_G['AchievementFrameComparisonStatsContainerButton'..i..'HeaderRight']:SetAlpha(0);
		_G['AchievementFrameComparisonStatsContainerButton'..i..'HeaderMiddle']:SetAlpha(0);
	end
	
	F.ReskinScroll(AchievementFrameComparisonStatsContainerScrollBar);
	
	AchievementFrameComparisonBackground:Hide();
	AchievementFrameComparisonDark:SetAlpha(0);
	AchievementFrameComparisonWatermark:SetAlpha(0);
	
	F.ReskinClose(AchievementFrameCloseButton);
	
	for i = 1, 2 do
		local Tab = _G['AchievementFrameTab'..i];
		
		F.ReskinTab(Tab);
	end
	
	F.ReskinDropDown(AchievementFrameFilterDropDown);
	AchievementFrameFilterDropDown:SetPoint('TOPRIGHT', AchievementFrame, 'TOPRIGHT', -98, 1);
	AchievementFrameFilterDropDownText:ClearAllPoints();
	AchievementFrameFilterDropDownText:SetPoint('CENTER', -10, 1);
	-- AchievementFrameCategories;
	hooksecurefunc('AchievementFrameCategories_DisplayButton', function(button, element)
		if ( not button.bg ) then
			F.StyleButton(button);
			
			button.background:SetTexture(0, 0, 0, .25);
			button.background:SetPoint('TOPLEFT', 0, -1);
			button.background:SetPoint('BOTTOMRIGHT');

			button.bg = F.CreateBDFrame(button, 0);
			button.bg:SetPoint('TOPLEFT', 0, -1);
			button.bg:SetPoint('BOTTOMRIGHT');
		end
	end);
	-- AchievementFrameSummary;
	hooksecurefunc('AchievementFrameSummary_UpdateAchievements', function()
		local Button, ButtonBackground;
		
		for i = 1, ACHIEVEMENTUI_MAX_SUMMARY_ACHIEVEMENTS do
			Button = _G['AchievementFrameSummaryAchievement'..i];
			ButtonBackground = _G['AchievementFrameSummaryAchievement'..i..'Background'];
			
			if ( not Button.BG ) then
				Button:DisableDrawLayer('BORDER');
				
				local BG = CreateFrame('Frame', nil, Button);
				BG:SetPoint('TOPLEFT', 2, -2);
				BG:SetPoint('BOTTOMRIGHT', -2, 2);
				F.CreateBD(BG, 0);
				
				Button.BG = BG;
				
				_G['AchievementFrameSummaryAchievement'..i..'Highlight']:SetAlpha(0);
				
				Button.label:SetTextColor(.9, .9, .9);
				
				ButtonBackground:SetTexture(C.Media.Backdrop);
				ButtonBackground:SetVertexColor(0, 0, 0, .25);

				_G['AchievementFrameSummaryAchievement'..i..'TitleBackground']:Hide();
				_G['AchievementFrameSummaryAchievement'..i..'Glow']:Hide();
				_G['AchievementFrameSummaryAchievement'..i..'IconOverlay']:Hide();
				
				Button.description:SetTextColor(.9, .9, .9);
				Button.description.SetTextColor = Noop;
				Button.description:SetShadowOffset(1, -1);
				Button.description.SetShadowOffset = Noop;
				
				Button.icon.texture:SetTexCoord(unpack(TexCoords));
				F.CreateBG(Button.icon.texture);
			end
		end
	end);
	
	hooksecurefunc('AchievementButton_GetMiniAchievement', function(index)
		local Frame = _G['AchievementFrameMiniAchievement'..index];
		local FrameIcon = _G['AchievementFrameMiniAchievement'..index..'Icon'];
		
		FrameIcon:SetTexCoord(unpack(TexCoords));
		F.CreateBG(FrameIcon);
		FrameIcon:SetDrawLayer('BORDER');
		
		_G['AchievementFrameMiniAchievement'..index..'Border']:Hide();
	end);
	
	hooksecurefunc('AchievementObjectives_DisplayCriteria', function(objectivesFrame, id)
		if ( not id ) then
			return;
		end

		local ACHIEVEMENTMODE_CRITERIA = 1;
		local NumCriteria = GetAchievementNumCriteria(id);
		
		if ( NumCriteria == 0 ) then
			objectivesFrame.mode = ACHIEVEMENTMODE_CRITERIA;
			objectivesFrame:SetHeight(0);
			return;
		end
	
		for i = 1, NumCriteria do
			local _, CriteriaType, Completed, _, _, _, Flags, AssetID, _ = GetAchievementCriteriaInfo(id, i);
			
			if ( CriteriaType == CRITERIA_TYPE_ACHIEVEMENT and AssetID ) then
				local Button = _G['AchievementFrameMeta'..i];
				
				local _, _, _, Completed, _, _, _, _, _, _ = GetAchievementInfo(AssetID);
				
				F.CreateBG(Button.icon);
				Button.icon:SetTexCoord(unpack(TexCoords));
				Button.icon:SetDrawLayer('OVERLAY');
				
				Button.border:Hide();
				
				if ( Completed ) then
					Button.label:SetTextColor(1, 1, 1);
				end
			elseif ( band(Flags, ACHIEVEMENT_CRITERIA_PROGRESS_BAR) == ACHIEVEMENT_CRITERIA_PROGRESS_BAR ) then
				local ProgressBar = _G['AchievementFrameProgressBar'..i];
				
				ProgressBar:DisableDrawLayer('ARTWORK');
				
				ProgressBar:SetStatusBarTexture(C.Media.Backdrop);
				
				if not ProgressBar.BD then
					local BD = CreateFrame('Frame', nil, ProgressBar);
					BD:SetPoint('TOPLEFT', -1, 1);
					BD:SetPoint('BOTTOMRIGHT', 1, -1);
					F.CreateBD(BD, 0);
					
					ProgressBar.BD = BD;
				end
				
				_G['AchievementFrameProgressBar'..i..'BG']:SetTexture(0, 0, 0, .25);
			else
				local Criteria = _G['AchievementFrameCriteria'..i];
				
				if ( Completed ) then
					Criteria.name:SetTextColor(1, 1, 1);
				end
			end
		end
	end);
end