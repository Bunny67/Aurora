local F, C = unpack(select(2, ...));

tinsert(C.modules['Aurora'], function()
	F.StripTextures(ItemTextFrame);
	F.SetBD(ItemTextFrame, 12, -13, -32, 74)
	
	ItemTextPageText:SetTextColor(1, 1, 1);
	ItemTextPageText.SetTextColor = F.dummy;
	
	F.StripTextures(ItemTextScrollFrame);
	F.ReskinScroll(ItemTextScrollFrameScrollBar);
	
	F.ReskinArrow(ItemTextPrevPageButton, 'left');
	F.ReskinArrow(ItemTextNextPageButton, 'right');
	
	F.ReskinClose(ItemTextCloseButton, 'TOPRIGHT', ItemTextFrame, 'TOPRIGHT', -36, -17);
end);