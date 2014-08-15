local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local select = select;

tinsert(C.Modules['Aurora'], function()
	F:SetBD(PetitionFrame, 15, -19, -30, 68);
	PetitionFramePortrait:Hide();
	
	for i = 2, 5 do
		select(i, PetitionFrame:GetRegions()):SetTexture(nil);
	end
	
	PetitionFrameCharterTitle:SetTextColor(1, 1, 1);
	PetitionFrameCharterTitle:SetShadowColor(0, 0, 0);
	PetitionFrameCharterName:SetTextColor(1, 1, 1);
	PetitionFrameMasterTitle:SetTextColor(1, 1, 1);
	PetitionFrameMasterTitle:SetShadowColor(0, 0, 0);
	PetitionFrameMasterName:SetTextColor(1, 1, 1);
	PetitionFrameMemberTitle:SetTextColor(1, 1, 1);
	PetitionFrameMemberTitle:SetShadowColor(0, 0, 0);
	
	do
		local Name;
		
		for i = 1, 9 do
			Name = _G['PetitionFrameMemberName'..i];
			
			Name:SetTextColor(1, 1, 1);
		end
	end
	
	PetitionFrameInstructions:SetTextColor(1, 1, 1);
	
	F:Reskin(PetitionFrameCancelButton);
	F:Reskin(PetitionFrameSignButton);
	F:Reskin(PetitionFrameRequestButton);
	
	F:ReskinClose(PetitionFrameCloseButton, 'TOPRIGHT', PetitionFrame, 'TOPRIGHT', -34, -23);
	
	PetitionFrameRenameButton:SetPoint('LEFT', PetitionFrameRequestButton, 'RIGHT', 1, 0);
	PetitionFrameRenameButton:SetPoint('RIGHT', PetitionFrameCancelButton, 'LEFT', -1, 0);
	F:Reskin(PetitionFrameRenameButton);
end);