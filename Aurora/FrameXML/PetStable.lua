local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

local TexCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	F:SetBD(PetStableFrame, 11, -11, -34, 76);
	PetStableFramePortrait:Hide();
	
	for i = 2, 5 do
		select(i, PetStableFrame:GetRegions()):SetTexture(nil);
	end
	
	F:ReskinArrow(PetStableModelRotateLeftButton, 'Left');
	PetStableModelRotateRightButton:SetPoint('TOPLEFT', PetStableModelRotateLeftButton, 'TOPRIGHT', -1, 0);
	F:ReskinArrow(PetStableModelRotateRightButton, 'Right');
	
	PetStableCurrentPet:SetNormalTexture(nil);
	F:StyleButton(PetStableCurrentPet);
	F:CreateBD(PetStableCurrentPet, .25);
	
	PetStableCurrentPetIconTexture:SetTexCoord(unpack(TexCoords));
	PetStableCurrentPetBackground:Hide();
	
	do
		local Button;
		local ButtonIcon, ButtonBackground;
		
		for i = 1, NUM_PET_STABLE_SLOTS do
			Button = _G['PetStableStabledPet'..i];
			ButtonIcon = _G['PetStableStabledPet'..i..'IconTexture'];
			ButtonBackground = _G['PetStableStabledPet'..i..'Background'];
			
			Button:SetNormalTexture(nil);
			F:StyleButton(Button);
			F:CreateBD(Button, .25);
			
			ButtonIcon:SetTexCoord(unpack(TexCoords));
			
			ButtonBackground:Hide();
		end
	end
	
	F:Reskin(PetStablePurchaseButton);
	
	F:ReskinClose(PetStableFrameCloseButton, 'TOPRIGHT', PetStableFrame, 'TOPRIGHT', -38, -15);
end);