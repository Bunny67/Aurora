local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	hooksecurefunc('AchievementAlertFrame_FixAnchors', function()
		local Frame, FrameBackground, FrameUnlocked, FrameGlow, FrameShine, FrameIcon, FrameIconTexture, FrameIconOverlay;
		
		for i = 1, MAX_ACHIEVEMENT_ALERTS do
			Frame = _G['AchievementAlertFrame'..i];
			FrameBackground = _G['AchievementAlertFrame'..i..'Background'];
			FrameUnlocked = _G['AchievementAlertFrame'..i..'Unlocked'];
			FrameGlow = _G['AchievementAlertFrame'..i..'Glow'];
			FrameShine = _G['AchievementAlertFrame'..i..'Shine'];
			FrameIcon = _G['AchievementAlertFrame'..i..'Icon'];
			FrameIconTexture = _G['AchievementAlertFrame'..i..'IconTexture'];
			FrameIconOverlay = _G['AchievementAlertFrame'..i..'IconOverlay'];
			
			if Frame then
				F.CreateBD(Frame);
				
				FrameBackground:SetTexture(nil);
				FrameUnlocked:SetTextColor(1, 1, 1);
				
				F.Kill(FrameGlow);
				F.Kill(FrameShine);
				
				select(8, FrameIcon:GetRegions()):Hide();
				FrameIconTexture:SetTexCoord(unpack(F.TexCoords));
				
				if not FrameIconTexture.BG then
					FrameIconTexture.BG = CreateFrame('Frame', nil, Frame);
					F.CreateBD(FrameIconTexture.BG);
					FrameIconTexture.BG:SetPoint('TOPLEFT', FrameIconTexture, -1, 1);
					FrameIconTexture.BG:SetPoint('BOTTOMRIGHT', FrameIconTexture, 1, -1);
				end
				
				F.Kill(FrameIconOverlay);
			end
		end	
	end);
	
	hooksecurefunc('DungeonCompletionAlertFrame_FixAnchors', function()
		local Frame, FrameDungeonTexture, FrameShine, FrameGlowFrame;
		
		for i = 1, DUNGEON_COMPLETION_MAX_REWARDS do
			Frame = _G['DungeonCompletionAlertFrame'..i];
			FrameDungeonTexture = _G['DungeonCompletionAlertFrame'..i..'DungeonTexture'];
			FrameShine = _G['DungeonCompletionAlertFrame'..i..'Shine'];
			FrameGlowFrame = _G['DungeonCompletionAlertFrame'..i..'GlowFrame'];
			
			if Frame then
				F.CreateBD(Frame);
				
				FrameDungeonTexture:SetTexCoord(unpack(F.TexCoords));
				
				if not FrameDungeonTexture.BG then
					FrameDungeonTexture.BG = CreateFrame('Frame', nil, Frame);
					FrameDungeonTexture.BG:SetFrameLevel(0);
					F.CreateBD(FrameDungeonTexture.BG);
					FrameDungeonTexture.BG:SetPoint('TOPLEFT', FrameDungeonTexture, -1, 1);
					FrameDungeonTexture.BG:SetPoint('BOTTOMRIGHT', FrameDungeonTexture, 1, -1);
				end
				
				for i=1, Frame:GetNumRegions() do
					local Region = select(i, Frame:GetRegions());
					if Region:GetObjectType() == 'Texture' then
						if Region:GetTexture() == 'Interface\\LFGFrame\\UI-LFG-DUNGEONTOAST' then
							F.Kill(Region);
						end
					end
				end
				
				F.Kill(FrameShine);
				
				F.Kill(FrameGlowFrame);
				F.Kill(FrameGlowFrame.glow);
			end
		end
	end);
end);