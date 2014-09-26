local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local strlen = string.len;

local F, C = unpack(select(2, ...));

local TexCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	F:SetBD(SpellBookFrame, 13, -13, -31, 73);
	SpellBookFrameIcon:SetTexture(nil);
	
	for i = 2, 5 do
		select(i, SpellBookFrame:GetRegions()):SetTexture(nil);
	end
	
	do
		local tab;
		
		for i = 1, 3 do
			tab = _G['SpellBookFrameTabButton'..i];
			
			tab:GetNormalTexture():SetTexture(nil);
			tab:GetDisabledTexture():SetTexture(nil);
			
			F:ReskinTab(tab);
			tab:SetHeight(32);
		end
	end
	
	F:ReskinArrow(SpellBookPrevPageButton, 'Left');
	F:ReskinArrow(SpellBookNextPageButton, 'Right');
	
	F:ReskinClose(SpellBookCloseButton, 'TOPRIGHT', SpellBookFrame, 'TOPRIGHT', -35, -17);
	
	F:ReskinCheck(ShowAllSpellRanksCheckBox);
	
	do
		local button, iconTexture;
		
		for i = 1, SPELLS_PER_PAGE do
			button = _G['SpellButton'..i];
			iconTexture = _G['SpellButton'..i..'IconTexture'];
			
			button:GetNormalTexture():SetTexture(nil);
			
			_G['SpellButton'..i..'Background']:SetTexture(nil);
			
			button.background = F:CreateBG(button);
			
			iconTexture:SetTexCoord(unpack(TexCoords));
		end
	end
	
	do
		local skillLineTab;
		
		for i = 1, MAX_SKILLLINE_TABS do
			skillLineTab = _G['SpellBookSkillLineTab'..i];
			
			select(1, skillLineTab:GetRegions()):SetTexture(nil);
			
			F:StyleButton(skillLineTab, nil, true);
			F:CreateBD(skillLineTab);
			
			skillLineTab:GetNormalTexture():SetPoint('TOPLEFT', 1, -1);
			skillLineTab:GetNormalTexture():SetPoint('BOTTOMRIGHT', -1, 1);
			skillLineTab:GetNormalTexture():SetTexCoord(unpack(TexCoords));
		end
	end
	
	hooksecurefunc('SpellButton_UpdateButton', function(self)
		local temp, texture, offset, numSpells = SpellBook_GetTabInfo(SpellBookFrame.selectedSkillLine);
		
		local id, displayID = SpellBook_GetSpellID(self:GetID());
		local name = self:GetName();
		local subSpellString = _G[name..'SubSpellName'];
		local highlight = _G[name..'Highlight'];
		
		self:GetPushedTexture():SetTexture(.9, .8, .1, .25);
		self:GetCheckedTexture():SetTexture(1, 1, 1, .25);
		
		subSpellString:SetTextColor(1, 1, 1);
		
		highlight:SetTexture(C.r, C.g, C.b, .25);
		
		if((SpellBookFrame.bookType ~= BOOKTYPE_PET) and (not displayID or displayID > (offset + numSpells))) then
			self.background:Hide();
			
			return;
		end
		
		local texture = GetSpellTexture(id, SpellBookFrame.bookType);
		
		if(not texture or (strlen(texture) == 0)) then
			self.background:Hide();
			
			return;
		end
		
		self.background:Show();
	end);
end);