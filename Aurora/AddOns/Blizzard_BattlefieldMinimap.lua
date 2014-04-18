local F, C = unpack(select(2, ...))

local _G = getfenv(0);

C.Modules['Blizzard_BattlefieldMinimap'] = function()
	-- BattlefieldMinimapTab
	BattlefieldMinimapTab:Hide();
	BattlefieldMinimapTabLeft:Hide();
	BattlefieldMinimapTabMiddle:Hide();
	BattlefieldMinimapTabRight:Hide();
	-- BattlefieldMinimap
	BattlefieldMinimap:EnableMouse(true);
	BattlefieldMinimap:SetMovable(true);
	BattlefieldMinimap:SetClampedToScreen(true);
	
	BattlefieldMinimap.BG = CreateFrame('Frame', 'BattlefieldMinimap_Aurora', BattlefieldMinimap);
	BattlefieldMinimap.BG:SetPoint('TOPLEFT', -1, 1);
	BattlefieldMinimap.BG:SetPoint('BOTTOMRIGHT', -5, 3);
	BattlefieldMinimap.BG:SetFrameLevel(0)
	F.CreateBD(BattlefieldMinimap.BG, 1);
	
	BattlefieldMinimapCorner:Hide();
	BattlefieldMinimapBackground:Hide();
	
	F.ReskinClose(BattlefieldMinimapCloseButton, 'TOPRIGHT', BattlefieldMinimap, 'TOPRIGHT', -7, -1);
	
	BattlefieldMinimap:SetScript('OnMouseUp', function(self, btn)
		if ( btn == 'LeftButton' ) then
			BattlefieldMinimapTab:StopMovingOrSizing();
			BattlefieldMinimapTab:SetUserPlaced(true);
		elseif ( btn == 'RightButton' ) then
			ToggleDropDownMenu(1, nil, BattlefieldMinimapTabDropDown, self:GetName(), 0, 0);
			return;
		end
	end);

	BattlefieldMinimap:SetScript("OnMouseDown", function(self, btn)
		if ( btn == 'LeftButton' ) then
			if BattlefieldMinimapOptions and BattlefieldMinimapOptions.locked then
				return;
			else
				BattlefieldMinimapTab:StartMoving();
			end
		end
	end);
	
	hooksecurefunc('BattlefieldMinimap_UpdateOpacity', function(opacity)
		local alpha = 1.0 - BattlefieldMinimapOptions.opacity or 0;
		BattlefieldMinimap.BG:SetAlpha(alpha);
	end);
	
	local Alpha
	BattlefieldMinimap:HookScript('OnEnter', function() Alpha = BattlefieldMinimapOptions.opacity or 0; BattlefieldMinimap_UpdateOpacity(0); end);
	BattlefieldMinimap:HookScript('OnLeave', function() if ( Alpha ) then BattlefieldMinimap_UpdateOpacity(Alpha); Alpha = nil; end end);
	
	BattlefieldMinimapCloseButton:HookScript('OnEnter', function() Alpha = BattlefieldMinimapOptions.opacity or 0; BattlefieldMinimap_UpdateOpacity(0); end);
	BattlefieldMinimapCloseButton:HookScript('OnLeave', function() if ( Alpha ) then BattlefieldMinimap_UpdateOpacity(Alpha); Alpha = nil; end end);
end