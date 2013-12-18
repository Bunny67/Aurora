local F, C = unpack(select(2, ...));

local _G = getfenv(0);

C.modules['Blizzard_MacroUI'] = function()
	F.StripTextures(_G['MacroFrame']);
	F.SetBD(_G['MacroFrame'], 10, -11, -32, 71);
	
	F.ReskinClose(_G['MacroFrameCloseButton'], 'TOPRIGHT', MailFrame, 'TOPRIGHT', -36, -15);
	
	for i = 1, 2 do
		Tab = _G['MacroFrameTab'..i];
		F.StripTextures(Tab);
	end
	
	F.ReskinScroll(_G['MacroFrameScrollFrameScrollBar']);
	
	for i = 1, MAX_ACCOUNT_MACROS do
		local Button = _G['MacroButton'..i];
		local Icon = _G['MacroButton'..i..'Icon'];
		
		if Button then
			F.StripTextures(Button);
			F.StyleButton(Button, nil, true);
			F.CreateBD(Button);
		end
		
		if Icon then
			Icon:SetPoint('TOPLEFT', 1, -1);
			Icon:SetPoint('BOTTOMRIGHT', -1, 1);
			Icon:SetTexCoord(unpack(F.TexCoords));
		end
	end
	
	local SelectedButton = _G['MacroFrameSelectedMacroButton'];
	local SelectedButtonIcon = _G['MacroFrameSelectedMacroButtonIcon'];
	
	F.StripTextures(MacroFrameSelectedMacroButton);
	F.StyleButton(SelectedButton, nil, true);
	F.CreateBD(SelectedButton);
	SelectedButton:GetNormalTexture():SetTexture(nil);
	
	SelectedButtonIcon:SetPoint("TOPLEFT", 1, -1);
	SelectedButtonIcon:SetPoint("BOTTOMRIGHT", -1, 1);
	SelectedButtonIcon:SetTexCoord(unpack(F.TexCoords));
	
	F.Reskin(_G['MacroEditButton']);
	
	F.CreateBD(_G['MacroFrameTextBackground']);
	
	F.StripTextures(_G['MacroButtonScrollFrame']);
	F.ReskinScroll(_G['MacroButtonScrollFrameScrollBar']);
	
	F.Reskin(_G['MacroDeleteButton']);
	
	_G['MacroFrameCharLimitText']:ClearAllPoints();
	_G['MacroFrameCharLimitText']:SetPoint('BOTTOM', MacroFrameTextBackground, -40, -30);
	
	F.Reskin(_G['MacroNewButton']);
	F.Reskin(_G['MacroExitButton']);
	
	F.StripTextures(_G['MacroPopupFrame']);
	F.SetBD(_G['MacroPopupFrame'], 7, -10, -5, 7);
	
	_G['MacroPopupNameLeft']:SetTexture(nil);
	_G['MacroPopupNameMiddle']:SetTexture(nil);
	_G['MacroPopupNameRight']:SetTexture(nil);
	F.ReskinInput(_G['MacroPopupEditBox']);
	
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
	
	F.StripTextures(_G['MacroPopupScrollFrame']);
	F.ReskinScroll(_G['MacroPopupScrollFrameScrollBar']);
	
	F.Reskin(_G['MacroPopupOkayButton']);
	F.Reskin(_G['MacroPopupCancelButton']);
end