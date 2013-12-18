local F, C = unpack(select(2, ...))

local _G = _G
local gsub = string.gsub

tinsert(C.modules['Aurora'], function()
	ItemTextPageText:SetTextColor(1, 1, 1)
	ItemTextPageText.SetTextColor = F.dummy		
	
	F.ReskinScroll(_G['GossipGreetingScrollFrameScrollBar'])

	F.StripTextures(_G['GossipFrameGreetingPanel']);

	F.Kill(_G['GossipFramePortrait']);

	F.Reskin(_G['GossipFrameGreetingGoodbyeButton'])

	for i = 1, NUMGOSSIPBUTTONS do
		obj = select(3,_G["GossipTitleButton"..i]:GetRegions())
		obj:SetTextColor(1,1,1)
	end

	GossipGreetingText:SetTextColor(1,1,1)

	F.SetBD(GossipFrame, 10, -12, -31, 67)
	F.ReskinClose(GossipFrameCloseButton, 'TOPRIGHT', GossipFrame, 'TOPRIGHT', -35, -16)
	
	hooksecurefunc('GossipFrameUpdate', function()
		GossipFrame.buttonIndex = 1;
		for i=GossipFrame.buttonIndex, NUMGOSSIPBUTTONS do
			local button = _G['GossipTitleButton' .. i]
			
			if button:GetFontString() then
				if button:GetFontString():GetText() and button:GetFontString():GetText():find("|cff000000") then
					button:GetFontString():SetText(gsub(button:GetFontString():GetText(), "|cff000000", "|cffFFFF00"))
				end
			end
		end
	end)
end)