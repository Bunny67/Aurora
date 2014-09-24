local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

local TexCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	if(not AuroraConfig.Bags) then
		return;
	end
	
	F:SetBD(BankFrame, 10, -11, -26, 93);
	
	BankPortraitTexture:Hide();
	
	select(2, BankFrame:GetRegions()):SetTexture(nil);
	
	F:ReskinClose(BankCloseButton, 'TOPRIGHT', BankFrame, 'TOPRIGHT', -30, -15);
	
	do
		local button, buttonIcon;
		
		for i = 1, NUM_BANKGENERIC_SLOTS, 1 do
			button = _G['BankFrameItem'..i];
			buttonIcon = _G['BankFrameItem'..i..'IconTexture'];
			
			button:SetNormalTexture(nil);
			
			F:StyleButton(button);
			F:CreateBD(button, .25);
			
			buttonIcon:SetTexCoord(unpack(TexCoords));
			buttonIcon:SetPoint('TOPLEFT', 1, -1);
			buttonIcon:SetPoint('BOTTOMRIGHT', -1, 1);
			
			_G['BankFrameItem'..i..'IconQuestTexture']:SetAlpha(0);
		end
		
		for i = 1, NUM_BANKBAGSLOTS, 1 do
			button = _G['BankFrameBag'..i];
			buttonIcon = _G['BankFrameBag'..i..'IconTexture'];
			
			button:SetNormalTexture(nil);
			
			F:StyleButton(button);
			F:CreateBD(button, .25);
			
			buttonIcon:SetTexCoord(unpack(TexCoords));
			buttonIcon:SetPoint('TOPLEFT', 1, -1);
			buttonIcon:SetPoint('BOTTOMRIGHT', -1, 1);
			
			_G['BankFrameBag'..i..'HighlightFrameTexture']:SetPoint('TOPLEFT', 1, -1);
			_G['BankFrameBag'..i..'HighlightFrameTexture']:SetPoint('BOTTOMRIGHT', -1, 1);
			_G['BankFrameBag'..i..'HighlightFrameTexture']:SetTexture(1, 1, 1, .25);
		end
	end
	
	F:Reskin(BankFramePurchaseButton);
	
	hooksecurefunc('BankFrameItemButton_Update', function(button)
		local buttonID = button:GetID();
		local _, _, _, quality = GetContainerItemInfo(BANK_CONTAINER, buttonID);
		
		if(not button.isBag) then
			if(quality and quality > ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
				button:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b);
			else
				button:SetBackdropBorderColor(0, 0, 0);
			end
			
			local isQuestItem, questId, isActive = GetContainerItemQuestInfo(BANK_CONTAINER, buttonID);
			
			if(questId and not isActive) then
				button:SetBackdropBorderColor(1, 0, 0);
			elseif(questId or isQuestItem) then
				button:SetBackdropBorderColor(1, 0, 0);
			end
		end
	end);
end);