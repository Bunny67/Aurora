local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

local TexCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	-- TokenFrame;
	TokenFrame:DisableDrawLayer('ARTWORK');
	
	F:ReskinScroll(TokenFrameContainerScrollBar);
	
	F:Reskin(TokenFrameCancelButton);
	-- TokenFramePopup;
	F:CreateBD(TokenFramePopup);
	TokenFramePopupCorner:SetTexture(nil);
	
	F:ReskinCheck(TokenFramePopupInactiveCheckBox);
	F:ReskinCheck(TokenFramePopupBackpackCheckBox);
	
	F:ReskinClose(TokenFramePopupCloseButton);
	-- BackpackTokenFrame;
	BackpackTokenFrame:DisableDrawLayer('BACKGROUND');
	
	do
		local watchButton;
		
		for i = 1, MAX_WATCHED_TOKENS do
			watchButton = _G['BackpackTokenFrameToken'..i];
			
			watchButton.icon:SetTexCoord(unpack(TexCoords));
		end
	end
	
	select(4, TokenFrame:GetChildren()):Hide();
	
	hooksecurefunc('TokenFrame_Update', function()
		local scrollFrame = TokenFrameContainer;
		local offset = HybridScrollFrame_GetOffset(scrollFrame);
		local buttons = scrollFrame.buttons;
		local numButtons = #buttons;
		local name, isHeader, extraCurrencyType, icon, itemID;
		local button, index;
		
		for i = 1, numButtons do
			index = offset+i;
			name, isHeader, isExpanded, _, _, _, extraCurrencyType, icon, itemID = GetCurrencyListInfo(index);

			button = buttons[i];
			if(name or name == '') then
				button.categoryLeft:Hide();
				button.categoryRight:Hide();
				button.highlight:Hide();
				
				button.expandIcon:SetTexture(nil);
				
				if(not button.bg) then
					button.bg = F:CreateBG(button.icon);
					
					local Minus = button:CreateTexture(nil, 'OVERLAY');
					Minus:SetSize(7, 1);
					Minus:SetPoint('LEFT', 8, 0);
					Minus:SetTexture(C.Media.Backdrop);
					Minus:SetVertexColor(1, 1, 1);
					Minus:Hide();
					button.Minus = Minus;
					
					local Plus = button:CreateTexture(nil, 'OVERLAY');
					Plus:SetSize(1, 7);
					Plus:SetPoint('LEFT', 11, 0);
					Plus:SetTexture(C.Media.Backdrop);
					Plus:SetVertexColor(1, 1, 1);
					Plus:Hide();
					button.Plus = Plus;
				end
				
				if(not isHeader) then
					button.bg:Show();
					button.Plus:Hide();
					button.Minus:Hide();
					
					if(extraCurrencyType == 1) then
						button.icon:SetTexCoord(unpack(TexCoords));
					elseif(extraCurrencyType == 2) then
						local factionGroup = UnitFactionGroup('player');
						if ( factionGroup ) then
							button.icon:SetTexture('Interface\\TargetingFrame\\UI-PVP-'..factionGroup);
							button.icon:SetTexCoord(0.03125, 0.59375, 0.03125, 0.59375);
						else
							button.icon:SetTexCoord(unpack(TexCoords));
						end
					else
						button.icon:SetTexture(icon);
						button.icon:SetTexCoord(unpack(TexCoords));
					end
				else
					button.bg:Hide();
					button.Minus:Show();
					
					if(not isExpanded) then
						button.Plus:Show();
					else
						button.Plus:Hide();
					end
				end
			end
		end
	end);
end);