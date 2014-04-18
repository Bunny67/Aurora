local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.Modules['Aurora'], function()
	F.StripTextures(ReputationFrame, true);

	local function UpdateFactionSkins()
		for i = 1, GetNumFactions() do
			local ReputationBar = _G["ReputationBar"..i.."ReputationBar"];

			if ReputationBar then
				ReputationBar:SetStatusBarTexture(C.Media.Backdrop);

				if not ReputationBar.Skins then
					F.CreateBD(ReputationBar, .25);
					
					ReputationBar.Skins = true;
				end

				_G['ReputationBar'..i..'Background']:SetTexture(nil);
				_G['ReputationBar'..i..'ReputationBarHighlight1']:SetTexture(nil);
				_G['ReputationBar'..i..'ReputationBarHighlight2']:SetTexture(nil);
				_G['ReputationBar'..i..'ReputationBarAtWarHighlight1']:SetTexture(nil);
				_G['ReputationBar'..i..'ReputationBarAtWarHighlight2']:SetTexture(nil);
				_G['ReputationBar'..i..'ReputationBarLeftTexture']:SetTexture(nil);
				_G['ReputationBar'..i..'ReputationBarRightTexture']:SetTexture(nil);
			end
		end
	end

	ReputationFrame:HookScript('OnShow', UpdateFactionSkins);
	ReputationFrame:HookScript('OnEvent', UpdateFactionSkins);

	for i = 1, NUM_FACTIONS_DISPLAYED do
		local Button = _G['ReputationBar'..i..'ExpandOrCollapseButton'];
		
		F.ReskinExpandOrCollapse(Button);
	end

	hooksecurefunc('ReputationFrame_Update', function()
		local numFactions = GetNumFactions();
		local factionIndex, factionButton, isCollapsed;
		local factionOffset = FauxScrollFrame_GetOffset(ReputationListScrollFrame)

		for i = 1, NUM_FACTIONS_DISPLAYED do
			factionIndex = factionOffset + i;
			factionButton = _G['ReputationBar'..i..'ExpandOrCollapseButton'];

			if factionIndex <= numFactions then
				_, _, _, _, _, _, _, _, _, isCollapsed = GetFactionInfo(factionIndex);
				if isCollapsed then
					factionButton.Plus:Show();
				else
					factionButton.Plus:Hide();
				end
			end
		end
	end)
	
	F.StripTextures(ReputationListScrollFrame);
	F.ReskinScroll(ReputationListScrollFrameScrollBar);
	
	F.StripTextures(ReputationDetailFrame);
	F.CreateBD(ReputationDetailFrame);
	
	F.ReskinClose(ReputationDetailCloseButton);
	
	F.ReskinCheck(ReputationDetailAtWarCheckBox);
	F.ReskinCheck(ReputationDetailInactiveCheckBox);
	F.ReskinCheck(ReputationDetailMainScreenCheckBox);
end);