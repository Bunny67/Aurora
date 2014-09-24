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
	
	do
		local containerFrame, containerFrameClose;
		
		for i = 1, NUM_CONTAINER_FRAMES, 1 do
			containerFrame = _G['ContainerFrame'..i];
			containerFrameClose = _G['ContainerFrame'..i..'CloseButton'];
			
			F:SetBD(containerFrame, 9, -4, -4, 2);
			
			_G['ContainerFrame'..i..'Portrait']:Hide();
			
			for i = 2, 5 do
				select(i, containerFrame:GetRegions()):SetAlpha(0);
			end
			
			do
				local itemButton, itemButtonIcon;
				
				for k = 1, MAX_CONTAINER_ITEMS, 1 do
					itemButton = _G['ContainerFrame'..i..'Item'..k];
					itemButtonIcon = _G['ContainerFrame'..i..'Item'..k..'IconTexture'];
					
					itemButton:SetNormalTexture(nil);
					
					F:StyleButton(itemButton);
					F:CreateBD(itemButton, .25);
					
					itemButtonIcon:SetTexCoord(unpack(TexCoords));
					itemButtonIcon:SetPoint('TOPLEFT', 1, -1);
					itemButtonIcon:SetPoint('BOTTOMRIGHT', -1, 1);
					
					_G['ContainerFrame'..i..'Item'..k..'IconQuestTexture']:SetAlpha(0);
				end
			end
			
			F:ReskinClose(containerFrameClose, 'TOPRIGHT', containerFrame, 'TOPRIGHT', -8, -8);
		end
	end
	
	hooksecurefunc('ContainerFrame_Update', function(self)
		local id = self:GetID();
		local name = self:GetName();
		local itemButton;
		local texture, itemCount, locked, quality;
		
		for i = 1, self.size, 1 do
			itemButton = _G[name..'Item'..i];
			
			texture, itemCount, locked, quality = GetContainerItemInfo(id, itemButton:GetID());
			isQuestItem, questId, isActive = GetContainerItemQuestInfo(id, itemButton:GetID());
			
			if(quality) then
				if(quality >= ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
					itemButton:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b);
				else
					itemButton:SetBackdropBorderColor(0, 0, 0);
				end
			else
				itemButton:SetBackdropBorderColor(0, 0, 0);
			end
			
			if(questId and not isActive) then
				itemButton:SetBackdropBorderColor(1, 0, 0);
			elseif(questId or isQuestItem) then
				itemButton:SetBackdropBorderColor(1, 0, 0);
			end
		end
	end);
end);