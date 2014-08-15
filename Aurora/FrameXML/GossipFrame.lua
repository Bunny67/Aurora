local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local select = select;
local find = string.find;
local gsub = string.gsub;
local tinsert = table.insert;

tinsert(C.Modules['Aurora'], function()
	F:SetBD(GossipFrame, 14, -18, -30, 67);
	GossipFramePortrait:Hide();
	
	F:ReskinClose(GossipFrameCloseButton, 'TOPRIGHT', GossipFrame, 'TOPRIGHT', -34, -22);
	
	GossipFrameGreetingPanel:DisableDrawLayer('BACKGROUND');
	GossipFrameGreetingPanel:DisableDrawLayer('BORDER');
	GossipFrameGreetingPanel:DisableDrawLayer('ARTWORK');
	
	F:Reskin(GossipFrameGreetingGoodbyeButton);
	
	F:ReskinScroll(GossipGreetingScrollFrameScrollBar);
	
	GossipGreetingText:SetTextColor(1, 1, 1);
	
	do
		local Button;
		
		for i = 1, NUMGOSSIPBUTTONS do
			Button = select(3, _G['GossipTitleButton'..i]:GetRegions());
			
			Button:SetTextColor(1, 1, 1);
		end
	end
	
	hooksecurefunc('GossipFrameUpdate', function()
		local Button;
		
		for i = 1, NUMGOSSIPBUTTONS do
			Button = _G['GossipTitleButton' .. i];
			
			if(Button:GetFontString()) then
				if(Button:GetFontString():GetText() and Button:GetFontString():GetText():find('|cff000000')) then
					Button:GetFontString():SetText(gsub(Button:GetFontString():GetText(), '|cff000000', '|cffFFFF00'));
				end
			end
		end
	end);
end);