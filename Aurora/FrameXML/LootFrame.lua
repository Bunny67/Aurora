local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local select = select;
local unpack = unpack;
local tinsert = table.insert;

local TexCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	if(not AuroraConfig.Loot) then
		return;
	end
	
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
	
	F:ReskinArrow(LootFrameUpButton, 'Up');
	F:ReskinArrow(LootFrameDownButton, 'Down');
	
	hooksecurefunc('LootFrame_UpdateButton', function(index)
		local Button = _G['LootButton'..index];
		local ButtonNameFrame = _G['LootButton'..index..'NameFrame'];
		local ButtonIconTexture = _G['LootButton'..index..'IconTexture'];

		if(not ButtonIconTexture.BG) then
			Button:SetNormalTexture('');
			Button:SetPushedTexture('');
			Button:GetHighlightTexture():SetTexture(C.r, C.g, C.b, .25);
			
			local BD = CreateFrame('Frame', nil, Button);
			BD:SetPoint('TOPLEFT');
			BD:SetPoint('BOTTOMRIGHT', 114, 0);
			BD:SetFrameLevel(Button:GetFrameLevel() - 1);
			F:CreateBD(BD, .25);
			
			ButtonNameFrame:Hide();
			
			ButtonIconTexture:SetTexCoord(unpack(TexCoords));
			ButtonIconTexture.BG = F:CreateBG(ButtonIconTexture);
		end
	end);
end);