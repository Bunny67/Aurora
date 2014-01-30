local F, C = unpack(select(2, ...))

local _G = getfenv(0);
local gsub = string.gsub

tinsert(C.modules['Aurora'], function()
	F.SetBD(GossipFrame, 14, -18, -30, 67);
	
	GossipFramePortrait:Hide();
	
	F.ReskinClose(GossipFrameCloseButton, 'TOPRIGHT', GossipFrame, 'TOPRIGHT', -34, -22);
	
	F.StripTextures(GossipFrameGreetingPanel);
	
	F.Reskin(GossipFrameGreetingGoodbyeButton);
	
	F.ReskinScroll(GossipGreetingScrollFrameScrollBar);
	
	GossipGreetingText:SetTextColor(1, 1, 1);
	
	for i = 1, NUMGOSSIPBUTTONS do
		local Button = select(3, _G['GossipTitleButton'..i]:GetRegions());
		
		Button:SetTextColor(1, 1, 1);
	end
	
	hooksecurefunc('GossipFrameUpdate', function()
		GossipFrame.buttonIndex = 1;
		for i = GossipFrame.buttonIndex, NUMGOSSIPBUTTONS do
			local Button = _G['GossipTitleButton' .. i];
			
			if Button:GetFontString() then
				if Button:GetFontString():GetText() and Button:GetFontString():GetText():find('|cff000000') then
					Button:GetFontString():SetText(gsub(Button:GetFontString():GetText(), '|cff000000', '|cffFFFF00'))
				end
			end
		end
	end)
end)