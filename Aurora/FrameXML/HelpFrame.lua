local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	-- HelpFrame;
	F.SetBD(HelpFrame, 6, -6, -45, 14);
	
	for i = 1, 9 do
		select(i, HelpFrame:GetRegions()):Hide();
	end
	
	HelpFrameHeader:SetTexture('');
	
	local Header = F.CreateBG(HelpFrameHeader);
	Header:SetPoint('TOPLEFT', HelpFrameHeader, 64, -8);
	Header:SetPoint('BOTTOMRIGHT', HelpFrameHeader, -64, 32);
	
	HelpFrame.Gradient = HelpFrame:CreateTexture(nil, 'ARTWORK');
	HelpFrame.Gradient:SetPoint('TOPLEFT', Header, 1, -1);
	HelpFrame.Gradient:SetPoint('BOTTOMRIGHT', Header, -1, 1);
	HelpFrame.Gradient:SetTexture(C.Media.Backdrop);
	HelpFrame.Gradient:SetVertexColor(.2, .2, .2, 1);
	
	F.ReskinClose(HelpFrameCloseButton, 'TOPRIGHT', HelpFrame, 'TOPRIGHT', -49, -10);
	-- HelpFrameGMTalk;
	F.Reskin(HelpFrameGMTalkOpenTicket);
	F.Reskin(HelpFrameGMTalkCancel);
	-- HelpFrameReportIssue;
	F.Reskin(HelpFrameReportIssueOpenTicket);
	F.Reskin(HelpFrameReportIssueCancel);
	-- HelpFrameLag;
	F.Reskin(HelpFrameLagLoot, nil, true);
	F.Reskin(HelpFrameLagAuctionHouse, nil, true);
	F.Reskin(HelpFrameLagMail, nil, true);
	F.Reskin(HelpFrameLagChat, nil, true);
	F.Reskin(HelpFrameLagMovement, nil, true);
	F.Reskin(HelpFrameLagSpell, nil, true);
	
	F.Reskin(HelpFrameLagCancel);
	-- HelpFrameStuck;
	F.Reskin(HelpFrameStuckStuck, nil, true);
	F.Reskin(HelpFrameStuckOpenTicket, nil, true);
	
	F.Reskin(HelpFrameStuckCancel);
	-- HelpFrameOpenTicket;
	HelpFrameOpenTicketDividerLeft:Hide();
	HelpFrameOpenTicketDividerMiddle:Hide();
	HelpFrameOpenTicketDividerRight:Hide();
	
	F.ReskinScroll(HelpFrameOpenTicketScrollFrameScrollBar);
	
	F.Reskin(HelpFrameOpenTicketCancel);
	HelpFrameOpenTicketSubmit:SetPoint('RIGHT', HelpFrameOpenTicketCancel, 'LEFT', -1, 0);
	F.Reskin(HelpFrameOpenTicketSubmit);
	-- HelpFrameViewResponse;
	F.ReskinScroll(HelpFrameViewResponseIssueScrollFrameScrollBar);
	
	HelpFrameViewResponseDivider:Hide();
	
	F.ReskinScroll(HelpFrameViewResponseMessageScrollFrameScrollBar);
	
	F.Reskin(HelpFrameViewResponseCancel);
	F.Reskin(HelpFrameViewResponseMoreHelp);
	HelpFrameViewResponseIssueResolved:SetPoint('LEFT', HelpFrameViewResponseMoreHelp, 'RIGHT', -1, 0);
	F.Reskin(HelpFrameViewResponseIssueResolved);
	-- HelpFrameWelcome;
	F.Reskin(HelpFrameWelcomeGMTalk);
	F.Reskin(HelpFrameWelcomeReportIssue);
	F.Reskin(HelpFrameWelcomeStuck);
	F.Reskin(HelpFrameWelcomeCancel);
end);