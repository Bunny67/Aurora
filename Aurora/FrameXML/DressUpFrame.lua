local F, C = unpack(select(2, ...));

local select = select;
local tinsert = table.insert;

tinsert(C.Modules['Aurora'], function()
	F.SetBD(DressUpFrame, 11, -12, -34, 73);
	DressUpFramePortrait:Hide();
	
	for i = 2, 5 do
		select(i, DressUpFrame:GetRegions()):SetTexture(nil);
	end
	
	DressUpBackgroundTopLeft:SetTexture(nil);
	DressUpBackgroundTopRight:SetTexture(nil);
	DressUpBackgroundBotLeft:SetTexture(nil);
	DressUpBackgroundBotRight:SetTexture(nil);
	
	F.ReskinClose(DressUpFrameCloseButton, 'TOPRIGHT', DressUpFrame, 'TOPRIGHT', -38, -16);
	
	F.ReskinArrow(DressUpModelRotateLeftButton, 'Left');
	DressUpModelRotateRightButton:SetPoint('TOPLEFT', DressUpModelRotateLeftButton, 'TOPRIGHT', -1, 0);
	F.ReskinArrow(DressUpModelRotateRightButton, 'Right');
	
	F.Reskin(DressUpFrameCancelButton);
	DressUpFrameResetButton:SetPoint('RIGHT', DressUpFrameCancelButton, 'LEFT', -1, 0);
	F.Reskin(DressUpFrameResetButton);
end);