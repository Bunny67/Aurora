local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	local r, g, b = C.r, C.g, C.b
	
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
		WorldMapFrame.backdrop:SetPoint('TOPLEFT', 2, 2);
		WorldMapFrame.backdrop:SetPoint('BOTTOMRIGHT', 2, 0);
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
	
	F.ReskinClose(WorldMapFrameCloseButton);
	
	local SizeUp = _G['WorldMapFrameSizeUpButton'];
	F.ReskinClose(SizeUp, 'TOPLEFT', WorldMapFrameSizeDownButton);
	SizeUp.Texs = {};
	
	SizeUp.Top = SizeUp:CreateTexture(nil, 'OVERLAY');
	SizeUp.Top:SetSize(7, 1);
	SizeUp.Top:SetPoint('TOP', 2, -3);
	SizeUp.Top:SetTexture(C.media.backdrop);
	SizeUp.Top:SetVertexColor(1, 1, 1);
	SizeUp.Right = WorldMapFrameSizeUpButton:CreateTexture(nil, 'OVERLAY');
	SizeUp.Right:SetSize(1, 7);
	SizeUp.Right:SetPoint('RIGHT', -3, 2);
	SizeUp.Right:SetTexture(C.media.backdrop);
	SizeUp.Right:SetVertexColor(1, 1, 1);
	
	for i = 1, 9 do
		local Texture = SizeUp:CreateTexture();
		Texture:SetTexture(1, 1, 1);
		Texture:SetSize(1, 1);
		Texture:SetPoint('BOTTOMLEFT', 3 + i, 3 + i);
		tinsert(SizeUp.Texs, Texture);
	end
	
	for _, pixel in pairs(SizeUp.Pixels) do pixel:Hide(); end
	SizeUp:HookScript('OnEnter', function(self) if self:IsEnabled() then for _, Tex in pairs(self.Texs) do Tex:SetVertexColor(r, g, b); end self.Top:SetVertexColor(r, g, b); self.Right:SetVertexColor(r, g, b); end end);
	SizeUp:HookScript('OnLeave', function(self) if self:IsEnabled() then for _, Tex in pairs(self.Texs) do Tex:SetVertexColor(1, 1, 1); end self.Top:SetVertexColor(1, 1, 1); self.Right:SetVertexColor(1, 1, 1); end end);
	
	local SizeDown = _G['WorldMapFrameSizeDownButton'];
	F.ReskinClose(SizeDown, "TOPRIGHT", WorldMapPositioningGuide, -16, 4);
	
	SizeDown.Texs = {};
	SizeDown.Bottom = SizeDown:CreateTexture(nil, 'OVERLAY');
	SizeDown.Bottom:SetSize(7, 1);
	SizeDown.Bottom:SetPoint('BOTTOM', -2, 3);
	SizeDown.Bottom:SetTexture(C.media.backdrop);
	SizeDown.Bottom:SetVertexColor(1, 1, 1);
	SizeDown.Left = SizeDown:CreateTexture(nil, 'OVERLAY');
	SizeDown.Left:SetSize(1, 7);
	SizeDown.Left:SetPoint('LEFT', 3, -2);
	SizeDown.Left:SetTexture(C.media.backdrop);
	SizeDown.Left:SetVertexColor(1, 1, 1);
	
	for i = 1, 9 do
		local Texture = SizeDown:CreateTexture();
		Texture:SetTexture(1, 1, 1);
		Texture:SetSize(1, 1);
		Texture:SetPoint('BOTTOMLEFT', 3 + i, 3 + i);
		tinsert(SizeDown.Texs, Texture);
	end
	
	for _, pixel in pairs(SizeDown.Pixels) do pixel:Hide(); end
	SizeDown:HookScript('OnEnter', function(self) if self:IsEnabled() then for _, Tex in pairs(self.Texs) do Tex:SetVertexColor(r, g, b); end self.Bottom:SetVertexColor(r, g, b); self.Left:SetVertexColor(r, g, b); end end);
	SizeDown:HookScript('OnLeave', function(self) if self:IsEnabled() then for _, Tex in pairs(self.Texs) do Tex:SetVertexColor(1, 1, 1); end self.Bottom:SetVertexColor(1, 1, 1); self.Left:SetVertexColor(1, 1, 1); end end);
	
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