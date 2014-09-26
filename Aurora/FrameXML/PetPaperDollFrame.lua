local _G = getfenv(0);
local unpack = unpack;
local select = select;

local F, C = unpack(select(2, ...));

local TexCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	for i = 2, 5 do
		select(i, PetPaperDollFrame:GetRegions()):SetTexture(nil);
	end
	
	for i = 1, 2 do
		select(i, PetPaperDollFrameExpBar:GetRegions()):SetTexture(nil);
	end
	
	PetPaperDollFrameExpBar:SetStatusBarTexture(C.Media.Backdrop);
	F:CreateBDFrame(PetPaperDollFrameExpBar, .25);
	
	F:ReskinArrow(PetModelFrameRotateLeftButton, 'Left');
	F:ReskinArrow(PetModelFrameRotateRightButton, 'Right');
	
	F:Reskin(PetPaperDollCloseButton);
	
	PetAttributesFrame:DisableDrawLayer('BACKGROUND');
	
	F:CreateBDFrame(PetResistanceFrame);
	PetResistanceFrame:SetSize(28, 140);
	
	PetMagicResFrame1:SetSize(28, 28);
	select(1, PetMagicResFrame1:GetRegions()):SetTexCoord(0.21875, 0.78125, 0.25, 0.3203125);
	PetMagicResFrame2:SetSize(28, 28);
	select(1, PetMagicResFrame2:GetRegions()):SetTexCoord(0.21875, 0.78125, 0.0234375, 0.09375);
	PetMagicResFrame3:SetSize(28, 28);
	select(1, PetMagicResFrame3:GetRegions()):SetTexCoord(0.21875, 0.78125, 0.13671875, 0.20703125);
	PetMagicResFrame4:SetSize(28, 28);
	select(1, PetMagicResFrame4:GetRegions()):SetTexCoord(0.21875, 0.78125, 0.36328125, 0.43359375);
	PetMagicResFrame5:SetSize(28, 28);
	select(1, PetMagicResFrame5:GetRegions()):SetTexCoord(0.21875, 0.78125, 0.4765625, 0.546875);
	
	for i = 1, 2 do
		select(i, PetPaperDollFrameCompanionFrame:GetRegions()):SetTexture(nil);
	end
	
	F:ReskinArrow(CompanionModelFrameRotateLeftButton, 'Left');
	F:ReskinArrow(CompanionModelFrameRotateRightButton, 'Right');
	
	F:Reskin(CompanionSummonButton);
	
	do
		local button;
		
		for i = 1, NUM_COMPANIONS_PER_PAGE do
			button = _G['CompanionButton'..i];
			
			F:StyleButton(button, nil, true);
			button.Hover:SetAllPoints();
			button.Checked:SetAllPoints();
			
			button.background = F:CreateBG(button);
			
			_G['CompanionButton'..i..'ActiveTexture']:SetTexture(1, 1, 1, .25);
		end
	end
	
	CompanionPrevPageButton:SetPoint('BOTTOMLEFT', 123, 91);
	F:ReskinArrow(CompanionPrevPageButton, 'Left');
    F:ReskinArrow(CompanionNextPageButton, 'Right');
	
	do
		local tab;
		
		for i = 1, 3 do
			tab = _G['PetPaperDollFrameTab'..i];
			
			tab:DisableDrawLayer('BACKGROUND');
			
			tab:SetHighlightTexture(nil);
		end
	end
	
	hooksecurefunc('PetPaperDollFrame_UpdateCompanions', function()
		local button, iconTexture;
		
		for i = 1, NUM_COMPANIONS_PER_PAGE do
			button = _G['CompanionButton'..i];
			iconTexture = button:GetNormalTexture();
		
			button:SetDisabledTexture('');
			
			if(button.creatureID) then
				button.background:Show();
				
				iconTexture:SetTexCoord(unpack(TexCoords));
			else
				button.background:Hide();
			end
		end
	end);
end);