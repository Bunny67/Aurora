local _G = getfenv(0);
local unpack = unpack;
local select = select;

local F, C = unpack(select(2, ...));

local TexCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	hooksecurefunc('AchievementAlertFrame_FixAnchors', function()
		local frame, frameBackground, frameUnlocked, frameIcon, frameIconTexture;
		
		for i = 1, MAX_ACHIEVEMENT_ALERTS do
			frame = _G['AchievementAlertFrame'..i];
			frameBackground = _G['AchievementAlertFrame'..i..'Background'];
			frameUnlocked = _G['AchievementAlertFrame'..i..'Unlocked'];
			frameIcon = _G['AchievementAlertFrame'..i..'Icon'];
			frameIconTexture = _G['AchievementAlertFrame'..i..'IconTexture'];
			
			if(frame and not frame.BG) then
				frame.BG = CreateFrame('Frame', nil, frame);
				frame.BG:SetPoint('TOPLEFT', 2, -6);
				frame.BG:SetPoint('BOTTOMRIGHT', -2, 6);
				frame.BG:SetFrameLevel(frame:GetFrameLevel() - 1);
				F:CreateBD(frame.BG);
				
				frameBackground:Hide();
				frameUnlocked:SetTextColor(1, 1, 1);
				
				frame.glow:Hide();
				frame.shine:Hide();
				
				frameIcon:DisableDrawLayer('BACKGROUND');
				frameIcon:DisableDrawLayer('BORDER');
				frameIcon:DisableDrawLayer('OVERLAY');
				
				frameIconTexture:SetTexCoord(unpack(TexCoords));
				
				if(not frameIconTexture.BG) then
					frameIconTexture.BG = CreateFrame('Frame', nil, frame);
					frameIconTexture.BG:SetPoint('TOPLEFT', frameIconTexture, -1, 1);
					frameIconTexture.BG:SetPoint('BOTTOMRIGHT', frameIconTexture, 1, -1);
					F:CreateBD(frameIconTexture.BG);
				end
			end
		end	
	end);
	
	hooksecurefunc('DungeonCompletionAlertFrame_FixAnchors', function()
		local frame, frameDungeonTexture, frameGlowFrame;
		
		for i = 1, DUNGEON_COMPLETION_MAX_REWARDS do
			frame = _G['DungeonCompletionAlertFrame'..i];
			frameDungeonTexture = _G['DungeonCompletionAlertFrame'..i..'DungeonTexture'];
			frameGlowFrame = _G['DungeonCompletionAlertFrame'..i..'GlowFrame'];
			
			if(frame and not frame.BG) then
				frame.BG = CreateFrame('Frame', nil, frame);
				frame.BG:SetPoint('TOPLEFT', 0, -6);
				frame.BG:SetPoint('BOTTOMRIGHT', 0, -3);
				frame.BG:SetFrameLevel(frame:GetFrameLevel() - 1);
				F:CreateBD(frame.BG);
				
				frame:DisableDrawLayer('OVERLAY');
				frame:DisableDrawLayer('BORDER');
				
				frameDungeonTexture:SetTexCoord(unpack(TexCoords));
				
				if(not frameDungeonTexture.BG) then
					frameDungeonTexture.BG = CreateFrame('Frame', nil, frame);
					frameDungeonTexture.BG:SetFrameLevel(0);
					F:CreateBD(frameDungeonTexture.BG);
					frameDungeonTexture.BG:SetPoint('TOPLEFT', frameDungeonTexture, -1, 1);
					frameDungeonTexture.BG:SetPoint('BOTTOMRIGHT', frameDungeonTexture, 1, -1);
				end
				
				frameGlowFrame:Hide();
				frameGlowFrame.glow:Hide();
			end
		end
	end);
end);