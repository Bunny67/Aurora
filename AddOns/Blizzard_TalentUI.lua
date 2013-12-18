local F, C = unpack(select(2, ...));

local _G = getfenv(0);

C.modules['Blizzard_TalentUI'] = function()
	F.StripTextures(_G['PlayerTalentFrame'], true);
	F.SetBD(_G['PlayerTalentFrame'], 10, -12, -31, 76);
	
	F.ReskinClose(_G['PlayerTalentFrameCloseButton'], 'TOPRIGHT', PlayerTalentFrame, 'TOPRIGHT', -35, -16);
	
	F.StripTextures(_G['PlayerTalentFrameStatusFrame']);
	
	F.Reskin(_G['PlayerTalentFrameActivateButton'], nil, true);
	
	for i=1, MAX_NUM_TALENTS do
		local Talent = _G['PlayerTalentFrameTalent'..i];
		local IconTexture = _G['PlayerTalentFrameTalent'..i..'IconTexture'];
		
		if Talent then
			F.StripTextures(Talent);
			F.CreateBD(Talent);
			F.StyleButton(Talent);
			
			IconTexture:SetPoint('TOPLEFT', 1, -1);
			IconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
			IconTexture:SetTexCoord(unpack(F.TexCoords));
		end
	end
	
	F.StripTextures(_G['PlayerTalentFrameScrollFrame']);
	F.ReskinScroll(_G['PlayerTalentFrameScrollFrameScrollBar']);
	
	F.StripTextures(_G['PlayerTalentFramePointsBar']);
	F.StripTextures(_G['PlayerTalentFramePreviewBar']);
	F.StripTextures(_G['PlayerTalentFramePreviewBarFiller']);
	
	F.Reskin(_G['PlayerTalentFrameLearnButton']);
	F.Reskin(_G['PlayerTalentFrameResetButton']);
	
	for i = 1, 4 do
		F.ReskinTab(_G['PlayerTalentFrameTab'..i]);
	end
	
	for i=1, MAX_TALENT_TABS do
		local Tab = _G['PlayerSpecTab'..i];
		
		if Tab then
			local Regions = Tab:GetRegions();
			Regions:Hide();
			
			F.StripTextures(Tab);
			F.CreateBD(Tab);
			F.StyleButton(Tab, nil, true);
			
			Tab:GetNormalTexture():SetPoint('TOPLEFT', 1, -1);
			Tab:GetNormalTexture():SetPoint('BOTTOMRIGHT', -1, 1);
			Tab:GetNormalTexture():SetTexCoord(unpack(F.TexCoords));
		end
	end
end