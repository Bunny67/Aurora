local F, C = unpack(select(2, ...))

local _G = getfenv(0);
local unpack = unpack;

local TexCoords = F.TexCoords;
local Hoop = F.dummy;

local ColourExpandOrCollapse = F.ColourExpandOrCollapse;
local ClearExpandOrCollapse = F.ClearExpandOrCollapse;

local function StyleSkillButton(self)
	self:SetNormalTexture('');
	self.SetNormalTexture = Hoop;
	self:SetPushedTexture('');
	
	self.BD = CreateFrame('Frame', nil, self);
	self.BD:SetSize(13, 13);
	self.BD:SetPoint('LEFT', 4, 1);
	self.BD:SetFrameLevel(self:GetFrameLevel() - 1);
	F.CreateBD(self.BD, 0);
	
	self.Gradient = F.CreateGradient(self);
	self.Gradient:SetPoint('TOPLEFT', self.BD, 1, -1);
	self.Gradient:SetPoint('BOTTOMRIGHT', self.BD, -1, 1);
	
	self.Minus = self:CreateTexture(nil, 'OVERLAY');
	self.Minus:SetSize(7, 1);
	self.Minus:SetPoint('CENTER', self.BD);
	self.Minus:SetTexture(C.Media.Backdrop);
	self.Minus:SetVertexColor(1, 1, 1);
	
	self.Plus = self:CreateTexture(nil, 'OVERLAY');
	self.Plus:SetSize(1, 7);
	self.Plus:SetPoint('CENTER', self.BD);
	self.Plus:SetTexture(C.Media.Backdrop);
	self.Plus:SetVertexColor(1, 1, 1);
	
	self:HookScript('OnEnter', ColourExpandOrCollapse);
	self:HookScript('OnLeave', ClearExpandOrCollapse);
end

C.Modules['Blizzard_TrainerUI'] = function()
	F.SetBD(ClassTrainerFrame, 10, -12, -34, 74);
	ClassTrainerFramePortrait:Hide();
	
	select(2, ClassTrainerFrame:GetRegions()):Hide();
	select(3, ClassTrainerFrame:GetRegions()):Hide();
	
	ClassTrainerFrameBottomLeft:Hide();
	ClassTrainerFrameBottomRight:Hide();
	
	ClassTrainerFrame:DisableDrawLayer('ARTWORK');
	
	ClassTrainerExpandButtonFrame:DisableDrawLayer('BACKGROUND');
	
	F.ReskinExpandOrCollapse(ClassTrainerCollapseAllButton);
	
	F.ReskinDropDown(ClassTrainerFrameFilterDropDown);
	
	ClassTrainerListScrollFrame:DisableDrawLayer('BACKGROUND');
	F.ReskinScroll(ClassTrainerListScrollFrameScrollBar);
	
	ClassTrainerDetailScrollFrame:DisableDrawLayer('BACKGROUND');
	F.ReskinScroll(ClassTrainerDetailScrollFrameScrollBar);
	
	ClassTrainerSkillIcon:GetRegions():Hide();
	
	F.Reskin(ClassTrainerTrainButton);
	F.Reskin(ClassTrainerCancelButton);
	
	F.ReskinClose(ClassTrainerFrameCloseButton, 'TOPRIGHT', ClassTrainerFrame, 'TOPRIGHT', -38, -16);
	
	hooksecurefunc('ClassTrainerFrame_Update', function()
		local NumTrainerServices = GetNumTrainerServices();
		local SkillOffset = FauxScrollFrame_GetOffset(ClassTrainerListScrollFrame);
		local DiplayedSkills = TRADE_SKILLS_DISPLAYED;
		local ServiceType, IsExpanded;
		local ButtonIndex = 0;
		
		for i = 1, CLASS_TRAINER_SKILLS_DISPLAYED, 1 do
			local SkillIndex = i + SkillOffset;
			ButtonIndex = i;
			
			local SkillButton = _G['ClassTrainerSkill'..ButtonIndex];

			if ( SkillButton and not SkillButton.BD ) then
				local ButtonHighlight = _G['ClassTrainerSkill'..ButtonIndex..'Highlight'];
				ButtonHighlight:SetTexture('');
				ButtonHighlight.SetTexture = Hoop;

				StyleSkillButton(SkillButton);
			end

			if ( SkillIndex <= NumTrainerServices ) then
				_, _, ServiceType, IsExpanded = GetTrainerServiceInfo(SkillIndex);
				
				if ( ServiceType == 'header' ) then
					SkillButton.BD:SetPoint('LEFT', 4, 1);

					SkillButton.BD:Show();
					SkillButton.Gradient:Show();
					SkillButton.Minus:Show();
					
					if ( IsExpanded ) then
						SkillButton.Plus:Hide();
					else
						SkillButton.Plus:Show();
					end
				else
					SkillButton.BD:Hide();
					SkillButton.Gradient:Hide();
					SkillButton.Minus:Hide();
					SkillButton.Plus:Hide();
				end
			end
		end
		
		if ( ClassTrainerCollapseAllButton.collapsed == 1 ) then
			ClassTrainerCollapseAllButton.Plus:Show();
		else
			ClassTrainerCollapseAllButton.Plus:Hide();
		end
	end);
	
	hooksecurefunc('ClassTrainer_SetSelection', function()
		local SkillIcon = ClassTrainerSkillIcon:GetNormalTexture();
		
		if ( SkillIcon ) then
			F.CreateBD(ClassTrainerSkillIcon);
			
			SkillIcon:SetPoint('TOPLEFT', 1, -1);
			SkillIcon:SetPoint('BOTTOMRIGHT', -1, 1);
			SkillIcon:SetTexCoord(unpack(TexCoords));
		else
			ClassTrainerSkillIcon:SetBackdrop(nil);
		end
	end);
end