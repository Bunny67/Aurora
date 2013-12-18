local F, C = unpack(select(2, ...))
-- ������
tinsert(C.modules["Aurora"], function()
	local AllHelpFrameStripTextures = {'HelpFrame', 'KnowledgeBaseFrame', 'KnowledgeBaseFrameDivider', 'KnowledgeBaseFrameDivider2', 'HelpFrameOpenTicketDivider'}
	for i = 1, #AllHelpFrameStripTextures do
	local AllHelpFrameStripTexture = _G[AllHelpFrameStripTextures[i]]
		if AllHelpFrameStripTexture then
			F.StripTextures(AllHelpFrameStripTexture)
		else
			print('������ Aurora: '..AllHelpFrameStripTextures[i]..' �� ��� ������.')
		end
	end

	local AllHelpFrameDropDowns = {'KnowledgeBaseFrameCategoryDropDown', 'KnowledgeBaseFrameSubCategoryDropDown'}
	for i = 1, #AllHelpFrameDropDowns do
		local AllHelpFrameDropDown = _G[AllHelpFrameDropDowns[i]]
		if AllHelpFrameDropDown then
			F.ReskinDropDown(AllHelpFrameDropDown)
		else
			print('������ Aurora: '..AllHelpFrameDropDowns[i]..' �� ��� ������.')
		end
	end

	local AllHelpFrameScrollbars = {'KnowledgeBaseArticleScrollFrameScrollBar', 'HelpFrameOpenTicketScrollFrameScrollBar'}
	for i = 1, #AllHelpFrameScrollbars do
		local AllHelpFrameScrollbar = _G[AllHelpFrameScrollbars[i]]
		if AllHelpFrameScrollbar then
			F.ReskinScroll(AllHelpFrameScrollbar)
		else
			print('������ Aurora: '..AllHelpFrameScrollbars[i]..' �� ��� ������.')
		end
	end

	local AllHelpFrameInputs = {'KnowledgeBaseFrameEditBox'}
	for i = 1, #AllHelpFrameInputs do
		local AllHelpFrameInput = _G[AllHelpFrameInputs[i]]
		if AllHelpFrameInput then
			F.ReskinInput(AllHelpFrameInput)
		else
			print('������ Aurora: '..AllHelpFrameInputs[i]..' �� ��� ������.')
		end
	end

	local AllHelpFrameButtons = {'GMChatOpenLog', 'KnowledgeBaseFrameTopIssuesButton', 'KnowledgeBaseFrameSearchButton', 'KnowledgeBaseFrameGMTalk', 'KnowledgeBaseFrameLag', 'KnowledgeBaseFrameReportIssue', 'KnowledgeBaseFrameStuck', 'KnowledgeBaseArticleScrollChildFrameBackButton', 'KnowledgeBaseFrameCancel', 'HelpFrameGMTalkOpenTicket', 'HelpFrameGMTalkCancel', 'HelpFrameOpenTicketSubmit', 'HelpFrameOpenTicketCancel', 'HelpFrameLagLoot', 'HelpFrameLagAuctionHouse', 'HelpFrameLagMail', 'HelpFrameLagChat', 'HelpFrameLagMovement', 'HelpFrameLagSpell', 'HelpFrameLagCancel', 'HelpFrameReportIssueOpenTicket', 'HelpFrameReportIssueCancel', 'HelpFrameStuckStuck', 'HelpFrameStuckOpenTicket', 'HelpFrameStuckCancel'}
	for i = 1, #AllHelpFrameButtons do
	local AllHelpFrameReskinButtons = _G[AllHelpFrameButtons[i]]
		if AllHelpFrameReskinButtons then
			F.Reskin(AllHelpFrameReskinButtons)
		else
			print('������ Aurora: '..AllHelpFrameButtons[i]..' �� ��� ������.')
		end
	end
	F.SetBD(HelpFrame, 6, -6, -45, 14)
	F.ReskinClose(HelpFrameCloseButton, 'TOPRIGHT', HelpFrame, 'TOPRIGHT', -49, -10)
	F.ReskinArrow(KnowledgeBaseArticleListFramePreviousButton, 'left')
	F.ReskinArrow(KnowledgeBaseArticleListFrameNextButton, 'right')
end)