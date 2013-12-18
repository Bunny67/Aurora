local F, C = unpack(select(2, ...))

C.modules["Blizzard_MacroUI"] = function()
	local AllMacroUIStripTextures = {'MacroFrame', 'MacroFrameTab1', 'MacroFrameTab2', 'MacroFrameSelectedMacroButton', 'MacroFrameTextBackground', 'MacroButtonScrollFrame', 'MacroPopupFrame', 'MacroPopupScrollFrame'}
	for i = 1, #AllMacroUIStripTextures do
		F.StripTextures(_G[AllMacroUIStripTextures[i]])
	end
	
	MacroPopupNameLeft:SetTexture(nil)
	MacroPopupNameMiddle:SetTexture(nil)
	MacroPopupNameRight:SetTexture(nil)

	local AllMacroUIScrollbars = {'MacroFrameScrollFrameScrollBar', 'MacroButtonScrollFrameScrollBar', 'MacroPopupScrollFrameScrollBar'}
	for i = 1, #AllMacroUIScrollbars do
		F.ReskinScroll(_G[AllMacroUIScrollbars[i]])
	end

	local AllMacroUIButtons = {'MacroFrameTab1', 'MacroFrameTab2', 'MacroDeleteButton', 'MacroNewButton', 'MacroExitButton', 'MacroEditButton', 'MacroPopupOkayButton', 'MacroPopupCancelButton'}
	for i = 1, #AllMacroUIButtons do
		F.Reskin(_G[AllMacroUIButtons[i]])
	end

	for i = 1, 2 do
		tab = _G[format("MacroFrameTab%s", i)]
		tab:SetHeight(20)
	end
	
	MacroFrameTab1:SetPoint("TOPLEFT", MacroFrame, "TOPLEFT", 85, -39)
	MacroFrameTab2:SetPoint("LEFT", MacroFrameTab1, "RIGHT", 4, 0)

	F.StyleButton(MacroFrameSelectedMacroButton)
	MacroFrameSelectedMacroButton:GetNormalTexture():SetTexture(nil)
	F.CreateBD(MacroFrameSelectedMacroButton, .25)
	MacroFrameSelectedMacroButtonIcon:SetTexCoord(.08, .92, .08, .92)
	MacroFrameSelectedMacroButtonIcon:SetPoint("BOTTOMRIGHT", -1, 1)
	MacroFrameSelectedMacroButtonIcon:SetPoint("TOPLEFT", 1, -1)
	
	for i = 1, MAX_ACCOUNT_MACROS do
		local b = _G["MacroButton"..i]
		local t = _G["MacroButton"..i.."Icon"]
		local pb = _G["MacroPopupButton"..i]
		local pt = _G["MacroPopupButton"..i.."Icon"]
		
		if b then
			F.StripTextures(b)
			F.StyleButton(b, nil, true)
			F.CreateBD(b, .25)
		end
		
		if t then
			t:SetTexCoord(.08, .92, .08, .92)
			t:SetPoint("BOTTOMRIGHT", -1, 1)
			t:SetPoint("TOPLEFT", 1, -1)
		end

		if pb then
			F.StripTextures(pb)
			F.StyleButton(pb, nil, true)
			F.CreateBD(pb, .25)
		end
		
		if pt then
			pt:SetTexCoord(.08, .92, .08, .92)
			pt:SetPoint("BOTTOMRIGHT", -1, 1)
			pt:SetPoint("TOPLEFT", 1, -1)
		end
	end
	
	F.ReskinInput(_G['MacroPopupEditBox'])
	
	MacroFrameCharLimitText:ClearAllPoints()
	MacroFrameCharLimitText:SetPoint("BOTTOM", MacroFrameTextBackground, -40, -30)
	
	F.SetBD(MacroFrame, 10, -11, -32, 71)
	F.ReskinClose(MacroFrameCloseButton, 'TOPRIGHT', MailFrame, 'TOPRIGHT', -36, -15)
	F.CreateBD(MacroFrameTextBackground, .25)
	F.CreateBD(MacroPopupFrame)
	MacroPopupFrame:SetPoint("TOPLEFT", MacroFrame, "TOPRIGHT", -30, -14)
end