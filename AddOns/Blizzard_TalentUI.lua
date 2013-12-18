local F, C = unpack(select(2, ...))

local _G = _G

C.modules['Blizzard_TalentUI'] = function()
	local AllTalentUIStripTextures = {'PlayerTalentFrame', 'PlayerTalentFrameStatusFrame', 'PlayerTalentFrameScrollFrame', 'PlayerTalentFramePointsBar', 'PlayerTalentFramePreviewBar', 'PlayerTalentFramePreviewBarFiller'}
	for i = 1, #AllTalentUIStripTextures do
		F.StripTextures(_G[AllTalentUIStripTextures[i]], true)
	end
	
	F.ReskinScroll(_G['PlayerTalentFrameScrollFrameScrollBar']);
	
	for i = 1, 4 do
		F.ReskinTab(_G['PlayerTalentFrameTab'..i]);
	end
	
	for i=1, MAX_TALENT_TABS do
		local tab = _G['PlayerSpecTab'..i]
		if tab then
			local a = tab:GetRegions()
			a:Hide()
			F.StripTextures(tab)
			tab:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
			
			tab:GetNormalTexture():ClearAllPoints()
			tab:GetNormalTexture():SetPoint('TOPLEFT', 1, -1)
			tab:GetNormalTexture():SetPoint('BOTTOMRIGHT', -1, 1)

			F.CreateBD(tab, .25)
			F.StyleButton(tab, nil, true)
		end
	end
	
	F.Reskin(_G['PlayerTalentFrameActivateButton'], nil, true)
	F.Reskin(_G['PlayerTalentFrameLearnButton'])
	F.Reskin(_G['PlayerTalentFrameResetButton'])
	
	for i=1, MAX_NUM_TALENTS do
		local bu = _G['PlayerTalentFrameTalent'..i]
		local ic = _G['PlayerTalentFrameTalent'..i..'IconTexture']	
		if bu then
			F.StripTextures(bu)
			F.CreateBD(bu, .25)
			F.StyleButton(bu)
		
			ic:SetTexCoord(.08, .92, .08, .92)
			ic:ClearAllPoints()
			ic:SetPoint("TOPLEFT", 1, -1)
			ic:SetPoint("BOTTOMRIGHT", -1, 1)
		end
	end
	
	F.SetBD(_G['PlayerTalentFrame'], 10, -12, -31, 76)
	F.ReskinClose(_G['PlayerTalentFrameCloseButton'], 'TOPRIGHT', _G['PlayerTalentFrame'], 'TOPRIGHT', -35, -16)
end