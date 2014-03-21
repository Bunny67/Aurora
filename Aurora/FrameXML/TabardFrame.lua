local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.SetBD(TabardFrame, 11, -12, -34, 74);
	
	TabardFramePortrait:Hide();
	
	F.ReskinClose(TabardFrameCloseButton, 'TOPRIGHT', TabardFrame, 'TOPRIGHT', -38, -16);
	
	F.CreateBD(TabardFrameCostFrame, .25);
	
	TabardFrameCustomizationBorder:Hide();
	
	for i = 1, 5 do
		local Button = _G['TabardFrameCustomization'..i];
		local LeftButton = _G['TabardFrameCustomization'..i..'LeftButton'];
		local RightButton = _G['TabardFrameCustomization'..i..'RightButton'];
		
		_G['TabardFrameCustomization'..i..'Left']:Hide();
		_G['TabardFrameCustomization'..i..'Middle']:Hide();
		_G['TabardFrameCustomization'..i..'Right']:Hide();
		
		F.ReskinArrow(LeftButton, 'Left');
		F.ReskinArrow(RightButton, 'Right');
	end
	
	F.ReskinArrow(TabardCharacterModelRotateLeftButton, 'Left');
	TabardCharacterModelRotateLeftButton:SetPoint('BOTTOMLEFT', 4, 4);
	F.ReskinArrow(TabardCharacterModelRotateRightButton, 'Right');
	TabardCharacterModelRotateRightButton:SetPoint('TOPLEFT', TabardCharacterModelRotateLeftButton, 'TOPRIGHT', 4, 0);
	
	F.Reskin(TabardFrameAcceptButton);
	F.Reskin(TabardFrameCancelButton);
end)