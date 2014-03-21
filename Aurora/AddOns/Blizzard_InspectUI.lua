local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;
local pairs = pairs;

C.modules['Blizzard_InspectUI'] = function()
	F.StripTextures(InspectFrame, true);
	F.SetBD(InspectFrame, 10, -12, -31, 75);
	
	F.ReskinClose(InspectFrameCloseButton, 'TOPRIGHT', InspectFrame, 'TOPRIGHT', -35, -16);
	
	for i = 1, 3 do
		local Tab = _G['InspectFrameTab'..i];
		
		F.ReskinTab(Tab)
	end
	
	F.StripTextures(InspectPaperDollFrame);

	local slots = {'HeadSlot', 'NeckSlot', 'ShoulderSlot', 'BackSlot', 'ChestSlot', 'ShirtSlot', 'TabardSlot', 'WristSlot', 'HandsSlot', 'WaistSlot', 'LegsSlot', 'FeetSlot', 'Finger0Slot', 'Finger1Slot', 'Trinket0Slot', 'Trinket1Slot', 'MainHandSlot', 'SecondaryHandSlot', 'RangedSlot'}
	for _, slot in pairs(slots) do
		local IconTexture = _G['Inspect'..slot..'IconTexture'];
		local Slot = _G['Inspect'..slot];
		
		IconTexture:SetPoint('TOPLEFT', 1, -1);
		IconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
		IconTexture:SetTexCoord(unpack(F.TexCoords));
		
		F.StripTextures(Slot);
		F.CreateBD(Slot);
		F.StyleButton(Slot);
	end
	
	local CheckItemBorderColor = CreateFrame('Frame');
	
	local function ScanSlots()
		local notFound;
		
		for _, slot in pairs(slots) do
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
	
	F.ReskinArrow(InspectModelRotateLeftButton, 'Left');
	F.ReskinArrow(InspectModelRotateRightButton, 'Right');
	
	F.StripTextures(InspectPVPFrame);

	for i=1, MAX_ARENA_TEAMS do
		local PVPTeam = _G['InspectPVPTeam'..i];
		
		F.StripTextures(PVPTeam);
	end
	
	F.StripTextures(InspectTalentFrame, true);
	
	F.ReskinClose(InspectTalentFrameCloseButton, 'TOPRIGHT', InspectTalentFrame, 'TOPRIGHT', -35, -16);
	
	for i=1, MAX_TALENT_TABS do
		local Tab = _G['InspectTalentFrameTab'..i];
		
		F.StripTextures(Tab);
	end
	
	for i = 1, MAX_NUM_TALENTS do
		local Talent = _G['InspectTalentFrameTalent'..i];
		local IconTexture = _G['InspectTalentFrameTalent'..i..'IconTexture'];
		
		if ( Talent ) then
			F.StripTextures(Talent);
			F.CreateBD(Talent);
			F.StyleButton(Talent);
			
			IconTexture:SetPoint('TOPLEFT', 1, -1);
			IconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
			IconTexture:SetTexCoord(unpack(F.TexCoords));
		end
	end
	
	F.StripTextures(InspectTalentFrameScrollFrame);
	F.ReskinScroll(InspectTalentFrameScrollFrameScrollBar);

	F.StripTextures(InspectTalentFramePointsBar);
end