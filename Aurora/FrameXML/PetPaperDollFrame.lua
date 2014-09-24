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
	
	local PlayerStatsLeft = CreateFrame('Frame', nil, PetAttributesFrame)
	PlayerStatsLeft:SetPoint('TOPLEFT', -1, -1);
	PlayerStatsLeft:SetPoint('BOTTOMRIGHT', -116, 1);
	F:CreateBD(PlayerStatsLeft, .25);
	
	local PlayerStatsRight = CreateFrame('Frame', nil, PetAttributesFrame)
	PlayerStatsRight:SetPoint('TOPLEFT', 116, -1);
	PlayerStatsRight:SetPoint('BOTTOMRIGHT', -1, 1);
	F:CreateBD(PlayerStatsRight, .25);
	
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
	
	F:CreateBD(CompanionModelFrame, .25);
	
	CompanionModelFrameRotateLeftButton:SetPoint('TOPLEFT', PetPaperDollFrame, 39, -90);
	F:ReskinArrow(CompanionModelFrameRotateLeftButton, 'Left');
	F:ReskinArrow(CompanionModelFrameRotateRightButton, 'Right');
	
	F:Reskin(CompanionSummonButton);
	
	do
		local Button, ActiveTexture;
		
		for i = 1, NUM_COMPANIONS_PER_PAGE do
			Button = _G['CompanionButton'..i];
			ActiveTexture = _G['CompanionButton'..i..'ActiveTexture'];
			
			F:StyleButton(Button, nil, true);
			F:CreateBD(Button, .25);
			
			ActiveTexture:SetPoint('TOPLEFT', Button, 1, -1);
			ActiveTexture:SetPoint('BOTTOMRIGHT', Button, -1, 1);
			ActiveTexture:SetTexture(1, 1, 1, .25);
		end
	end
	
	CompanionPrevPageButton:SetPoint('BOTTOMLEFT', 123, 91);
	F:ReskinArrow(CompanionPrevPageButton, 'Left');
    F:ReskinArrow(CompanionNextPageButton, 'Right');
	
	do
		local Tab;
		
		for i = 1, 3 do
			Tab = _G['PetPaperDollFrameTab'..i];
			
			Tab:DisableDrawLayer('BACKGROUND');
			
			Tab:SetHighlightTexture(nil);
		end
	end
	
	hooksecurefunc('PetPaperDollFrame_UpdateCompanions', function()
		local Button, IconNormal, IconDisabled;
		
		for i = 1, NUM_COMPANIONS_PER_PAGE do
			Button = _G['CompanionButton'..i];
			IconNormal = Button:GetNormalTexture();
			IconDisabled = Button:GetDisabledTexture();
			
			if(IconNormal) then
				IconNormal:SetPoint('TOPLEFT', 1, -1);
				IconNormal:SetPoint('BOTTOMRIGHT', -1, 1);
				IconNormal:SetTexCoord(unpack(TexCoords));
			end
			
			IconDisabled:SetTexture(nil);
		end
	end);
end);