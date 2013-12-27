local F, C = unpack(select(2, ...));

local _G = getfenv(0);

C.modules['Blizzard_MacroUI'] = function()
	F.StripTextures(MacroFrame);
	F.SetBD(_G['MacroFrame'], 10, -11, -32, 71);
	
	F.ReskinClose(MacroFrameCloseButton, 'TOPRIGHT', MailFrame, 'TOPRIGHT', -36, -15);
	
	for i = 1, 2 do
		Tab = _G['MacroFrameTab'..i];
		
		F.StripTextures(Tab);
	end
	
	F.ReskinScroll(MacroFrameScrollFrameScrollBar);
	
	for i = 1, MAX_ACCOUNT_MACROS do
		local Button = _G['MacroButton'..i];
		local Icon = _G['MacroButton'..i..'Icon'];
		
		if Button then
			F.StripTextures(Button);
			F.StyleButton(Button, nil, true);
			F.CreateBD(Button, .25);
		end
		
		if Icon then
			Icon:SetPoint('TOPLEFT', 1, -1);
			Icon:SetPoint('BOTTOMRIGHT', -1, 1);
			Icon:SetTexCoord(unpack(F.TexCoords));
		end
	end
	
	local SelectedButton = MacroFrameSelectedMacroButton;
	local SelectedButtonIcon = MacroFrameSelectedMacroButtonIcon;
	
	F.StripTextures(MacroFrameSelectedMacroButton);
	F.StyleButton(SelectedButton, nil, true);
	F.CreateBD(SelectedButton);
	SelectedButton:GetNormalTexture():SetTexture(nil);
	
	SelectedButtonIcon:SetPoint("TOPLEFT", 1, -1);
	SelectedButtonIcon:SetPoint("BOTTOMRIGHT", -1, 1);
	SelectedButtonIcon:SetTexCoord(unpack(F.TexCoords));
	
	F.Reskin(MacroEditButton);
	
	F.CreateBD(MacroFrameTextBackground, .25);
	
	F.StripTextures(MacroButtonScrollFrame);
	F.ReskinScroll(MacroButtonScrollFrameScrollBar);
	
	F.Reskin(MacroDeleteButton);
	
	_G['MacroFrameCharLimitText']:ClearAllPoints();
	_G['MacroFrameCharLimitText']:SetPoint('BOTTOM', MacroFrameTextBackground, -40, -30);
	
	F.Reskin(MacroNewButton);
	F.Reskin(MacroExitButton);
	
	F.StripTextures(MacroPopupFrame);
	F.SetBD(MacroPopupFrame, 7, -10, -5, 7);
	
	_G['MacroPopupNameLeft']:SetTexture(nil);
	_G['MacroPopupNameMiddle']:SetTexture(nil);
	_G['MacroPopupNameRight']:SetTexture(nil);
	F.ReskinInput(MacroPopupEditBox);
	
	for i = 1, MAX_ACCOUNT_MACROS do
		local Button = _G['MacroPopupButton'..i];
		local Icon = _G['MacroPopupButton'..i..'Icon'];

		if Button then
			F.StripTextures(Button);
			F.StyleButton(Button, nil, true);
			F.CreateBD(Button, .25);
		end
		
		if Icon then
			Icon:SetPoint('TOPLEFT', 1, -1);
			Icon:SetPoint('BOTTOMRIGHT', -1, 1);
			Icon:SetTexCoord(.08, .92, .08, .92);
		end
	end
	
	F.StripTextures(MacroPopupScrollFrame);
	F.ReskinScroll(MacroPopupScrollFrameScrollBar);
	
	F.Reskin(MacroPopupOkayButton);
	F.Reskin(MacroPopupCancelButton);
end