local _G = getfenv(0);
local unpack = unpack;
local select = select;

local F, C = unpack(select(2, ...));

local texCoords = F.TexCoords;

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
		local button, buttonIcon, buttonRank;
		for i = 1, MAX_NUM_TALENTS do
			button = _G['PlayerTalentFrameTalent'..i];
			buttonIcon = _G['PlayerTalentFrameTalent'..i..'IconTexture'];
			buttonRank = _G['PlayerTalentFrameTalent'..i..'RankBorder'];
			
			button:SetNormalTexture(nil);
			F:StyleButton(button);
			button.background = F:CreateBG(button);
			
			button.Hover:SetAllPoints();
			button.Pushed:SetAllPoints();
			
			_G['PlayerTalentFrameTalent'..i..'Slot']:SetTexture(nil);
			buttonRank:SetTexture(nil);
			
			local testRankFrame = CreateFrame('Frame', nil, button);
			testRankFrame:SetPoint('TOPLEFT', buttonRank, 17, -17);
			testRankFrame:SetPoint('BOTTOMRIGHT', buttonRank, -3, 3);
			
			F:CreateGradient(testRankFrame);
			F:CreateBD(testRankFrame, 0);
			button.RankFrame = testRankFrame;
			
			_G['PlayerTalentFrameTalent'..i..'Rank']:SetParent(testRankFrame);
			_G['PlayerTalentFrameTalent'..i..'Rank']:SetPoint('CENTER');
			
			buttonIcon:SetTexCoord(unpack(texCoords));
		end
	end
	
	do
		local tab;
		for i = 1, 4 do
			tab = _G['PlayerTalentFrameTab'..i];
			
			F:ReskinTab(tab);
		end
	end
	
	do
		local tab;
		for i = 1, 3 do
			local tab = _G['PlayerSpecTab'..i];
			tab:GetRegions():Hide();
			
			F:CreateBD(tab);
			F:StyleButton(tab, nil, true);
			
			tab:GetNormalTexture():SetPoint('TOPLEFT', 1, -1);
			tab:GetNormalTexture():SetPoint('BOTTOMRIGHT', -1, 1);
			tab:GetNormalTexture():SetTexCoord(unpack(texCoords));
		end
	end
end