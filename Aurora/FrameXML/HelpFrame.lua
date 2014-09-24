local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

local BUTTONS = {
	-- HelpFrameGMTalk;
	'GMTalkOpenTicket',
	'GMTalkCancel',
	-- HelpFrameReportIssue;
	'ReportIssueOpenTicket',
	'ReportIssueCancel',
	-- HelpFrameLag;
	'LagLoot',
	'LagAuctionHouse',
	'LagMail',
	'LagChat',
	'LagMovement',
	'LagSpell',
	'LagCancel',
	-- HelpFrameStuck;
	'StuckStuck',
	'StuckOpenTicket',
	'StuckCancel',
	-- HelpFrameOpenTicket;
	'OpenTicketCancel',
	'OpenTicketSubmit',
	-- HelpFrameViewResponse;
	'ViewResponseCancel',
	'ViewResponseMoreHelp',
	'ViewResponseIssueResolved',
	-- HelpFrameWelcome;
	'WelcomeGMTalk',
	'WelcomeReportIssue',
	'WelcomeStuck',
	'WelcomeCancel'
};

tinsert(C.Modules['Aurora'], function()
	-- HelpFrame;
	F:SetBD(HelpFrame, 6, -6, -45, 14);
	
	for i = 1, 9 do
		select(i, HelpFrame:GetRegions()):SetTexture(nil);
	end
	
	HelpFrameHeader:SetTexture(nil);
	
	do
		local Header = F:CreateBG(HelpFrameHeader);
		Header:SetPoint('TOPLEFT', HelpFrameHeader, 64, -8);
		Header:SetPoint('BOTTOMRIGHT', HelpFrameHeader, -64, 32);
		
		HelpFrame.Gradient = HelpFrame:CreateTexture(nil, 'ARTWORK');
		HelpFrame.Gradient:SetPoint('TOPLEFT', Header, 1, -1);
		HelpFrame.Gradient:SetPoint('BOTTOMRIGHT', Header, -1, 1);
		HelpFrame.Gradient:SetTexture(C.Media.Backdrop);
		HelpFrame.Gradient:SetVertexColor(.2, .2, .2, 1);
	end
	
	F:ReskinClose(HelpFrameCloseButton, 'TOPRIGHT', HelpFrame, 'TOPRIGHT', -49, -10);
	
	do
		local Button;
	
		for i = 1, #BUTTONS do
			Button = _G['HelpFrame'..BUTTONS[i]];
			
			F:Reskin(Button);
		end
	end
	-- HelpFrameOpenTicket;
	HelpFrameOpenTicketDividerLeft:SetTexture(nil);
	HelpFrameOpenTicketDividerMiddle:SetTexture(nil);
	HelpFrameOpenTicketDividerRight:SetTexture(nil);
	
	F:ReskinScroll(HelpFrameOpenTicketScrollFrameScrollBar);
	
	HelpFrameOpenTicketSubmit:SetPoint('RIGHT', HelpFrameOpenTicketCancel, 'LEFT', -1, 0);
	-- HelpFrameViewResponse;
	F:ReskinScroll(HelpFrameViewResponseIssueScrollFrameScrollBar);
	
	HelpFrameViewResponseDivider:Hide();
	
	F:ReskinScroll(HelpFrameViewResponseMessageScrollFrameScrollBar);
	
	HelpFrameViewResponseIssueResolved:SetPoint('LEFT', HelpFrameViewResponseMoreHelp, 'RIGHT', -1, 0);
end);