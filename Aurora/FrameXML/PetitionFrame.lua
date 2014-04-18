local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.Modules['Aurora'], function()
	F.SetBD(PetitionFrame, 15, -19, -30, 68);
	
	PetitionFramePortrait:Hide();
	
	PetitionFrameCharterTitle:SetTextColor(1, 1, 1);
	PetitionFrameCharterTitle:SetShadowColor(0, 0, 0);
	PetitionFrameCharterName:SetTextColor(1, 1, 1);
	PetitionFrameMasterTitle:SetTextColor(1, 1, 1);
	PetitionFrameMasterTitle:SetShadowColor(0, 0, 0);
	PetitionFrameMasterName:SetTextColor(1, 1, 1);
	PetitionFrameMemberTitle:SetTextColor(1, 1, 1);
	PetitionFrameMemberTitle:SetShadowColor(0, 0, 0);
	
	for i = 1, 9 do
		local Name = _G['PetitionFrameMemberName'..i];
		
		Name:SetTextColor(1, 1, 1);
	end
	
	PetitionFrameInstructions:SetTextColor(1, 1, 1);
	
	F.Reskin(PetitionFrameCancelButton);
	F.Reskin(PetitionFrameSignButton);
	F.Reskin(PetitionFrameRequestButton);
	
	F.ReskinClose(PetitionFrameCloseButton, 'TOPRIGHT', PetitionFrame, 'TOPRIGHT', -34, -23);
	
	F.Reskin(PetitionFrameRenameButton);
end);