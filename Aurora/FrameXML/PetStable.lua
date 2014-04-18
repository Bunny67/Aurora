local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;

local TexCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	F.SetBD(PetStableFrame, 11, -11, -34, 76);
	PetStableFramePortrait:Hide();
	
	for i = 2, 5 do
		select(i, PetStableFrame:GetRegions()):Hide();
	end
	
	F.ReskinArrow(PetStableModelRotateLeftButton, 'Left');
	PetStableModelRotateRightButton:SetPoint('TOPLEFT', PetStableModelRotateLeftButton, 'TOPRIGHT', -1, 0);
	F.ReskinArrow(PetStableModelRotateRightButton, 'Right');
	
	PetStableCurrentPet:SetNormalTexture('');
	F.StyleButton(PetStableCurrentPet);
	F.CreateBD(PetStableCurrentPet, .25);
	
	PetStableCurrentPetIconTexture:SetTexCoord(unpack(F.TexCoords));
	PetStableCurrentPetBackground:Hide();
	
	for i = 1, NUM_PET_STABLE_SLOTS do
		local Button = _G['PetStableStabledPet'..i];
		local ButtonIconTexture = _G['PetStableStabledPet'..i..'IconTexture'];
		local ButtonBackground = _G['PetStableStabledPet'..i..'Background'];
		
		Button:SetNormalTexture('');
		F.StyleButton(Button);
		F.CreateBD(Button, .25);
		
		ButtonIconTexture:SetTexCoord(unpack(F.TexCoords));
		
		ButtonBackground:Hide();
	end
	
	F.Reskin(PetStablePurchaseButton);
	
	F.ReskinClose(PetStableFrameCloseButton, 'TOPRIGHT', PetStableFrame, 'TOPRIGHT', -38, -15);
end);