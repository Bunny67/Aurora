local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local select = select;
local unpack = unpack;

local TexCoords = F.TexCoords;
local Hoop = F.dummy;

local ColourExpandOrCollapse = F.ColourExpandOrCollapse;
local ClearExpandOrCollapse = F.ClearExpandOrCollapse;

local function StyleSkillButton(self)
	self:SetNormalTexture(nil);
	self.SetNormalTexture = Hoop;
	self:SetPushedTexture(nil);
	
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

C.Modules['Blizzard_TradeSkillUI'] = function()
	F.SetBD(TradeSkillFrame, 11, -12, -34, 74);
	TradeSkillFramePortrait:Hide();
	
	select(3, TradeSkillFrame:GetRegions()):SetTexture(nil);
	select(4, TradeSkillFrame:GetRegions()):SetTexture(nil);
	
	TradeSkillFrameBottomLeftTexture:Hide();
	TradeSkillFrameBottomRightTexture:Hide();
	
	TradeSkillFrame:DisableDrawLayer('ARTWORK');
	
	F.ReskinCheck(TradeSkillFrameAvailableFilterCheckButton);
	TradeSkillFrameAvailableFilterCheckButton:SetPoint('TOPLEFT', 70, -49);
	
	TradeSkillRankFrame:SetStatusBarTexture(C.Media.Backdrop);
	TradeSkillRankFrame.SetStatusBarColor = Hoop;
	TradeSkillRankFrame:GetStatusBarTexture():SetGradient('VERTICAL', .1, .3, .9, .2, .4, 1);
	
	TradeSkillRankFrameBorder:SetTexture(nil);
	TradeSkillRankFrameBackground:SetTexture(nil);
	
	do
		local BD = CreateFrame('Frame', nil, TradeSkillRankFrame);
		BD:SetFrameLevel(TradeSkillRankFrame:GetFrameLevel() - 1);
		BD:SetPoint('TOPLEFT', -1, 1);
		BD:SetPoint('BOTTOMRIGHT', 1, -1);
		F.CreateBD(BD, .25);
	end
	
	F.ReskinInput(TradeSkillFrameEditBox, 16);
	TradeSkillFrameEditBox:SetPoint('TOPRIGHT', TradeSkillRankFrame, 'BOTTOMRIGHT', 1, -3);
	
	TradeSkillExpandButtonFrame:DisableDrawLayer('BACKGROUND');
	
	F.ReskinExpandOrCollapse(TradeSkillCollapseAllButton);
	
	F.ReskinDropDown(TradeSkillInvSlotDropDown);
	F.ReskinDropDown(TradeSkillSubClassDropDown);
	
	TradeSkillListScrollFrame:DisableDrawLayer('BACKGROUND');
	F.ReskinScroll(TradeSkillListScrollFrameScrollBar);
	
	TradeSkillDetailScrollFrame:DisableDrawLayer('BACKGROUND');
	F.ReskinScroll(TradeSkillDetailScrollFrameScrollBar);
	
	TradeSkillDetailHeaderLeft:Hide();
	
	do
		local Button, ButtonIcon;
		
		for i = 1, MAX_TRADE_SKILL_REAGENTS do
			local Button = _G['TradeSkillReagent'..i];
			local ButtonIcon = _G['TradeSkillReagent'..i..'IconTexture'];
			
			local BD = CreateFrame('Frame', nil, Button);
			BD:SetPoint('TOPLEFT', 39, -1);
			BD:SetPoint('BOTTOMRIGHT', 0, 1);
			BD:SetFrameLevel(0);
			F.CreateBD(BD, .25);
			
			ButtonIcon:SetTexCoord(unpack(TexCoords));
			ButtonIcon:SetDrawLayer('ARTWORK');
			F.CreateBG(ButtonIcon);
			
			_G['TradeSkillReagent'..i..'NameFrame']:SetTexture(nil);
			
			_G['TradeSkillReagent'..i..'Name']:SetParent(BD);
		end
	end
	
	F.Reskin(TradeSkillCreateButton);
	F.Reskin(TradeSkillCancelButton);
	F.Reskin(TradeSkillCreateAllButton);
	
	F.ReskinArrow(TradeSkillDecrementButton, 'Left');
	
	TradeSkillInputBox:SetPoint('LEFT', TradeSkillDecrementButton, 'RIGHT', 8, 0);
	F.ReskinInput(TradeSkillInputBox);
	
	F.ReskinArrow(TradeSkillIncrementButton, 'Right');
	
	F.ReskinClose(TradeSkillFrameCloseButton, 'TOPRIGHT', TradeSkillFrame, 'TOPRIGHT', -38, -16);
	
	hooksecurefunc('TradeSkillFrame_Update', function()
		local NumTradeSkills = GetNumTradeSkills();
		local SkillOffset = FauxScrollFrame_GetOffset(TradeSkillListScrollFrame);
		local ButtonIndex = 0;
		
		for i = 1, TRADE_SKILLS_DISPLAYED do
			local SkillIndex = i + SkillOffset;
			_, SkillType, _, IsExpanded = GetTradeSkillInfo(SkillIndex);
			ButtonIndex = i;
			
			local SkillButton = _G['TradeSkillSkill'..ButtonIndex];
			
			if ( SkillButton and not SkillButton.BD ) then
				local ButtonHighlight = _G['TradeSkillSkill'..ButtonIndex..'Highlight'];
				ButtonHighlight:SetTexture(nil);
				ButtonHighlight.SetTexture = Hoop;

				StyleSkillButton(SkillButton);
			end
			
			if ( SkillIndex <= NumTradeSkills ) then
				if (SkillType == 'header' ) then
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
		
		if ( TradeSkillCollapseAllButton.collapsed == 1 ) then
			TradeSkillCollapseAllButton.Plus:Show();
		else
			TradeSkillCollapseAllButton.Plus:Hide();
		end
	end);
	
	hooksecurefunc('TradeSkillFrame_SetSelection', function()
		local SkillIcon = TradeSkillSkillIcon:GetNormalTexture();
		
		if ( SkillIcon ) then
			F.CreateBD(TradeSkillSkillIcon);
			
			SkillIcon:SetPoint('TOPLEFT', 1, -1);
			SkillIcon:SetPoint('BOTTOMRIGHT', -1, 1);
			SkillIcon:SetTexCoord(unpack(TexCoords));
		else
			TradeSkillSkillIcon:SetBackdrop(nil);
		end
	end);
end