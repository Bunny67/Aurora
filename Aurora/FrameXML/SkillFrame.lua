local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	SkillFrame:DisableDrawLayer('BACKGROUND');
	SkillFrame:DisableDrawLayer('ARTWORK');
	
	SkillFrameExpandButtonFrame:DisableDrawLayer('BACKGROUND');
	F:ReskinExpandOrCollapse(SkillFrameCollapseAllButton);
	
	F:Reskin(SkillFrameCancelButton);
	
	SkillListScrollFrame:DisableDrawLayer('ARTWORK');
	F:ReskinScroll(SkillListScrollFrameScrollBar);
	
	SkillDetailScrollFrame:DisableDrawLayer('ARTWORK');
	F:ReskinScroll(SkillDetailScrollFrameScrollBar);
	
	SkillDetailStatusBar:SetStatusBarTexture(C.Media.Backdrop);
	F:CreateBD(SkillDetailStatusBar, .25);
	
	SkillDetailStatusBarBorder:SetAlpha(0);
	SkillDetailStatusBarBackground:SetTexture(nil);
	
	do
		local statusBar, statusBarLabel;
		
		for i = 1, SKILLS_TO_DISPLAY do
			statusBar = _G['SkillRankFrame'..i];
			statusBarLabel = _G['SkillTypeLabel'..i];
			
			statusBar:SetStatusBarTexture(C.Media.Backdrop);
			F:CreateBD(statusBar, .25);
			
			_G['SkillRankFrame'..i..'Border']:SetAlpha(0);
			_G['SkillRankFrame'..i..'Background']:SetTexture(nil);
			
			F:ReskinExpandOrCollapse(statusBarLabel);
		end
	end
	
	hooksecurefunc('SkillFrame_SetStatusBar', function(statusBarID, skillIndex, numSkills, adjustedSkillPoints)
		local _, header, isExpanded, _, _, _, _, _, _, _, _, _ = GetSkillLineInfo(skillIndex);
		
		local statusBarLabel = _G['SkillTypeLabel'..statusBarID];
		
		if(header) then
			if(isExpanded) then
				statusBarLabel.Plus:Hide();
			else
				statusBarLabel.Plus:Show();
			end
		else
			statusBarLabel.Plus:Hide();
		end
	end);
	
	hooksecurefunc('SkillFrame_UpdateSkills', function()
		local numSkills = GetNumSkillLines();
		
		SkillFrameCollapseAllButton.isExpanded = 1;
		SkillFrameCollapseAllButton.Minus:Show();
		SkillFrameCollapseAllButton.Plus:Hide();
		
		for i = 1, numSkills do
			local temp, header, isExpanded = GetSkillLineInfo(i);
			
			if(header) then
				if(not isExpanded) then
					SkillFrameCollapseAllButton.isExpanded = nil;
					SkillFrameCollapseAllButton.Plus:Show();
					
					break;
				end
			end
		end
	end);
end);