local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	F:SetBD(TabardFrame, 11, -12, -34, 74);
	TabardFramePortrait:Hide();
	
	TabardFrame:DisableDrawLayer('BORDER');
	
	TabardFrameBackground:SetTexture(nil);
	
	for i = 7, 20 do
		select(i, TabardFrame:GetRegions()):SetTexture(nil);
	end
	
	F:ReskinClose(TabardFrameCloseButton, 'TOPRIGHT', TabardFrame, 'TOPRIGHT', -38, -16);
	
	F:CreateBD(TabardFrameCostFrame, .25);
	
	TabardFrameCustomizationBorder:SetTexture(nil);
	
	do
		local Button, LeftButton, RightButton;
		
		for i = 1, 5 do
			Button = _G['TabardFrameCustomization'..i];
			LeftButton = _G['TabardFrameCustomization'..i..'LeftButton'];
			RightButton = _G['TabardFrameCustomization'..i..'RightButton'];
			
			_G['TabardFrameCustomization'..i..'Left']:SetTexture(nil);
			_G['TabardFrameCustomization'..i..'Middle']:SetTexture(nil);
			_G['TabardFrameCustomization'..i..'Right']:SetTexture(nil);
			
			F:ReskinArrow(LeftButton, 'Left');
			F:ReskinArrow(RightButton, 'Right');
		end
	end
	
	F:ReskinArrow(TabardCharacterModelRotateLeftButton, 'Left');
	TabardCharacterModelRotateLeftButton:SetPoint('BOTTOMLEFT', 4, 4);
	F:ReskinArrow(TabardCharacterModelRotateRightButton, 'Right');
	TabardCharacterModelRotateRightButton:SetPoint('TOPLEFT', TabardCharacterModelRotateLeftButton, 'TOPRIGHT', 4, 0);
	
	F:Reskin(TabardFrameAcceptButton);
	F:Reskin(TabardFrameCancelButton);
end);