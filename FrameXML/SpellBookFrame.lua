local F, C = unpack(select(2, ...))

tinsert(C.modules['Aurora'], function()
	local AllSpellBookFrameStripTextures = {'SpellBookFrame'}
	for i = 1, #AllSpellBookFrameStripTextures do
		F.StripTextures(_G[AllSpellBookFrameStripTextures[i]], true)
	end

	local AllSpellBookFrameCheckBoxes = {'ShowAllSpellRanksCheckBox'}
	for i = 1, #AllSpellBookFrameCheckBoxes do
		F.ReskinCheck(_G[AllSpellBookFrameCheckBoxes[i]])
	end

	for i = 1, 3 do
		F.StripTextures(_G['SpellBookFrameTabButton'..i])
		F.ReskinTab(_G['SpellBookFrameTabButton'..i])
		_G['SpellBookFrameTabButton'..i]:SetHeight(32)
	end
	
	for i = 1, MAX_SKILLLINE_TABS do
		local tab = _G['SpellBookSkillLineTab'..i]
		if tab then
			F.StripTextures(tab)
			tab:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
			tab:GetNormalTexture():ClearAllPoints()
			tab:GetNormalTexture():SetPoint('BOTTOMRIGHT', -1, 1)
			tab:GetNormalTexture():SetPoint('TOPLEFT', 1, -1)
			
			F.CreateBD(tab, .25)
			F.StyleButton(tab, nil, true)
		end
	end

	local function SpellButtons(self, first)
		for i=1, SPELLS_PER_PAGE do
			local button = _G['SpellButton'..i]
			local icon = _G['SpellButton'..i..'IconTexture']
			
			if first then
				for i=1, button:GetNumRegions() do
					local region = select(i, button:GetRegions())
					if region:GetObjectType() == 'Texture' then
						if region:GetTexture() ~= 'Interface\\Buttons\\ActionBarFlyoutButton' then
							region:SetTexture(nil)
						end
					end
				end
			end
			
			if _G['SpellButton'..i..'Highlight'] then
				_G['SpellButton'..i..'Highlight']:SetTexture(1, 1, 1, 0.3)
				_G['SpellButton'..i..'Highlight']:ClearAllPoints()
				_G['SpellButton'..i..'Highlight']:SetAllPoints(icon)
			end

			if icon then
				icon:SetTexCoord(.08, .92, .08, .92)
				icon:ClearAllPoints()
				icon:SetAllPoints()
				icon:SetPoint('BOTTOMRIGHT', -1, 1)
				icon:SetPoint('TOPLEFT', 1, -1)
				
				if not button.backdrop then
					F.CreateBD(button, .25)	
				end
			end	
			
			local r, g, b = _G['SpellButton'..i..'SpellName']:GetTextColor()

			if r < 0.8 then
				_G['SpellButton'..i..'SpellName']:SetTextColor(0.6, 0.6, 0.6)
			end
			_G['SpellButton'..i..'SubSpellName']:SetTextColor(0.6, 0.6, 0.6)
		end
	end
	SpellButtons(nil, true)
	hooksecurefunc('SpellButton_UpdateButton', SpellButtons)
	
	F.SetBD(SpellBookFrame, 10, -12, -31, 76)
	F.ReskinClose(SpellBookCloseButton, 'TOPRIGHT', SpellBookFrame, 'TOPRIGHT', -35, -16)
	F.ReskinArrow(SpellBookPrevPageButton, 'left')
	F.ReskinArrow(SpellBookNextPageButton, 'right')
end)