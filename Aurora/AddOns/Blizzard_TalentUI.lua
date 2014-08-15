local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;

local TexCoords = F.TexCoords;

C.Modules['Blizzard_TalentUI'] = function()
	F:SetBD(PlayerTalentFrame, 13, -12, -31, 74);
	PlayerTalentFramePortrait:Hide();
	
	PlayerTalentFrame:DisableDrawLayer('BORDER');
	
	F:ReskinClose(PlayerTalentFrameCloseButton, 'TOPRIGHT', PlayerTalentFrame, 'TOPRIGHT', -35, -16);
	
	PlayerTalentFramePointsLeft:SetTexture(nil);
	PlayerTalentFramePointsMiddle:SetTexture(nil);
	PlayerTalentFramePointsRight:SetTexture(nil);
	
	F:Reskin(PlayerTalentFrameActivateButton);
	
	PlayerTalentFramePointsBar:DisableDrawLayer('BACKGROUND');
	PlayerTalentFramePointsBar:DisableDrawLayer('BORDER');
	PlayerTalentFramePreviewBar:DisableDrawLayer('BORDER');
	
	F:Reskin(PlayerTalentFrameResetButton);
	PlayerTalentFrameLearnButton:SetPoint('RIGHT', PlayerTalentFrameResetButton, 'LEFT', -1, 0);
	F:Reskin(PlayerTalentFrameLearnButton);
	
	PlayerTalentFramePreviewBarFiller:DisableDrawLayer('BACKGROUND');
	
	PlayerTalentFrameScrollFrame:DisableDrawLayer('BORDER');
	PlayerTalentFrameScrollFrame:DisableDrawLayer('ARTWORK');
	F:ReskinScroll(PlayerTalentFrameScrollFrameScrollBar);
	
	do
		local Talent, TalentIcon;
		
		for i = 1, MAX_NUM_TALENTS do
			Talent = _G['PlayerTalentFrameTalent'..i];
			TalentIcon = _G['PlayerTalentFrameTalent'..i..'IconTexture'];
			
			Talent:SetNormalTexture(nil);
			F:CreateBG(Talent);
			F:StyleButton(Talent);
			
			Talent.Hover:SetAllPoints();
			Talent.Pushed:SetAllPoints();
			
			_G['PlayerTalentFrameTalent'..i..'Slot']:SetTexture(nil);
			_G['PlayerTalentFrameTalent'..i..'RankBorder']:SetTexture(nil);
			
			TalentIcon:SetTexCoord(unpack(TexCoords));
		end
	end
	
	do
		local Tab;
		
		for i = 1, 4 do
			Tab = _G['PlayerTalentFrameTab'..i];
			
			F:ReskinTab(Tab);
		end
	end
	
	do
		local Tab;
		
		for i = 1, MAX_TALENT_TABS do
			local Tab = _G['PlayerSpecTab'..i];
			
			if ( Tab ) then
				local Regions = Tab:GetRegions();
				Regions:Hide();
				
				F:CreateBD(Tab);
				F:StyleButton(Tab, nil, true);
				
				Tab:GetNormalTexture():SetPoint('TOPLEFT', 1, -1);
				Tab:GetNormalTexture():SetPoint('BOTTOMRIGHT', -1, 1);
				Tab:GetNormalTexture():SetTexCoord(unpack(TexCoords));
			end
		end
	end
end