local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.StripTextures(TabardFrame);
	F.Kill(TabardFramePortrait);
	F.SetBD(TabardFrame, 10, -12, -32, 74);
	
	F.ReskinClose(TabardFrameCloseButton, 'TOPRIGHT', TradeSkillFrame, 'TOPRIGHT', -36, -16);
	
	F.CreateBD(TabardFrameCostFrame, .25);
	
	F.StripTextures(TabardFrameCustomizationFrame);
	
	for i = 1, 5 do
		local Button = _G['TabardFrameCustomization'..i];
		local LeftButton = _G['TabardFrameCustomization'..i..'LeftButton'];
		local RightButton = _G['TabardFrameCustomization'..i..'RightButton'];
		
		F.StripTextures(Button);
		
		F.ReskinArrow(LeftButton, 'left');
		F.ReskinArrow(RightButton, 'right');
	end
	
	F.ReskinArrow(TabardCharacterModelRotateLeftButton, 'left');
	TabardCharacterModelRotateLeftButton:SetPoint('BOTTOMLEFT', 4, 4);
	F.ReskinArrow(TabardCharacterModelRotateRightButton, 'right');
	TabardCharacterModelRotateRightButton:SetPoint('TOPLEFT', TabardCharacterModelRotateLeftButton, 'TOPRIGHT', 4, 0);
	
	F.Reskin(TabardFrameAcceptButton);
	F.Reskin(TabardFrameCancelButton);
end)