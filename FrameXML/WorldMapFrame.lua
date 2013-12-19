local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	local TinyWorldMap = function()
		WorldMapFrame:SetParent(UIParent);
		WorldMapFrame:EnableMouse(false);
		WorldMapFrame:EnableKeyboard(false);
		WorldMapFrame:SetScale(1);
		
		if ( not WorldMapFrame:GetAttribute('UIPanelLayout-defined') ) then
			UIPanelWindows['WorldMapFrame'].area = 'center';
			UIPanelWindows['WorldMapFrame'].allowOtherPanels = true;
		else
			WorldMapFrame:SetAttribute('UIPanelLayout-area', 'center');
			WorldMapFrame:SetAttribute('UIPanelLayout-allowOtherPanels', true);
		end
		
		BlackoutWorld:SetTexture(0, 0, 0, 0);
	end
	
	hooksecurefunc('WorldMap_ToggleSizeUp', TinyWorldMap);
	hooksecurefunc('WorldMapFrame_SetFullMapView', TinyWorldMap);
	TinyWorldMap();
	
	WorldMapFrame.backdrop = CreateFrame("Frame", nil, WorldMapFrame);
	WorldMapFrame.backdrop:SetFrameLevel(WorldMapDetailFrame:GetFrameLevel() - 2);
	F.CreateBD(WorldMapFrame.backdrop);
	WorldMapFrame.backdrop:SetPoint('TOPLEFT', -1, 1);
	WorldMapFrame.backdrop:SetPoint('BOTTOMRIGHT', 1, -1);
	
	WorldMapDetailFrame.backdrop = CreateFrame("Frame", nil, WorldMapFrame);
	F.CreateBD(WorldMapDetailFrame.backdrop);
	WorldMapDetailFrame.backdrop:SetPoint('TOPLEFT', WorldMapDetailFrame, -1, 1);
	WorldMapDetailFrame.backdrop:SetPoint('BOTTOMRIGHT', WorldMapDetailFrame, 1, -1);
	WorldMapDetailFrame.backdrop:SetFrameLevel(WorldMapDetailFrame:GetFrameLevel() - 2);
	
	local function SmallSkin()
		WorldMapFrame.backdrop:ClearAllPoints();
		WorldMapFrame.backdrop:SetPoint("TOPLEFT", 2, 2);
		WorldMapFrame.backdrop:SetPoint("BOTTOMRIGHT", 2, -2);
	end
	
	local function LargeSkin()
		WorldMapFrame.backdrop:ClearAllPoints();
		WorldMapFrame.backdrop:SetPoint("TOPLEFT", WorldMapDetailFrame, "TOPLEFT", -25, 70);
		WorldMapFrame.backdrop:SetPoint("BOTTOMRIGHT", WorldMapDetailFrame, "BOTTOMRIGHT", 25, -30);
	end
	
	local function QuestSkin()
		WorldMapFrame.backdrop:ClearAllPoints();
		WorldMapFrame.backdrop:SetPoint("TOPLEFT", WorldMapDetailFrame, "TOPLEFT", -25, 70);
		WorldMapFrame.backdrop:SetPoint("BOTTOMRIGHT", WorldMapDetailFrame, "BOTTOMRIGHT", 325, -235);
	end	
	
	local function FixSkin()
		F.StripTextures(WorldMapFrame);
		
		if WORLDMAP_SETTINGS.size == WORLDMAP_FULLMAP_SIZE then
			LargeSkin();
		elseif WORLDMAP_SETTINGS.size == WORLDMAP_WINDOWED_SIZE then
			SmallSkin();
		elseif WORLDMAP_SETTINGS.size == WORLDMAP_QUESTLIST_SIZE then
			QuestSkin();
		end
		
		if InCombatLockdown() then return; end
		
		WorldMapFrame:SetFrameLevel(3);
		WorldMapDetailFrame:SetFrameLevel(WorldMapFrame:GetFrameLevel() + 1);
		WorldMapFrame:SetFrameStrata('HIGH');	
	end
	
	WorldMapFrame:HookScript('OnShow', FixSkin);
	hooksecurefunc('WorldMapFrame_SetFullMapView', LargeSkin);
	hooksecurefunc('WorldMapFrame_SetQuestMapView', QuestSkin);
	hooksecurefunc('WorldMap_ToggleSizeUp', FixSkin);
	
	F.ReskinClose(_G['WorldMapFrameCloseButton']);
	F.ReskinClose(_G['WorldMapFrameSizeDownButton']);
	F.ReskinClose(_G['WorldMapFrameSizeUpButton']);
	
	F.ReskinDropDown(WorldMapLevelDropDown);
	
	F.ReskinCheck(_G['WorldMapTrackQuest']);
	F.ReskinCheck(_G['WorldMapQuestShowObjectives']);
	
	F.ReskinDropDown(WorldMapZoneMinimapDropDown);
	F.ReskinDropDown(WorldMapContinentDropDown);
	F.ReskinDropDown(WorldMapZoneDropDown);
	
	F.Reskin(_G['WorldMapZoomOutButton']);
	
	F.ReskinScroll(_G['WorldMapQuestScrollFrameScrollBar']);
	F.ReskinScroll(_G['WorldMapQuestDetailScrollFrameScrollBar']);
	F.ReskinScroll(_G['WorldMapQuestRewardScrollFrameScrollBar']);
end)