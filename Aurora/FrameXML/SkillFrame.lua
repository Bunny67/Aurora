local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.Modules['Aurora'], function()
	SkillFrame:DisableDrawLayer('BACKGROUND');
	SkillFrame:DisableDrawLayer('ARTWORK');
	
	SkillFrameExpandButtonFrame:DisableDrawLayer('BACKGROUND');
	F.ReskinExpandOrCollapse(SkillFrameCollapseAllButton);
	
	F.Reskin(SkillFrameCancelButton);
	
	SkillListScrollFrame:DisableDrawLayer('ARTWORK');
	F.ReskinScroll(SkillListScrollFrameScrollBar);
	
	SkillDetailScrollFrame:DisableDrawLayer('ARTWORK');
	F.ReskinScroll(SkillDetailScrollFrameScrollBar);
	
	hooksecurefunc('SkillFrame_SetStatusBar', function(statusBarID, skillIndex, numSkills, adjustedSkillPoints)
		local _, header, isExpanded, _, _, _, _, _, _, _, _, _ = GetSkillLineInfo(skillIndex);
		
		local StatusBar = _G['SkillRankFrame'..statusBarID];
		local StatusBarBorder = _G['SkillRankFrame'..statusBarID..'Border'];
		local StatusBarBackground = _G['SkillRankFrame'..statusBarID..'Background'];
		
		StatusBar:SetStatusBarTexture(C.Media.Backdrop);

		F.CreateBD(StatusBar, .25);
		
		StatusBarBorder:Hide();
		StatusBarBackground:SetTexture(nil);
		
		local Label = _G['SkillTypeLabel'..statusBarID];
		
		if ( not Label.Style ) then
			F.ReskinExpandOrCollapse(Label);
			
			Label.Style = true;
		end
		
		if ( header ) then
			if ( isExpanded ) then
				Label.Plus:Hide();
			else
				Label.Plus:Show();
			end
		else
			Label.Plus:Hide();
		end
	end);
	
	hooksecurefunc('SkillDetailFrame_SetStatusBar', function()
		local StatusBar = _G["SkillDetailStatusBar"];
		local StatusBarBorder = _G['SkillDetailStatusBarBorder'];
		local StatusBarBackground = _G['SkillDetailStatusBarBackground'];
		
		StatusBar:SetStatusBarTexture(C.Media.Backdrop);
		F.CreateBD(StatusBar, .25);
		
		StatusBarBorder:SetTexture(nil);
		StatusBarBackground:SetTexture(nil);
	end);
	
	hooksecurefunc('SkillFrame_UpdateSkills', function()
		local NumSkills = GetNumSkillLines();
		
		SkillFrameCollapseAllButton.isExpanded = 1;
		SkillFrameCollapseAllButton.Minus:Show();
		SkillFrameCollapseAllButton.Plus:Hide()
		for i=1, NumSkills do
			local temp, header, isExpanded = GetSkillLineInfo(i);
			if ( header ) then
				if ( not isExpanded ) then
					SkillFrameCollapseAllButton.isExpanded = nil;
					SkillFrameCollapseAllButton.Plus:Show()
					break;
				end
			end
		end
	end);
end);