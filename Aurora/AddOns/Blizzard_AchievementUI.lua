local F, C = unpack(select(2, ...));

local _G = getfenv(0);

C.modules['Blizzard_AchievementUI'] = function()
	local r, g, b = C.r, C.g, C.b
	
	F.SetBD(AchievementFrame);
	
	local Frames = { 'AchievementFrame', 'AchievementFrameCategories', 'AchievementFrameSummary', 'AchievementFrameHeader', 'AchievementFrameSummaryCategoriesHeader', 'AchievementFrameSummaryAchievementsHeader', 'AchievementFrameStatsBG', 'AchievementFrameAchievements', 'AchievementFrameComparison', 'AchievementFrameComparisonHeader', 'AchievementFrameComparisonSummaryPlayer', 'AchievementFrameComparisonSummaryFriend' }
	for _, frame in pairs(Frames) do
		F.StripTextures(_G[frame], true);
	end
	
	local noname_frames = { 'AchievementFrameStats', 'AchievementFrameSummary', 'AchievementFrameAchievements', 'AchievementFrameComparison' }
	for _, frame in pairs(noname_frames) do
		for i=1, _G[frame]:GetNumChildren() do
			local child = select(i, _G[frame]:GetChildren());
			if child and not child:GetName() then
				child:SetBackdrop(nil);
			end
		end
	end
	
	AchievementFrameHeaderTitle:ClearAllPoints();
	AchievementFrameHeaderTitle:SetPoint('TOPLEFT', AchievementFrame, 'TOPLEFT', -30, -8);
	AchievementFrameHeaderPoints:ClearAllPoints();
	AchievementFrameHeaderPoints:SetPoint('LEFT', AchievementFrameHeaderTitle, 'RIGHT', 2, 0);
	
	F.ReskinClose(AchievementFrameCloseButton);
	F.ReskinDropDown(AchievementFrameFilterDropDown);
	AchievementFrameFilterDropDown:SetPoint('TOPRIGHT', AchievementFrame, 'TOPRIGHT', -98, 1);
	AchievementFrameFilterDropDownText:ClearAllPoints();
	AchievementFrameFilterDropDownText:SetPoint('CENTER', -10, 1);
	
	F.ReskinScroll(AchievementFrameCategoriesContainerScrollBar);
	AchievementFrameCategoriesContainerScrollBarBG:SetAlpha(0);
	F.ReskinScroll(AchievementFrameAchievementsContainerScrollBar);
	F.ReskinScroll(AchievementFrameStatsContainerScrollBar);
	F.ReskinScroll(AchievementFrameComparisonContainerScrollBar);
	F.ReskinScroll(AchievementFrameComparisonStatsContainerScrollBar);
	
	for i = 1, 2 do
		local Tab = _G['AchievementFrameTab'..i];
		
		F.ReskinTab(Tab);
	end
	
	local function SkinStatusBar(bar)
		F.StripTextures(bar);
		bar:SetStatusBarTexture(C.Media.Backdrop);
		bar:GetStatusBarTexture():SetGradient('VERTICAL', 0, .4, 0, 0, .6, 0);
		local BD = CreateFrame('Frame', nil, bar)
		BD:SetPoint('TOPLEFT', -1, 1);
		BD:SetPoint('BOTTOMRIGHT', 1, -1);
		BD:SetFrameLevel(BD:GetFrameLevel() - 1);
		F.CreateBD(BD, .25);
		
		if _G[bar:GetName()..'Title'] then
			_G[bar:GetName()..'Title']:SetPoint('LEFT', 4, 0);
		end

		if _G[bar:GetName()..'Label'] then
			_G[bar:GetName()..'Label']:SetPoint('LEFT', 4, 0);
		end
		
		if _G[bar:GetName()..'Text'] then
			_G[bar:GetName()..'Text']:SetPoint('RIGHT', -5, 0);
		end
		
		if _G[bar:GetName()..'Title'] then
			_G[bar:GetName()..'Title']:SetTextColor(1, 1, 1);
			_G[bar:GetName()..'Title']:SetPoint('LEFT', bar, 'LEFT', 6, 0);
		end
	end
	
	SkinStatusBar(AchievementFrameSummaryCategoriesStatusBar);
	SkinStatusBar(AchievementFrameComparisonSummaryPlayerStatusBar);
	SkinStatusBar(AchievementFrameComparisonSummaryFriendStatusBar);
	
	AchievementFrameComparisonHeader:SetPoint('BOTTOMRIGHT', AchievementFrameComparison, 'TOPRIGHT', 45, -20);
	
	for i = 1, 8 do
		local Frame = _G['AchievementFrameSummaryCategoriesCategory'..i];
		local Label = _G['AchievementFrameSummaryCategoriesCategory'..i..'Label'];
		local Button = _G['AchievementFrameSummaryCategoriesCategory'..i..'Button'];
		local Highlight = _G['AchievementFrameSummaryCategoriesCategory'..i..'ButtonHighlight'];
		
		SkinStatusBar(Frame);
		Label:SetTextColor(1, 1, 1);
		Label:SetPoint('LEFT', Frame, 'LEFT', 6, 0);
		F.StripTextures(Button);
		F.StripTextures(Highlight);
		
		_G[Highlight:GetName()..'Middle']:SetTexture(1, 1, 1, 0.3);
		_G[Highlight:GetName()..'Middle']:SetAllPoints(Frame);
	end
	
	AchievementFrame:HookScript('OnShow', function(self)
		if self.ContainerSkined then return; end
		for i = 1, 20 do
			local Frame = _G['AchievementFrameCategoriesContainerButton'..i];
			
			F.StripTextures(Frame);
			F.StyleButton(Frame);
			Frame.background:SetTexture(0, 0, 0, .25)
			Frame.background:SetPoint("TOPLEFT", 0, -1)
			Frame.background:SetPoint("BOTTOMRIGHT")

			local bg = F.CreateBDFrame(Frame, 0)
			bg:SetPoint("TOPLEFT", 0, -1)
			bg:SetPoint("BOTTOMRIGHT")
		end	
		
		self.ContainerSkined = true
	end)
	
	hooksecurefunc('AchievementFrameSummary_UpdateAchievements', function()
		for i=1, ACHIEVEMENTUI_MAX_SUMMARY_ACHIEVEMENTS do
			local Frame = _G['AchievementFrameSummaryAchievement'..i];
			local Highlight = _G['AchievementFrameSummaryAchievement'..i..'Highlight'];
			local Background = _G['AchievementFrameSummaryAchievement'..i..'Background'];
			
			F.StripTextures(Frame);
			Background:SetTexture(C.Media.Backdrop)
			Background:SetVertexColor(0, 0, 0, .25);
			F.Kill(Highlight);
			
			_G['AchievementFrameSummaryAchievement'..i..'Description']:SetTextColor(.9, .9, .9)

			if not Frame.Styled then
				local BD = CreateFrame('Frame', nil, Frame)
				BD:SetPoint('TOPLEFT', 2, -2);
				BD:SetPoint('BOTTOMRIGHT', -2, 2);
				F.CreateBD(BD, 0);
				
				Frame.Styled = true;
				
				F.Kill(_G['AchievementFrameSummaryAchievement'..i..'IconBling']);
				F.Kill(_G['AchievementFrameSummaryAchievement'..i..'IconOverlay']);
				F.CreateBD(_G['AchievementFrameSummaryAchievement'..i..'Icon']);
				_G['AchievementFrameSummaryAchievement'..i..'Icon']:SetHeight(_G['AchievementFrameSummaryAchievement'..i..'Icon']:GetHeight() - 14);
				_G['AchievementFrameSummaryAchievement'..i..'Icon']:SetWidth(_G['AchievementFrameSummaryAchievement'..i..'Icon']:GetWidth() - 14);
				_G['AchievementFrameSummaryAchievement'..i..'Icon']:ClearAllPoints()
				_G['AchievementFrameSummaryAchievement'..i..'Icon']:SetPoint('LEFT', 6, 0);
				_G['AchievementFrameSummaryAchievement'..i..'IconTexture']:SetTexCoord(unpack(F.TexCoords))
				_G['AchievementFrameSummaryAchievement'..i..'IconTexture']:SetPoint('TOPLEFT', 1, -1);
				_G['AchievementFrameSummaryAchievement'..i..'IconTexture']:SetPoint('BOTTOMRIGHT', -1, 1);
			end
		end				
	end)
	
	for i = 1, 7 do
		local Frame = _G['AchievementFrameAchievementsContainerButton'..i];
		local Highlight = _G['AchievementFrameAchievementsContainerButton'..i..'Highlight'];
		local Icon = _G['AchievementFrameAchievementsContainerButton'..i..'Icon'];
		local IconBling = _G['AchievementFrameAchievementsContainerButton'..i..'IconBling'];
		local IconOverlay = _G['AchievementFrameAchievementsContainerButton'..i..'IconOverlay'];
		local IconTexture = _G['AchievementFrameAchievementsContainerButton'..i..'IconTexture'];
		local Tracked = _G['AchievementFrameAchievementsContainerButton'..i..'Tracked'];
		
		F.StripTextures(Frame, true)
		F.Kill(Highlight);
		
		--[[local BD = CreateFrame('Frame', nil, Frame);
		BD:SetPoint('TOPLEFT', 1, -1);
		BD:SetPoint('BOTTOMRIGHT', -1, 1);
		BD:SetFrameLevel(BD:GetFrameLevel() - 1);
		F.CreateBD(BD, .25);]]
		
		_G['AchievementFrameAchievementsContainerButton'..i..'Description']:SetTextColor(0.6, 0.6, 0.6)
		_G['AchievementFrameAchievementsContainerButton'..i..'Description'].SetTextColor = F.dummy

		F.Kill(IconBling);
		F.Kill(IconOverlay);
		
		F.CreateBD(Icon);
		Icon:SetHeight(Icon:GetHeight() - 14);
		Icon:SetWidth(Icon:GetWidth() - 14);
		Icon:ClearAllPoints();
		Icon:SetPoint("LEFT", 6, 0);
		
		IconTexture:SetPoint('TOPLEFT', 1, -1);
		IconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
		IconTexture:SetTexCoord(unpack(F.TexCoords));
		
		F.StripTextures(Tracked);
		F.CreateBD(Tracked);
		Tracked:SetCheckedTexture('Interface\\Buttons\\UI-CheckBox-Check');
		Tracked:GetCheckedTexture():SetVertexColor(r, g, b)
		Tracked:GetCheckedTexture():SetPoint('TOPLEFT', -4, 4);
		Tracked:GetCheckedTexture():SetPoint('BOTTOMRIGHT', 4, -4);
		
		Tracked:ClearAllPoints();
		Tracked:SetPoint("BOTTOMLEFT", Frame, "BOTTOMLEFT", 5, 5);
	end
	
	local Compares = { 'Player', 'Friend' };
	for _, compare in pairs(Compares) do
		for i = 1, 9 do
			local frame = "AchievementFrameComparisonContainerButton"..i..compare
			
			F.StripTextures(_G[frame]);
			F.Kill(_G[frame.."Background"]);

			if _G[frame.."Description"] then
				_G[frame.."Description"]:SetTextColor(0.6, 0.6, 0.6)
				hooksecurefunc(_G[frame.."Description"], "SetTextColor", function(self, r, g, b)
					if r ~= 0.6 or g ~= 0.6 or b ~= 0.6 then
						self:SetTextColor(0.6, 0.6, 0.6)
					end
				end)				
			end
			
			--[[local BD = CreateFrame('Frame', nil, _G[frame]);
			BD:SetPoint('TOPLEFT', 1, -1);
			BD:SetPoint('BOTTOMRIGHT', -1, 1);
			BD:SetFrameLevel(BD:GetFrameLevel() - 1);
			F.CreateBD(BD, .25);]]
			
			if compare == "Friend" then
				_G[frame.."Shield"]:SetPoint("TOPRIGHT", _G["AchievementFrameComparisonContainerButton"..i.."Friend"], "TOPRIGHT", -20, -3)
			end
			
			F.Kill(_G[frame.."IconBling"]);
			F.Kill(_G[frame.."IconOverlay"]);
			F.CreateBD(_G[frame.."Icon"]);
			_G[frame.."Icon"]:SetHeight(_G[frame.."Icon"]:GetHeight() - 14);
			_G[frame.."Icon"]:SetWidth(_G[frame.."Icon"]:GetWidth() - 14);
			_G[frame.."Icon"]:ClearAllPoints();
			_G[frame.."Icon"]:SetPoint("LEFT", 6, 0);
			_G[frame.."IconTexture"]:SetTexCoord(unpack(F.TexCoords));
			_G[frame.."IconTexture"]:SetPoint('TOPLEFT', 1, -1);
			_G[frame.."IconTexture"]:SetPoint('BOTTOMRIGHT', -1, 1);
		end
	end
	
	for i = 1, 20 do
		local frame = _G['AchievementFrameStatsContainerButton'..i];
		F.StyleButton(frame);
		
		_G['AchievementFrameStatsContainerButton'..i..'BG']:SetTexture(1, 1, 1, 0.2);
		F.Kill(_G['AchievementFrameStatsContainerButton'..i..'HeaderLeft']);
		F.Kill(_G['AchievementFrameStatsContainerButton'..i..'HeaderRight']);
		F.Kill(_G['AchievementFrameStatsContainerButton'..i..'HeaderMiddle']);
		
		local frame = 'AchievementFrameComparisonStatsContainerButton'..i;
		F.StripTextures(_G[frame]);
		F.StyleButton(_G[frame]);
	
		_G[frame..'BG']:SetTexture(1, 1, 1, 0.2);
		F.Kill(_G[frame..'HeaderLeft']);
		F.Kill(_G[frame..'HeaderRight']);
		F.Kill(_G[frame..'HeaderMiddle']);
	end
	
	hooksecurefunc('AchievementButton_GetProgressBar', function(index)
		local Bar = _G['AchievementFrameProgressBar'..index];
		
		if not Bar.Skinned then
			F.StripTextures(Bar);
			Bar:SetStatusBarTexture(C.Media.Backdrop);

			_G['AchievementFrameProgressBar'..index..'BG']:SetTexture(0, 0, 0, .25);

			local BD = CreateFrame('Frame', nil, Bar);
			BD:SetPoint('TOPLEFT', -1, 1);
			BD:SetPoint('BOTTOMRIGHT', 1, -1);
			F.CreateBD(BD, 0);

			Bar.Skinned = true
		end
	end)
	
	hooksecurefunc('AchievementObjectives_DisplayCriteria', function(objectivesFrame, id)
		for i = 1, GetAchievementNumCriteria(id) do
			local Name = _G['AchievementFrameCriteria'..i..'Name'];
			if Name and select(2, Name:GetTextColor()) == 0 then
				Name:SetTextColor(1, 1, 1);
			end

			local Button = _G['AchievementFrameMeta'..i];
			if Button and select(2, Button.label:GetTextColor()) == 0 then
				Button.label:SetTextColor(1, 1, 1);
			end
		end
	end)
end