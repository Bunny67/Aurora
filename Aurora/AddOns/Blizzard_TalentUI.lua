local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;

local TexCoords = F.TexCoords;
local Noop = F.dummy;

C.Modules['Blizzard_TalentUI'] = function()
	F.SetBD(PlayerTalentFrame, 13, -12, -31, 74);
	PlayerTalentFramePortrait:Hide();
	
	PlayerTalentFrame:DisableDrawLayer('BORDER');
	
	F.ReskinClose(PlayerTalentFrameCloseButton, 'TOPRIGHT', PlayerTalentFrame, 'TOPRIGHT', -35, -16);
	
	PlayerTalentFramePointsLeft:Hide();
	PlayerTalentFramePointsMiddle:Hide();
	PlayerTalentFramePointsRight:Hide();
	
	F.Reskin(PlayerTalentFrameActivateButton, nil, true);
	
	PlayerTalentFramePointsBar:DisableDrawLayer('BACKGROUND');
	PlayerTalentFramePointsBar:DisableDrawLayer('BORDER');
	PlayerTalentFramePreviewBar:DisableDrawLayer('BORDER');
	
	F.Reskin(PlayerTalentFrameResetButton);
	PlayerTalentFrameLearnButton:SetPoint('RIGHT', PlayerTalentFrameResetButton, 'LEFT', -1, 0);
	F.Reskin(PlayerTalentFrameLearnButton);
	
	PlayerTalentFramePreviewBarFiller:DisableDrawLayer('BACKGROUND');
	
	PlayerTalentFrameScrollFrame:DisableDrawLayer('BORDER');
	PlayerTalentFrameScrollFrame:DisableDrawLayer('ARTWORK');
	F.ReskinScroll(PlayerTalentFrameScrollFrameScrollBar);
	
	for i = 1, MAX_NUM_TALENTS do
		local Talent = _G['PlayerTalentFrameTalent'..i];
		local TalentIcon = _G['PlayerTalentFrameTalent'..i..'IconTexture'];
		
		Talent:SetNormalTexture('');
		F.CreateBG(Talent);
		F.StyleButton(Talent);
		
		Talent.Hover:SetAllPoints();
		Talent.Pushed:SetAllPoints();
		
		_G['PlayerTalentFrameTalent'..i..'Slot']:Hide();
		_G['PlayerTalentFrameTalent'..i..'RankBorder']:Hide();
		_G['PlayerTalentFrameTalent'..i..'RankBorder'].Show = Noop;
		
		TalentIcon:SetTexCoord(unpack(TexCoords));
	end
	
	for i = 1, 4 do
		local Tab = _G['PlayerTalentFrameTab'..i];
		
		F.ReskinTab(Tab);
	end
	
	for i = 1, MAX_TALENT_TABS do
		local Tab = _G['PlayerSpecTab'..i];
		
		if ( Tab ) then
			local Regions = Tab:GetRegions();
			Regions:Hide();
			
			F.CreateBD(Tab);
			F.StyleButton(Tab, nil, true);
			
			Tab:GetNormalTexture():SetPoint('TOPLEFT', 1, -1);
			Tab:GetNormalTexture():SetPoint('BOTTOMRIGHT', -1, 1);
			Tab:GetNormalTexture():SetTexCoord(unpack(TexCoords));
		end
	end
end