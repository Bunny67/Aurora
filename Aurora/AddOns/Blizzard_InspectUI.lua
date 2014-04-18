local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;
local pairs = pairs;

local TexCoords = F.TexCoords;
local Noop = F.dummy;

C.Modules['Blizzard_InspectUI'] = function()
	-- InspectFrame;
	F.SetBD(InspectFrame, 13, -13, -32, 73);
	InspectFramePortrait:Hide();
	
	F.ReskinClose(InspectFrameCloseButton, 'TOPRIGHT', InspectFrame, 'TOPRIGHT', -36, -17);
	
	for i = 1, 3 do
		local Tab = _G['InspectFrameTab'..i];
		
		F.ReskinTab(Tab)
		
		if ( i ~= 1 ) then
			Tab:SetPoint('LEFT', _G['InspectFrameTab'..i-1], 'RIGHT', -15, 0);
		end
	end
	-- InspectPaperDollFrame;
	for i = 1, 4 do
		select(i, InspectPaperDollFrame:GetRegions()):Hide();
	end
	
	F.ReskinArrow(InspectModelRotateLeftButton, 'Left');
	InspectModelRotateRightButton:SetPoint('TOPLEFT', InspectModelRotateLeftButton, 'TOPRIGHT', -1, 0);
	F.ReskinArrow(InspectModelRotateRightButton, 'Right');
	
	local Slots = { 'HeadSlot', 'NeckSlot', 'ShoulderSlot', 'BackSlot', 'ChestSlot', 'ShirtSlot', 'TabardSlot', 'WristSlot', 'HandsSlot', 'WaistSlot', 'LegsSlot', 'FeetSlot', 'Finger0Slot', 'Finger1Slot', 'Trinket0Slot', 'Trinket1Slot', 'MainHandSlot', 'SecondaryHandSlot', 'RangedSlot' };
	for _, Slot in pairs(Slots) do
		local InspectSlot = _G['Inspect'..Slot];
		local InspectIcon = _G['Inspect'..Slot..'IconTexture'];
		
		InspectSlot:SetNormalTexture('');
		F.CreateBD(InspectSlot);
		F.StyleButton(InspectSlot);
		
		InspectIcon:SetPoint('TOPLEFT', 1, -1);
		InspectIcon:SetPoint('BOTTOMRIGHT', -1, 1);
		InspectIcon:SetTexCoord(unpack(TexCoords));
	end
	
	if ( AuroraConfig.QualityColour ) then
		local CheckItemBorderColor = CreateFrame('Frame');
		
		local function ScanSlots()
			local notFound;
			
			for _, slot in pairs(Slots) do
				local Target = _G['Inspect'..slot];
				local SlotId, _, _ = GetInventorySlotInfo(slot);
				local ItemId = GetInventoryItemID('target', SlotId);

				if ItemId then
					local _, _, rarity, _, _, _, _, _, _, _, _ = GetItemInfo(ItemId);
					if not rarity then notFound = true; end
					
					if rarity and rarity > 1 then
						Target:SetBackdropBorderColor(GetItemQualityColor(rarity));
					else
						Target:SetBackdropBorderColor(0, 0, 0);
					end
				else
					Target:SetBackdropBorderColor(0, 0, 0);
				end
			end	
			
			if notFound == true then
				return false;
			else
				CheckItemBorderColor:SetScript('OnUpdate', nil);
				return true;
			end		
		end
		
		local function ColorItemBorder(self)
			if self and not ScanSlots() then
				self:SetScript('OnUpdate', ScanSlots);
			end 
		end

		CheckItemBorderColor:RegisterEvent('PLAYER_TARGET_CHANGED');
		CheckItemBorderColor:RegisterEvent('UNIT_PORTRAIT_UPDATE');
		CheckItemBorderColor:RegisterEvent('PARTY_MEMBERS_CHANGED');
		CheckItemBorderColor:SetScript('OnEvent', ColorItemBorder);
		InspectFrame:HookScript('OnShow', ColorItemBorder);
		ColorItemBorder(CheckItemBorderColor);
	end
	-- InspectPVPFrame;
	InspectPVPFrame:DisableDrawLayer('BACKGROUND');
	InspectPVPFrame:DisableDrawLayer('BORDER');

	for i = 1, MAX_ARENA_TEAMS do
		local TeamStandardBar = _G['InspectPVPTeam'..i..'StandardBar'];
		local Team = _G['InspectPVPTeam'..i];
		
		TeamStandardBar:SetAlpha(0);
		
		F.SetBD(Team, 9, -4, -24, 3);
		
		for j = 1, 5 do
			select(j, Team:GetRegions()):Hide();
		end
	end
	-- InspectTalentFrame;
	InspectTalentFramePortrait:Hide();
	
	InspectTalentFrame:DisableDrawLayer('BORDER');
	InspectTalentFrame:DisableDrawLayer('ARTWORK');
	
	for i = 1, MAX_TALENT_TABS do
		local Tab = _G['InspectTalentFrameTab'..i];
		
		for j = 1, 6 do
			select(j, Tab:GetRegions()):Hide();
			select(j, Tab:GetRegions()).Show = Noop;
		end
		
		select(8, Tab:GetRegions()):Hide();
	end
	
	F.ReskinClose(InspectTalentFrameCloseButton, 'TOPRIGHT', InspectTalentFrame, 'TOPRIGHT', -36, -17);
	
	InspectTalentFramePointsBar:DisableDrawLayer('BACKGROUND');
	InspectTalentFramePointsBar:DisableDrawLayer('BORDER');
	
	InspectTalentFrameScrollFrame:DisableDrawLayer('ARTWORK');
	F.ReskinScroll(InspectTalentFrameScrollFrameScrollBar);
	
	for i = 1, MAX_NUM_TALENTS do
		local Talent = _G['InspectTalentFrameTalent'..i];
		local TalentIcon = _G['InspectTalentFrameTalent'..i..'IconTexture'];
		
		Talent:SetNormalTexture('');
		F.CreateBG(Talent);
		F.StyleButton(Talent);
		
		Talent.Hover:SetAllPoints();
		Talent.Pushed:SetAllPoints();
		
		_G['InspectTalentFrameTalent'..i..'Slot']:Hide();
		_G['InspectTalentFrameTalent'..i..'RankBorder']:Hide();
		_G['InspectTalentFrameTalent'..i..'RankBorder'].Show = Noop;
		
		TalentIcon:SetTexCoord(unpack(TexCoords));
	end
end