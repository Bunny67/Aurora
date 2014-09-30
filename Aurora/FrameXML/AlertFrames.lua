local _G = getfenv(0);
local unpack = unpack;
local select = select;

local F, C = unpack(select(2, ...));

local texCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	do
		local frame, frameGlowFrame;
		for i = 1, DUNGEON_COMPLETION_MAX_REWARDS do
			frame = _G['DungeonCompletionAlertFrame'..i];
			frameGlowFrame = _G['DungeonCompletionAlertFrame'..i..'GlowFrame'];
			
			frame.background = CreateFrame('Frame', nil, frame);
			frame.background:SetPoint('TOPLEFT', 1, -10);
			frame.background:SetPoint('BOTTOMRIGHT', -2, 2);
			frame.background:SetFrameLevel(frame:GetFrameLevel() - 1);
			F:CreateBD(frame.background);
			
			frame:DisableDrawLayer('BORDER');
			frame:DisableDrawLayer('OVERLAY');
			
			frame.dungeonTexture:SetTexCoord(unpack(texCoords));
			
			frame.dungeonBackground = F:CreateBG(frame);
			frame.dungeonBackground:SetPoint('TOPLEFT', frame.dungeonTexture, -1, 1);
			frame.dungeonBackground:SetPoint('BOTTOMRIGHT', frame.dungeonTexture, 1, -1);
			
			frameGlowFrame:Hide();
			frameGlowFrame.glow:Hide();
		end
	end
	
	hooksecurefunc('AchievementAlertFrame_GetAlertFrame', function()
		local frame, frameIcon, frameIconTexture;
		for i = 1, MAX_ACHIEVEMENT_ALERTS do
			frame = _G['AchievementAlertFrame'..i];
			frameIcon = _G['AchievementAlertFrame'..i..'Icon'];
			frameIconTexture = _G['AchievementAlertFrame'..i..'IconTexture'];
			
			if(frame and not frame.background) then
				frame.background = CreateFrame('Frame', nil, frame);
				frame.background:SetPoint('TOPLEFT', 0, -7);
				frame.background:SetPoint('BOTTOMRIGHT', -2, 9);
				frame.background:SetFrameLevel(frame:GetFrameLevel() - 1);
				F:CreateBD(frame.background);
				
				_G['AchievementAlertFrame'..i..'Background']:Hide();
				_G['AchievementAlertFrame'..i..'Unlocked']:SetTextColor(1, 1, 1);
				
				frame.glow:Hide();
				frame.shine:Hide();
				
				frameIcon:DisableDrawLayer('BACKGROUND');
				frameIcon:DisableDrawLayer('BORDER');
				frameIcon:DisableDrawLayer('OVERLAY');
				
				frameIconTexture:SetTexCoord(unpack(texCoords));
				
				frame.iconBackground = F:CreateBG(frame);
				frame.iconBackground:SetPoint('TOPLEFT', frameIconTexture, -1, 1);
				frame.iconBackground:SetPoint('BOTTOMRIGHT', frameIconTexture, 1, -1);
			end
		end	
	end);
end);