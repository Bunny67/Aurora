local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local tinsert = table.insert;

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
		local _, Header, IsExpanded, _, _, _, _, _, _, _, _, _ = GetSkillLineInfo(skillIndex);
		
		local StatusBar = _G['SkillRankFrame'..statusBarID];
		
		StatusBar:SetStatusBarTexture(C.Media.Backdrop);
		F.CreateBD(StatusBar, .25);
		
		_G['SkillRankFrame'..statusBarID..'Border']:SetAlpha(0);
		_G['SkillRankFrame'..statusBarID..'Background']:SetTexture(nil);
		
		local Label = _G['SkillTypeLabel'..statusBarID];
		
		if ( not Label.Style ) then
			F.ReskinExpandOrCollapse(Label);
			
			Label.Style = true;
		end
		
		if ( Header ) then
			if ( IsExpanded ) then
				Label.Plus:Hide();
			else
				Label.Plus:Show();
			end
		else
			Label.Plus:Hide();
		end
	end);
	
	hooksecurefunc('SkillDetailFrame_SetStatusBar', function()
		local StatusBar = _G['SkillDetailStatusBar'];
		
		StatusBar:SetStatusBarTexture(C.Media.Backdrop);
		F.CreateBD(StatusBar, .25);
		
		_G['SkillDetailStatusBarBorder']:SetAlpha(0);
		_G['SkillDetailStatusBarBackground']:SetTexture(nil);
	end);
	
	hooksecurefunc('SkillFrame_UpdateSkills', function()
		local NumSkills = GetNumSkillLines();
		
		SkillFrameCollapseAllButton.isExpanded = 1;
		SkillFrameCollapseAllButton.Minus:Show();
		SkillFrameCollapseAllButton.Plus:Hide();
		
		for i = 1, NumSkills do
			local temp, header, isExpanded = GetSkillLineInfo(i);
			
			if ( header ) then
				if ( not isExpanded ) then
					SkillFrameCollapseAllButton.isExpanded = nil;
					SkillFrameCollapseAllButton.Plus:Show();
					
					break;
				end
			end
		end
	end);
end);