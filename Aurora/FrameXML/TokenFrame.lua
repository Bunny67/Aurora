local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.StripTextures(TokenFrame, true);
	
	hooksecurefunc('TokenFrame_Update', function()
		local scrollFrame = TokenFrameContainer;
		local offset = HybridScrollFrame_GetOffset(scrollFrame);
		local buttons = scrollFrame.buttons;
		local numButtons = #buttons;
		local name, isHeader, extraCurrencyType, icon, itemID;
		local button, index;
		
		for i = 1, numButtons do
			index = offset+i;
			name, isHeader, _, _, _, _, extraCurrencyType, icon, itemID = GetCurrencyListInfo(index);

			button = buttons[i];
			if name or name == "" then
				F.Kill(button.categoryLeft);
				F.Kill(button.categoryRight);
				F.Kill(button.highlight);
				
				if ( not isHeader ) then
					if ( extraCurrencyType == 1 ) then
						button.icon:SetTexCoord(unpack(F.TexCoords));
					elseif ( extraCurrencyType == 2 ) then
						local factionGroup = UnitFactionGroup('player');
						if ( factionGroup ) then
							button.icon:SetTexture("Interface\\TargetingFrame\\UI-PVP-"..factionGroup);
							button.icon:SetTexCoord( 0.03125, 0.59375, 0.03125, 0.59375 );
						else
							button.icon:SetTexCoord(unpack(F.TexCoords));
						end
					else
						button.icon:SetTexture(icon);
						button.icon:SetTexCoord(unpack(F.TexCoords));
					end
				end
			end
		end
	end)
	
	F.ReskinScroll(TokenFrameContainerScrollBar);
	
	F.Reskin(TokenFrameCancelButton);
	
	F.StripTextures(TokenFramePopup);
	F.CreateBD(TokenFramePopup);
	
	F.ReskinClose(TokenFramePopupCloseButton);
	
	F.ReskinCheck(TokenFramePopupInactiveCheckBox);
	F.ReskinCheck(TokenFramePopupBackpackCheckBox);
end)