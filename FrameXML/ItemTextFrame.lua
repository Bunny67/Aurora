local F, C = unpack(select(2, ...))

tinsert(C.modules["Aurora"], function()
	local AllItemTextFrameStripTextures = {'ItemTextFrame', 'ItemTextScrollFrame'}
	for i = 1, #AllItemTextFrameStripTextures do
	local AllItemTextFrameStripTexture = _G[AllItemTextFrameStripTextures[i]]
		if AllItemTextFrameStripTexture then
			F.StripTextures(AllItemTextFrameStripTexture)
		else
			print('Ошибка Aurora: '..AllItemTextFrameStripTextures[i]..' не был найден.')
		end
	end

	local AllItemTextFrameScrollbars = {'ItemTextScrollFrameScrollBar'}
	for i = 1, #AllItemTextFrameScrollbars do
		local AllItemTextFrameScrollbar = _G[AllItemTextFrameScrollbars[i]]
		if AllItemTextFrameScrollbar then
			F.ReskinScroll(AllItemTextFrameScrollbar)
		else
			print('Ошибка Aurora: '..AllItemTextFrameScrollbars[i]..' не был найден.')
		end
	end

	ItemTextPageText:SetTextColor(1, 1, 1)
	ItemTextPageText.SetTextColor = F.dummy
	
	F.SetBD(ItemTextFrame, 16, -12, -34, 74)
	F.ReskinClose(ItemTextCloseButton, 'TOPRIGHT', ItemTextFrame, 'TOPRIGHT', -38, -16)
	F.ReskinArrow(ItemTextPrevPageButton, 'left')
	F.ReskinArrow(ItemTextNextPageButton, 'right')
end)