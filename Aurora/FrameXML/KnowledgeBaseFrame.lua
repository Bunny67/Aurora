local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	KnowledgeBaseFrameHeader:Hide();
	
	F.Reskin(KnowledgeBaseFrameTopIssuesButton);
	F.Reskin(GMChatOpenLog);
	
	KnowledgeBaseFrameDivider:Hide();
	
	F.ReskinInput(KnowledgeBaseFrameEditBox, 20);
	
	F.ReskinDropDown(KnowledgeBaseFrameCategoryDropDown);
	F.ReskinDropDown(KnowledgeBaseFrameSubCategoryDropDown);
	
	F.Reskin(KnowledgeBaseFrameSearchButton);
	
	KnowledgeBaseFrameDivider2:Hide();
	
	F.ReskinArrow(KnowledgeBaseArticleListFrameNextButton, 'Right');
	F.ReskinArrow(KnowledgeBaseArticleListFramePreviousButton, 'Left');
	
	F.ReskinScroll(KnowledgeBaseArticleScrollFrameScrollBar);
	F.Reskin(KnowledgeBaseArticleScrollChildFrameBackButton);
	
	F.Reskin(KnowledgeBaseFrameReportIssue);
	KnowledgeBaseFrameGMTalk:SetPoint('BOTTOM', KnowledgeBaseFrameReportIssue, 'TOP', 0, 1);
	F.Reskin(KnowledgeBaseFrameGMTalk);
	F.Reskin(KnowledgeBaseFrameAbandonTicket);
	KnowledgeBaseFrameEditTicket:SetPoint('BOTTOM', KnowledgeBaseFrameAbandonTicket, 'TOP', 0, 1);
	F.Reskin(KnowledgeBaseFrameEditTicket);
	
	KnowledgeBaseFrameStuck:SetPoint('LEFT', KnowledgeBaseFrameReportIssue, 'RIGHT', 1, 0);
	F.Reskin(KnowledgeBaseFrameStuck);
	KnowledgeBaseFrameLag:SetPoint('LEFT', KnowledgeBaseFrameGMTalk, 'RIGHT', 1, 0);
	F.Reskin(KnowledgeBaseFrameLag);
	F.Reskin(KnowledgeBaseFrameCancel);
end);