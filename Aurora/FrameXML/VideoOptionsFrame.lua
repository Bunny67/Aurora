local F, C = unpack(select(2, ...));

local select = select;
local tinsert = table.insert;

tinsert(C.Modules['Aurora'], function()
	F.CreateBD(VideoOptionsFrame);
	VideoOptionsFrameHeader:SetTexture(nil);
	
	F.CreateBD(VideoOptionsFrameCategoryFrame, .25);
	
	for i = 1, 8 do
		select(i, VideoOptionsFrameCategoryFrame:GetRegions()):SetTexture(nil);
	end
	
	F.CreateBD(VideoOptionsFramePanelContainer, .25);
	
	F.Reskin(VideoOptionsFrameApply);
	F.Reskin(VideoOptionsFrameCancel);
	VideoOptionsFrameCancel:SetPoint('BOTTOMRIGHT', VideoOptionsFrameApply, 'BOTTOMLEFT', -1, 0);
	F.Reskin(VideoOptionsFrameOkay);
	VideoOptionsFrameOkay:SetPoint('BOTTOMRIGHT', VideoOptionsFrameCancel, 'BOTTOMLEFT', -1, 0);
	F.Reskin(VideoOptionsFrameDefaults);
end);