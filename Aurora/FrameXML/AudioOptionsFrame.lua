local F, C = unpack(select(2, ...));

local select = select;

tinsert(C.Modules['Aurora'], function()
	F.CreateBD(AudioOptionsFrame);
	AudioOptionsFrameHeader:SetTexture(nil);
	
	F.CreateBD(AudioOptionsFrameCategoryFrame, .25);
	
	for i = 1, 8 do
		select(i, AudioOptionsFrameCategoryFrame:GetRegions()):Hide();
	end
	
	F.CreateBD(AudioOptionsFramePanelContainer, .25);
	
	F.Reskin(AudioOptionsFrameCancel);
	F.Reskin(AudioOptionsFrameOkay);
	AudioOptionsFrameOkay:SetPoint('BOTTOMRIGHT', AudioOptionsFrameCancel, 'BOTTOMLEFT', -1, 0);
	F.Reskin(AudioOptionsFrameDefaults);
end);