local F, C = unpack(select(2, ...));

local tinsert = table.insert;

local Noop = F.dummy;

tinsert(C.Modules['Aurora'], function()
	F:SetBD(ItemTextFrame, 13, -13, -32, 74);
	
	ItemTextFrame:DisableDrawLayer('BACKGROUND');
	ItemTextFrame:DisableDrawLayer('BORDER');
	ItemTextFrame:DisableDrawLayer('ARTWORK');
	
	ItemTextScrollFrameMiddle:SetAlpha(0);
	ItemTextScrollFrameTop:SetAlpha(0);
	ItemTextScrollFrameBottom:SetAlpha(0);
	
	F:ReskinScroll(ItemTextScrollFrameScrollBar);
	
	ItemTextPageText:SetTextColor(1, 1, 1);
	ItemTextPageText.SetTextColor = Noop;
	
	F:ReskinArrow(ItemTextPrevPageButton, 'Left');
	F:ReskinArrow(ItemTextNextPageButton, 'Right');
	
	F:ReskinClose(ItemTextCloseButton, 'TOPRIGHT', ItemTextFrame, 'TOPRIGHT', -36, -17);
end);