local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.StripTextures(MailFrame, true);
	F.SetBD(MailFrame, 12, -13, -32, 74);
	-- InboxFrame
	for i = 1, INBOXITEMS_TO_DISPLAY do
		local Item = _G['MailItem'..i];
		local ItemButton = _G['MailItem'..i..'Button'];
		local ItemButtonIcon = _G['MailItem'..i..'ButtonIcon'];
		
		F.StripTextures(Item);
		
		F.StripTextures(ItemButton);
		F.StyleButton(ItemButton);
		F.CreateBD(ItemButton);
		
		ItemButtonIcon:SetPoint('TOPLEFT', 1, -1);
		ItemButtonIcon:SetPoint('BOTTOMRIGHT', -1, 1);
		ItemButtonIcon:SetTexCoord(unpack(F.TexCoords));
	end
	
	F.ReskinArrow(InboxPrevPageButton, 'Left');
	F.ReskinArrow(InboxNextPageButton, 'Right');
	-- SendMailFrame
	F.StripTextures(SendMailFrame);
	
	F.StripTextures(SendMailScrollFrame, true);
	F.ReskinScroll(SendMailScrollFrameScrollBar);
	
	MailTextFontNormal:SetTextColor(1, 1, 1);
	MailTextFontNormal:SetShadowOffset(1, -1);
	MailTextFontNormal:SetShadowColor(0, 0, 0);
	
	F.ReskinInput(SendMailNameEditBox);
	F.ReskinInput(SendMailSubjectEditBox);
	
	hooksecurefunc('SendMailFrame_Update', function()
		for i = 1, ATTACHMENTS_MAX_SEND do				
			local Button = _G['SendMailAttachment'..i]
			local ButtonTexture = Button:GetNormalTexture();
			
			if ( not Button.Style ) then
				F.StripTextures(Button);
				F.StyleButton(Button, nil, true);
				F.CreateBD(Button, .25);
				
				Button.Style = true;
			end
			
			if ( ButtonTexture ) then
				ButtonTexture:SetPoint('TOPLEFT', 1, -1);
				ButtonTexture:SetPoint('BOTTOMRIGHT', -1, 1);
				ButtonTexture:SetTexCoord(unpack(F.TexCoords));
			end
		end
	end)
	
	F.ReskinInput(SendMailMoneyGold);
	F.ReskinInput(SendMailMoneySilver);
	F.ReskinInput(SendMailMoneyCopper);
	
	F.ReskinRadio(SendMailSendMoneyButton);
	F.ReskinRadio(SendMailCODButton);
	
	F.Reskin(SendMailMailButton);
	F.Reskin(SendMailCancelButton);
	
	F.ReskinClose(InboxCloseButton, 'TOPRIGHT', MailFrame, 'TOPRIGHT', -36, -17);
	
	for i = 1, 2 do
		local Tab = _G['MailFrameTab'..i];
		
		F.ReskinTab(Tab);
	end
	-- OpenMailFrame
	F.StripTextures(OpenMailFrame);
	F.SetBD(OpenMailFrame, 12, -12, -34, 74);
	
	OpenMailFrameIcon:Hide();
	
	F.Reskin(OpenMailReportSpamButton);
	
	F.StripTextures(OpenMailScrollFrame, true);
	F.ReskinScroll(OpenMailScrollFrameScrollBar);
	
	F.StripTextures(OpenMailLetterButton);
	F.StyleButton(OpenMailLetterButton);
	F.CreateBD(OpenMailLetterButton);
	OpenMailLetterButtonIconTexture:SetPoint('TOPLEFT', 1, -1);
	OpenMailLetterButtonIconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
	OpenMailLetterButtonIconTexture:SetTexCoord(unpack(F.TexCoords));
	
	for i = 1, ATTACHMENTS_MAX_RECEIVE do
		local Button = _G['OpenMailAttachmentButton'..i];
		local ButtonIconTexture = _G['OpenMailAttachmentButton'..i..'IconTexture'];
		
		F.StripTextures(Button);
		F.StyleButton(Button);
		F.CreateBD(Button);
		
		ButtonIconTexture:SetPoint('TOPLEFT', 1, -1);
		ButtonIconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
		ButtonIconTexture:SetTexCoord(unpack(F.TexCoords));
	end
	
	F.StripTextures(OpenMailMoneyButton);
	F.StyleButton(OpenMailMoneyButton);
	F.CreateBD(OpenMailMoneyButton);
	OpenMailMoneyButtonIconTexture:SetPoint('TOPLEFT', 1, -1);
	OpenMailMoneyButtonIconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
	OpenMailMoneyButtonIconTexture:SetTexCoord(unpack(F.TexCoords));
	
	F.Reskin(OpenMailCancelButton);
	F.Reskin(OpenMailDeleteButton);
	F.Reskin(OpenMailReplyButton);
	
	F.ReskinClose(OpenMailCloseButton, 'TOPRIGHT', OpenMailFrame, 'TOPRIGHT', -38, -16);
end)