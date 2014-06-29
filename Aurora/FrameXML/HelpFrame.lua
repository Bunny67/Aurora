local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local select = select;
local tinsert = table.insert;

local HELP_FRAME_BUTTONS = {
	-- HelpFrameGMTalk;
	'HelpFrameGMTalkOpenTicket',
	'HelpFrameGMTalkCancel',
	-- HelpFrameReportIssue;
	'HelpFrameReportIssueOpenTicket',
	'HelpFrameReportIssueCancel',
	-- HelpFrameLag;
	'HelpFrameLagLoot',
	'HelpFrameLagAuctionHouse',
	'HelpFrameLagMail',
	'HelpFrameLagChat',
	'HelpFrameLagMovement',
	'HelpFrameLagSpell',
	'HelpFrameLagCancel',
	-- HelpFrameStuck;
	'HelpFrameStuckStuck',
	'HelpFrameStuckOpenTicket',
	'HelpFrameStuckCancel',
	-- HelpFrameOpenTicket;
	'HelpFrameOpenTicketCancel',
	'HelpFrameOpenTicketSubmit',
	-- HelpFrameViewResponse;
	'HelpFrameViewResponseCancel',
	'HelpFrameViewResponseMoreHelp',
	'HelpFrameViewResponseIssueResolved',
	-- HelpFrameWelcome;
	'HelpFrameWelcomeGMTalk',
	'HelpFrameWelcomeReportIssue',
	'HelpFrameWelcomeStuck',
	'HelpFrameWelcomeCancel'
};

tinsert(C.Modules['Aurora'], function()
	-- HelpFrame;
	F.SetBD(HelpFrame, 6, -6, -45, 14);
	
	for i = 1, 9 do
		select(i, HelpFrame:GetRegions()):SetTexture(nil);
	end
	
	HelpFrameHeader:SetTexture(nil);
	
	do
		local Header = F.CreateBG(HelpFrameHeader);
		Header:SetPoint('TOPLEFT', HelpFrameHeader, 64, -8);
		Header:SetPoint('BOTTOMRIGHT', HelpFrameHeader, -64, 32);
		
		HelpFrame.Gradient = HelpFrame:CreateTexture(nil, 'ARTWORK');
		HelpFrame.Gradient:SetPoint('TOPLEFT', Header, 1, -1);
		HelpFrame.Gradient:SetPoint('BOTTOMRIGHT', Header, -1, 1);
		HelpFrame.Gradient:SetTexture(C.Media.Backdrop);
		HelpFrame.Gradient:SetVertexColor(.2, .2, .2, 1);
	end
	
	F.ReskinClose(HelpFrameCloseButton, 'TOPRIGHT', HelpFrame, 'TOPRIGHT', -49, -10);
	
	do
		local Button;
	
		for i = 1, #HELP_FRAME_BUTTONS do
			Button = _G[HELP_FRAME_BUTTONS[i]];
			
			F.Reskin(Button);
		end
	end
	-- HelpFrameOpenTicket;
	HelpFrameOpenTicketDividerLeft:SetTexture(nil);
	HelpFrameOpenTicketDividerMiddle:SetTexture(nil);
	HelpFrameOpenTicketDividerRight:SetTexture(nil);
	
	F.ReskinScroll(HelpFrameOpenTicketScrollFrameScrollBar);
	
	HelpFrameOpenTicketSubmit:SetPoint('RIGHT', HelpFrameOpenTicketCancel, 'LEFT', -1, 0);
	-- HelpFrameViewResponse;
	F.ReskinScroll(HelpFrameViewResponseIssueScrollFrameScrollBar);
	
	HelpFrameViewResponseDivider:Hide();
	
	F.ReskinScroll(HelpFrameViewResponseMessageScrollFrameScrollBar);
	
	HelpFrameViewResponseIssueResolved:SetPoint('LEFT', HelpFrameViewResponseMoreHelp, 'RIGHT', -1, 0);
end);