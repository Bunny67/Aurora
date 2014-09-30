local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

local texCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	if(not AuroraConfig.Loot) then
		return;
	end
	-- LootFrame;
	F:SetBD(LootFrame, 13, -14, -68, 5);
	
	LootFramePortraitOverlay:Hide();
	select(2, LootFrame:GetRegions()):SetTexture(nil);
	
	F:ReskinClose(LootCloseButton, 'TOPRIGHT', LootFrame, 'TOPRIGHT', -72, -18);
	
	LootFrameDownButton:ClearAllPoints();
	LootFrameDownButton:SetPoint('BOTTOMRIGHT', -84, 16);
	LootFramePrev:ClearAllPoints();
	LootFramePrev:SetPoint('LEFT', LootFrameUpButton, 'RIGHT', 4, 0);
	LootFrameNext:ClearAllPoints();
	LootFrameNext:SetPoint('RIGHT', LootFrameDownButton, 'LEFT', -4, 0);
	
	do
		local button, buttonIcon;
		for i = 1, 4 do
			button = _G['LootButton'..i];
			buttonIcon = _G['LootButton'..i..'IconTexture'];
			
			button:SetNormalTexture('');
			button:SetPushedTexture('');
			button:GetHighlightTexture():SetTexture(C.r, C.g, C.b, .25);
			
			local BD = CreateFrame('Frame', nil, button);
			BD:SetPoint('TOPLEFT');
			BD:SetPoint('BOTTOMRIGHT', 114, 0);
			BD:SetFrameLevel(button:GetFrameLevel() - 1);
			F:CreateBD(BD, .25);
			
			_G['LootButton'..i..'NameFrame']:SetTexture(nil);
			
			F:CreateBG(buttonIcon);
			buttonIcon:SetTexCoord(unpack(texCoords));
		end
	end
	
	F:ReskinArrow(LootFrameUpButton, 'Up');
	F:ReskinArrow(LootFrameDownButton, 'Down');
	-- GroupLootFrame;
	do
		local frame, iconFrame, iconFrameIcon, frameTimer;
		for i = 1, NUM_GROUP_LOOT_FRAMES do
			frame = _G['GroupLootFrame'..i];
			iconFrame = _G['GroupLootFrame'..i..'IconFrameIcon'];
			iconFrameIcon = _G['GroupLootFrame'..i..'IconFrameIcon'];
			frameTimer = _G['GroupLootFrame'..i..'Timer'];
			
			F:SetBD(frame, 5, -6, -6, 6);
			
			_G['GroupLootFrame'..i..'SlotTexture']:SetTexture(nil);
			
			local nameBackground = CreateFrame('Frame', nil, frame);
			nameBackground:SetPoint('TOPLEFT', _G['GroupLootFrame'..i..'NameFrame'], -6, -5);
			nameBackground:SetPoint('BOTTOMRIGHT', _G['GroupLootFrame'..i..'NameFrame'], -20, 25);
			nameBackground:SetFrameLevel(frame:GetFrameLevel() - 1);
			F:CreateBD(nameBackground, .25);
			
			_G['GroupLootFrame'..i..'NameFrame']:SetTexture(nil);
			frame:DisableDrawLayer('OVERLAY');
			
			F:ReskinClose(frame.passButton, 'TOPRIGHT', frame, 'TOPRIGHT', -10, -10);
			
			F:CreateBG(iconFrame);
			iconFrameIcon:SetTexCoord(unpack(texCoords));
			
			F:CreateBD(frameTimer, .25);
			
			frameTimer:SetStatusBarTexture(C.Media.Backdrop);
			frameTimer:GetStatusBarTexture():SetGradient('VERTICAL', .1, .3, .9, .2, .4, 1);
			
			frameTimer:DisableDrawLayer('OVERLAY');
			
			frame:HookScript('OnShow', function(self)
				self:SetBackdrop(nil);
			end);
		end
	end
end);