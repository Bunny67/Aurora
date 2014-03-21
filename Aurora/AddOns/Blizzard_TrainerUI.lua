local F, C = unpack(select(2, ...))

local _G = getfenv(0);
local unpack = unpack;

C.modules['Blizzard_TrainerUI'] = function()
	F.StripTextures(ClassTrainerFrame, true);
	F.SetBD(ClassTrainerFrame, 10, -12, -31, 76);
	
	F.ReskinClose(ClassTrainerFrameCloseButton, 'TOPRIGHT', ClassTrainerFrame, 'TOPRIGHT', -35, -16);
	
	local ColourExpandOrCollapse = F.ColourExpandOrCollapse
	local ClearExpandOrCollapse = F.ClearExpandOrCollapse
	
	local function StyleSkillButton(SkillButton)
		SkillButton:SetNormalTexture('');
		SkillButton.SetNormalTexture = F.dummy;
		SkillButton:SetPushedTexture('');

		SkillButton.BD = CreateFrame('Frame', nil, SkillButton);
		SkillButton.BD:SetSize(13, 13);
		SkillButton.BD:SetPoint("LEFT", 4, 1);
		SkillButton.BD:SetFrameLevel(SkillButton:GetFrameLevel()-1);
		F.CreateBD(SkillButton.BD, 0);

		SkillButton.Gradient = F.CreateGradient(SkillButton);
		SkillButton.Gradient:SetPoint('TOPLEFT', SkillButton.BD, 1, -1);
		SkillButton.Gradient:SetPoint('BOTTOMRIGHT', SkillButton.BD, -1, 1);

		SkillButton.Minus = SkillButton:CreateTexture(nil, 'OVERLAY');
		SkillButton.Minus:SetSize(7, 1);
		SkillButton.Minus:SetPoint('CENTER', SkillButton.BD);
		SkillButton.Minus:SetTexture(C.Media.Backdrop);
		SkillButton.Minus:SetVertexColor(1, 1, 1);

		SkillButton.Plus = SkillButton:CreateTexture(nil, 'OVERLAY');
		SkillButton.Plus:SetSize(1, 7);
		SkillButton.Plus:SetPoint('CENTER', SkillButton.BD);
		SkillButton.Plus:SetTexture(C.Media.Backdrop);
		SkillButton.Plus:SetVertexColor(1, 1, 1);

		SkillButton:HookScript('OnEnter', ColourExpandOrCollapse);
		SkillButton:HookScript('OnLeave', ClearExpandOrCollapse);
	end
	
	F.StripTextures(ClassTrainerExpandButtonFrame);
	
	StyleSkillButton(ClassTrainerCollapseAllButton);
	ClassTrainerCollapseAllButton:SetDisabledTexture('');
	ClassTrainerCollapseAllButton:SetHighlightTexture('');
	
	F.ReskinDropDown(ClassTrainerFrameFilterDropDown);
	
	hooksecurefunc('ClassTrainerFrame_Update', function()
		local numTrainerServices = GetNumTrainerServices();
		local skillOffset = FauxScrollFrame_GetOffset(ClassTrainerListScrollFrame);
		local diplayedSkills = TRADE_SKILLS_DISPLAYED
		local serviceType, isExpanded;
		local buttonIndex = 0
		
		for i = 1, CLASS_TRAINER_SKILLS_DISPLAYED, 1 do
			local skillIndex = i + skillOffset;
			buttonIndex = i
			
			local skillButton = _G['ClassTrainerSkill'..buttonIndex]

			if not skillButton.styled then
				skillButton.styled = true

				local buttonHighlight = _G['ClassTrainerSkill'..buttonIndex..'Highlight']
				buttonHighlight:SetTexture('')
				buttonHighlight.SetTexture = F.dummy

				StyleSkillButton(skillButton)
			end

			if skillIndex <= numTrainerServices then
				_, _, serviceType, isExpanded = GetTrainerServiceInfo(skillIndex);
				
				if serviceType == 'header' then
					skillButton.BD:SetPoint('LEFT', 4, 1);

					skillButton.BD:Show();
					skillButton.Gradient:Show();
					skillButton.Minus:Show();
					if isExpanded then
						skillButton.Plus:Hide();
					else
						skillButton.Plus:Show();
					end
				else
					skillButton.BD:Hide();
					skillButton.Gradient:Hide();
					skillButton.Minus:Hide();
					skillButton.Plus:Hide();
				end
			end
		end
		
		if ClassTrainerCollapseAllButton.collapsed == 1 then
			ClassTrainerCollapseAllButton.Plus:Show();
		else
			ClassTrainerCollapseAllButton.Plus:Hide();
		end
	end)
	
	F.StripTextures(ClassTrainerListScrollFrame);
	F.ReskinScroll(ClassTrainerListScrollFrameScrollBar);
	
	F.StripTextures(ClassTrainerSkillIcon);
	
	hooksecurefunc('ClassTrainer_SetSelection', function()
		local Icon = ClassTrainerSkillIcon:GetNormalTexture();
		
		if Icon then
			Icon:SetPoint("TOPLEFT", 1, -1);
			Icon:SetPoint("BOTTOMRIGHT", -1, 1);
			Icon:SetTexCoord(unpack(F.TexCoords));
			F.CreateBD(ClassTrainerSkillIcon);
		else
			ClassTrainerSkillIcon:SetBackdrop(nil);
		end
	end)
	
	F.Reskin(ClassTrainerTrainButton);
	F.Reskin(ClassTrainerCancelButton);
end