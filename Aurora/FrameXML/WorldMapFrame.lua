local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	if AuroraConfig.Maps == true then
		local r, g, b = C.r, C.g, C.b
		
		if not WorldMapFrame.BG then
			WorldMapFrame.BG = CreateFrame('Frame', 'WorldMapFrame_Aurora', WorldMapFrame);
			WorldMapFrame.BG:SetFrameLevel(WorldMapDetailFrame:GetFrameLevel() - 2);
			F.CreateBD(WorldMapFrame.BG);
			WorldMapFrame.BG:SetPoint('TOPLEFT', -1, 1);
			WorldMapFrame.BG:SetPoint('BOTTOMRIGHT', 1, -1);
		end
		
		WorldMapDetailFrame.BG = CreateFrame('Frame', 'WorldMapDetailFrame_Aurora', WorldMapFrame);
		F.CreateBD(WorldMapDetailFrame.BG);
		WorldMapDetailFrame.BG:SetPoint('TOPLEFT', WorldMapDetailFrame, -1, 1);
		WorldMapDetailFrame.BG:SetPoint('BOTTOMRIGHT', WorldMapDetailFrame, 1, -1);
		WorldMapDetailFrame.BG:SetFrameLevel(WorldMapDetailFrame:GetFrameLevel() - 2);
		
		F.ReskinClose(WorldMapFrameCloseButton);
		
		local SizeUp = _G['WorldMapFrameSizeUpButton'];
		F.ReskinClose(SizeUp);
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
		F.ReskinClose(SizeDown);
		
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
		
		F.ReskinCheck(WorldMapTrackQuest);
		F.ReskinCheck(WorldMapQuestShowObjectives);
		
		F.ReskinDropDown(WorldMapZoneMinimapDropDown);
		F.ReskinDropDown(WorldMapContinentDropDown);
		F.ReskinDropDown(WorldMapZoneDropDown);
		
		F.Reskin(WorldMapZoomOutButton);
		
		F.ReskinScroll(WorldMapQuestScrollFrameScrollBar);
		F.ReskinScroll(WorldMapQuestDetailScrollFrameScrollBar);
		F.ReskinScroll(WorldMapQuestRewardScrollFrameScrollBar);
		
		local function SetLargeWorldMap()
			if InCombatLockdown() then return; end
			
			WorldMapFrame.BG:ClearAllPoints();
			WorldMapFrame.BG:SetPoint("TOPLEFT", WorldMapDetailFrame, "TOPLEFT", -10, 69);
			WorldMapFrame.BG:SetPoint("BOTTOMRIGHT", WorldMapDetailFrame, "BOTTOMRIGHT", 13, -30);
			
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
		end

		local function SetSmallWorldMap()
			if InCombatLockdown() then return; end
			
			WorldMapFrame.BG:ClearAllPoints();
			
			if not WORLDMAP_SETTINGS.advanced then
				WorldMapFrame.BG:SetPoint('TOPLEFT', 12, -12);
				WorldMapFrame.BG:SetPoint('BOTTOMRIGHT', -20, -10);
			else
				WorldMapFrame.BG:SetPoint('TOPLEFT', 0, 2);
				WorldMapFrame.BG:SetPoint('BOTTOMRIGHT', 0, 2);
			end
			
			WorldMapFrame:SetScale(1);
			
			WorldMapFrameSizeUpButton:ClearAllPoints();
			WorldMapFrameSizeUpButton:SetPoint('TOPRIGHT', WorldMapFrame.BG, 'TOPRIGHT', -24, -4);
			
			WorldMapFrameCloseButton:SetPoint('TOPRIGHT', WorldMapFrame.BG, 'TOPRIGHT', -4, -4);
		end
		
		local function SetQuestWorldMap()
			if InCombatLockdown() then return; end
			
			WorldMapFrame.BG:ClearAllPoints();
			WorldMapFrame.BG:SetPoint("TOPLEFT", WorldMapDetailFrame, "TOPLEFT", -10, 69);
			WorldMapFrame.BG:SetPoint("BOTTOMRIGHT", WorldMapDetailFrame, "BOTTOMRIGHT", 322, -235);
			
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
			
			WorldMapFrameSizeUpButton:Hide();
			WorldMapFrameSizeDownButton:Show();
		end
		
		local function AdjustMapSize()
			if InCombatLockdown() then return; end
			
			F.StripTextures(WorldMapFrame);
			
			if WORLDMAP_SETTINGS.size == WORLDMAP_FULLMAP_SIZE then
				SetLargeWorldMap();
			elseif WORLDMAP_SETTINGS.size == WORLDMAP_WINDOWED_SIZE then
				SetSmallWorldMap();
			elseif WORLDMAP_SETTINGS.size == WORLDMAP_QUESTLIST_SIZE then
				SetQuestWorldMap();
			end
			
			WorldMapFrameCloseButton:SetPoint('TOPRIGHT', WorldMapFrame.BG, 'TOPRIGHT', -4, -4);
			WorldMapFrameSizeDownButton:SetPoint('TOPRIGHT', WorldMapFrame.BG, 'TOPRIGHT', -24, -4);
			
			BlackoutWorld:SetTexture(nil);
		end
		
		AdjustMapSize();
		WorldMapFrame:HookScript('OnShow', AdjustMapSize);
		
		hooksecurefunc('WorldMap_ToggleSizeUp', AdjustMapSize);
		hooksecurefunc('WorldMap_ToggleSizeDown', SetSmallWorldMap);
		hooksecurefunc('WorldMapFrame_SetFullMapView', SetLargeWorldMap);
		hooksecurefunc('WorldMapFrame_SetQuestMapView', SetQuestWorldMap);
	end
end)