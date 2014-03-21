local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.StripTextures(SpellBookFrame, true);
	F.SetBD(SpellBookFrame, 10, -12, -31, 76);
	
	for i = 1, 3 do
		local Tab = _G['SpellBookFrameTabButton'..i];
		
		F.StripTextures(Tab);
		F.ReskinTab(Tab);
		Tab:SetHeight(32);
	end
	
	F.ReskinArrow(SpellBookPrevPageButton, 'Left');
	F.ReskinArrow(SpellBookNextPageButton, 'Right');
	
	F.ReskinClose(SpellBookCloseButton, 'TOPRIGHT', SpellBookFrame, 'TOPRIGHT', -35, -16);
	
	F.ReskinCheck(ShowAllSpellRanksCheckBox);

	for i = 1, SPELLS_PER_PAGE do
		local Button = _G['SpellButton'..i];
		local IconTexture = _G['SpellButton'..i..'IconTexture'];
		
		for i = 1, Button:GetNumRegions() do
			local Region = select(i, Button:GetRegions());
			if Region:GetObjectType() == 'Texture' then
				if Region:GetTexture() ~= 'Interface\\Buttons\\ActionBarFlyoutButton' then
					Region:SetTexture(nil);
				end
			end
		end
		
		if IconTexture then
			F.CreateBD(Button, .25);
			
			IconTexture:SetPoint('TOPLEFT', 1, -1);
			IconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
			IconTexture:SetTexCoord(unpack(F.TexCoords));
		end
	end
	
	hooksecurefunc('SpellButton_UpdateButton', function(self)
		local Name = self:GetName();
		local SubSpellName = _G[Name..'SubSpellName'];
		local IconTexture = _G[Name..'IconTexture'];
		local Highlight = _G[Name..'Highlight'];
		
		SubSpellName:SetTextColor(1, 1, 1);
		
		Highlight:SetTexture(1, 1, 1, .25);
		Highlight:SetAllPoints(IconTexture);
	end)
	
	for i = 1, MAX_SKILLLINE_TABS do
		local Tab = _G['SpellBookSkillLineTab'..i];
		
		F.StripTextures(Tab);
		F.StyleButton(Tab, nil, true);
		F.CreateBD(Tab);
		
		Tab:GetNormalTexture():SetPoint('TOPLEFT', 1, -1);
		Tab:GetNormalTexture():SetPoint('BOTTOMRIGHT', -1, 1);
		Tab:GetNormalTexture():SetTexCoord(unpack(F.TexCoords));
	end
end)