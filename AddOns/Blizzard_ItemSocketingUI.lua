local F, C = unpack(select(2, ...))
-- »Õ –”—“»–Œ¬¿Õ»≈
C.modules['Blizzard_ItemSocketingUI'] = function()
	F.StripTextures(ItemSocketingFrame, true)
	F.StripTextures(ItemSocketingScrollFrame)
	
	F.ReskinScroll(ItemSocketingScrollFrameScrollBar)
	
	F.Reskin(ItemSocketingSocketButton)
	
	for i = 1, MAX_NUM_SOCKETS  do
		local button = _G['ItemSocketingSocket'..i]
		local button_bracket = _G['ItemSocketingSocket'..i..'BracketFrame']
		local button_bg = _G['ItemSocketingSocket'..i..'Background']
		local button_icon = _G['ItemSocketingSocket'..i..'IconTexture']
		F.StripTextures(button)
		F.StyleButton(button)
		F.CreateBD(button, .25)
		F.Kill(button_bracket)
		F.Kill(button_bg)
		button_icon:SetTexCoord(.08, .92, .08, .92)
		button_icon:ClearAllPoints()
		button_icon:SetPoint('TOPLEFT', 1, -1)
		button_icon:SetPoint('BOTTOMRIGHT', -1, 1)
		ItemSocketingFrame:HookScript('OnUpdate', function(self)
			gemColor = GetSocketTypes(i)
			local color = GEM_TYPE_INFO[gemColor]
			button:SetBackdropColor(color.r, color.g, color.b, 0.15)
			button:SetBackdropBorderColor(color.r, color.g, color.b)
		end)
	end
	
	F.SetBD(ItemSocketingFrame, 10, -12, -4, 31)
	F.ReskinClose(ItemSocketingCloseButton, 'TOPRIGHT', ItemSocketingFrame, 'TOPRIGHT', -8, -16)
end