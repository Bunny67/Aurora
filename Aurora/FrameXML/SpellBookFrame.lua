local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;
local strlen = string.len;

local TexCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	F.SetBD(SpellBookFrame, 13, -13, -31, 73);
	SpellBookFrameIcon:SetTexture(nil);
	
	for i = 2, 5 do
		select(i, SpellBookFrame:GetRegions()):SetTexture(nil);
	end
	
	do
		local Tab;
		
		for i = 1, 3 do
			Tab = _G['SpellBookFrameTabButton'..i];
			
			Tab:GetNormalTexture():SetTexture(nil);
			Tab:GetDisabledTexture():SetTexture(nil);
			
			F.ReskinTab(Tab);
			Tab:SetHeight(32);
		end
	end
	
	F.ReskinArrow(SpellBookPrevPageButton, 'Left');
	F.ReskinArrow(SpellBookNextPageButton, 'Right');
	
	F.ReskinClose(SpellBookCloseButton, 'TOPRIGHT', SpellBookFrame, 'TOPRIGHT', -35, -17);
	
	F.ReskinCheck(ShowAllSpellRanksCheckBox);
	
	do
		local Button;
		local ButtonIcon;
		
		for i = 1, SPELLS_PER_PAGE do
			Button = _G['SpellButton'..i];
			ButtonIcon = _G['SpellButton'..i..'IconTexture'];
			
			Button:GetNormalTexture():SetTexture(nil);
			
			_G['SpellButton'..i..'Background']:SetTexture(nil);
			
			if ButtonIcon then
				Button.BG = F.CreateBG(Button);
				
				ButtonIcon:SetTexCoord(unpack(TexCoords));
			end
		end
	end
	
	do
		local Tab;
		
		for i = 1, MAX_SKILLLINE_TABS do
			Tab = _G['SpellBookSkillLineTab'..i];
			
			select(1, Tab:GetRegions()):SetTexture(nil);
			
			F.StyleButton(Tab, nil, true);
			F.CreateBD(Tab);
			
			Tab:GetNormalTexture():SetPoint('TOPLEFT', 1, -1);
			Tab:GetNormalTexture():SetPoint('BOTTOMRIGHT', -1, 1);
			Tab:GetNormalTexture():SetTexCoord(unpack(TexCoords));
		end
	end
	
	hooksecurefunc('SpellButton_UpdateButton', function(self)
		local Temp, Texture, Offset, NumSpells = SpellBook_GetTabInfo(SpellBookFrame.selectedSkillLine);
		
		local ID, DisplayID = SpellBook_GetSpellID(self:GetID());
		local Name = self:GetName();
		local SubSpellName = _G[Name..'SubSpellName'];
		local Highlight = _G[Name..'Highlight'];
		
		self:GetPushedTexture():SetTexture(.9, .8, .1, .25);
		self:GetCheckedTexture():SetTexture(1, 1, 1, .25);
		
		SubSpellName:SetTextColor(1, 1, 1);
		
		Highlight:SetTexture(C.r, C.g, C.b, .25);
		
		if ( (SpellBookFrame.bookType ~= BOOKTYPE_PET) and (not DisplayID or DisplayID > (Offset + NumSpells)) ) then
			self.BG:Hide();
			
			return;
		end
		
		local Texture = GetSpellTexture(ID, SpellBookFrame.bookType);
		
		if ( not Texture or (strlen(Texture) == 0) ) then
			self.BG:Hide();
			
			return;
		end
		
		self.BG:Show();
	end);
end);