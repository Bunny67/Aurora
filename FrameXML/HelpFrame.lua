local F, C = unpack(select(2, ...))

local _G = getfenv(0)

tinsert(C.modules['Aurora'], function()
	F.StripTextures(_G['HelpFrame'], true);
	F.SetBD(_G['HelpFrame'], 6, -6, -45, 14);
	
	F.StripTextures(_G['KnowledgeBaseFrame'], true);
	
	local Header = CreateFrame('Frame', nil, HelpFrame)
	Header:SetPoint('TOPLEFT', HelpFrameHeader, 64, -8)
	Header:SetPoint('BOTTOMRIGHT', HelpFrameHeader, -64, 32)
	Header:SetFrameLevel(HelpFrame:GetFrameLevel())
	F.CreateBD(Header, .0)
	F.CreateGradient(Header)
	
	F.ReskinClose(_G['HelpFrameCloseButton'], 'TOPRIGHT', HelpFrame, 'TOPRIGHT', -49, -10);
	
	F.Reskin(_G['GMChatOpenLog']);
	F.Reskin(_G['KnowledgeBaseFrameTopIssuesButton']);
	
	F.StripTextures(_G['KnowledgeBaseFrameDivider']);
	
	F.ReskinInput(_G['KnowledgeBaseFrameEditBox'], 20);
	
	F.ReskinScroll(_G['KnowledgeBaseArticleScrollFrameScrollBar']);
	
	F.ReskinDropDown(_G['KnowledgeBaseFrameCategoryDropDown']);
	F.ReskinDropDown(_G['KnowledgeBaseFrameSubCategoryDropDown']);
	
	F.Reskin(_G['KnowledgeBaseFrameSearchButton']);
	
	F.StripTextures(_G['KnowledgeBaseFrameDivider2']);
	
	F.Reskin(_G['KnowledgeBaseFrameGMTalk']);
	F.Reskin(_G['KnowledgeBaseFrameLag']);
	F.Reskin(_G['KnowledgeBaseFrameReportIssue']);
	F.Reskin(_G['KnowledgeBaseFrameStuck']);
	F.Reskin(_G['KnowledgeBaseFrameEditTicket']);
	F.Reskin(_G['KnowledgeBaseFrameAbandonTicket']);
	
	F.Reskin(_G['KnowledgeBaseFrameCancel']);
	
	F.Reskin(_G['HelpFrameGMTalkOpenTicket']); -- Связатся с ГМ
	F.Reskin(_G['HelpFrameGMTalkCancel']);
	
	F.Reskin(_G['HelpFrameLagLoot'], nil, true); -- Сообщить о задержки
	F.Reskin(_G['HelpFrameLagAuctionHouse'], nil, true);
	F.Reskin(_G['HelpFrameLagMail'], nil, true);
	F.Reskin(_G['HelpFrameLagChat'], nil, true);
	F.Reskin(_G['HelpFrameLagMovement'], nil, true);
	F.Reskin(_G['HelpFrameLagSpell'], nil, true);
	
	F.Reskin(_G['HelpFrameLagCancel']);
	
	F.Reskin(_G['HelpFrameReportIssueOpenTicket']); -- Сообщить о проблеме
	
	F.Reskin(_G['HelpFrameReportIssueCancel']);
	
	F.StripTextures(_G['HelpFrameOpenTicketDivider']);
	
	F.ReskinScroll(_G['HelpFrameOpenTicketScrollFrameScrollBar']);
	
	F.Reskin(_G['HelpFrameOpenTicketSubmit']);
	F.Reskin(_G['HelpFrameOpenTicketCancel']);
	
	F.Reskin(_G['HelpFrameStuckStuck'], nil, true); -- Персонаж застрял
	F.Reskin(_G['HelpFrameStuckOpenTicket'], nil, true);
	F.Reskin(_G['HelpFrameStuckCancel']);
end)