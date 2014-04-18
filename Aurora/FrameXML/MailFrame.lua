local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;

local TexCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	F.SetBD(MailFrame, 12, -13, -32, 74);
	
	MailFrame:DisableDrawLayer('BACKGROUND');
	MailFrame:DisableDrawLayer('BORDER');
	-- InboxFrame
	for i = 1, INBOXITEMS_TO_DISPLAY do
		local Item = _G['MailItem'..i];
		local ItemButton = _G['MailItem'..i..'Button'];
		local ItemButtonIcon = _G['MailItem'..i..'ButtonIcon'];
		
		for i = 1, 3 do
			select(i, Item:GetRegions()):Hide();
		end
		
		F.StyleButton(ItemButton);
		F.CreateBD(ItemButton);
		
		_G['MailItem'..i..'ButtonSlot']:Hide();
		
		ItemButtonIcon:SetPoint('TOPLEFT', 1, -1);
		ItemButtonIcon:SetPoint('BOTTOMRIGHT', -1, 1);
		ItemButtonIcon:SetTexCoord(unpack(F.TexCoords));
	end
	
	F.ReskinArrow(InboxPrevPageButton, 'Left');
	F.ReskinArrow(InboxNextPageButton, 'Right');
	-- SendMailFrame
	for i = 4, 7 do
		select(i, SendMailFrame:GetRegions()):Hide();
	end
	
	SendMailScrollFrame:DisableDrawLayer('BACKGROUND');
	SendMailScrollFrame:DisableDrawLayer('ARTWORK');
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
				select(1, Button:GetRegions()):Hide();
				
				F.StyleButton(Button, nil, true);
				F.CreateBD(Button, .25);
				
				Button.Style = true;
			end
			
			if ( ButtonTexture ) then
				ButtonTexture:SetPoint('TOPLEFT', 1, -1);
				ButtonTexture:SetPoint('BOTTOMRIGHT', -1, 1);
				ButtonTexture:SetTexCoord(unpack(TexCoords));
			end
		end
	end)
	
	F.ReskinInput(SendMailMoneyGold);
	F.ReskinInput(SendMailMoneySilver);
	F.ReskinInput(SendMailMoneyCopper);
	
	F.ReskinRadio(SendMailSendMoneyButton);
	F.ReskinRadio(SendMailCODButton);
	
	F.Reskin(SendMailCancelButton);
	SendMailMailButton:SetPoint('RIGHT', SendMailCancelButton, 'LEFT', -1, 0);
	F.Reskin(SendMailMailButton);
	
	F.ReskinClose(InboxCloseButton, 'TOPRIGHT', MailFrame, 'TOPRIGHT', -36, -17);
	
	for i = 1, 2 do
		local Tab = _G['MailFrameTab'..i];
		
		F.ReskinTab(Tab);
	end
	-- OpenMailFrame
	F.SetBD(OpenMailFrame, 12, -12, -34, 74);
	OpenMailFrameIcon:Hide();
	
	OpenMailFrame:DisableDrawLayer('BORDER');
	
	select(12, OpenMailFrame:GetRegions()):Hide();
	select(13, OpenMailFrame:GetRegions()):Hide();
	
	F.Reskin(OpenMailReportSpamButton);
	
	OpenMailScrollFrame:DisableDrawLayer('OVERLAY');
	OpenMailScrollFrame:DisableDrawLayer('BACKGROUND');
	F.ReskinScroll(OpenMailScrollFrameScrollBar);
	
	OpenMailLetterButton:SetNormalTexture('');
	F.StyleButton(OpenMailLetterButton);
	F.CreateBD(OpenMailLetterButton);
	OpenMailLetterButtonIconTexture:SetPoint('TOPLEFT', 1, -1);
	OpenMailLetterButtonIconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
	OpenMailLetterButtonIconTexture:SetTexCoord(unpack(TexCoords));
	
	for i = 1, ATTACHMENTS_MAX_RECEIVE do
		local Button = _G['OpenMailAttachmentButton'..i];
		local ButtonIconTexture = _G['OpenMailAttachmentButton'..i..'IconTexture'];
		
		Button:SetNormalTexture('');
		F.StyleButton(Button);
		F.CreateBD(Button);
		
		ButtonIconTexture:SetPoint('TOPLEFT', 1, -1);
		ButtonIconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
		ButtonIconTexture:SetTexCoord(unpack(TexCoords));
	end
	
	OpenMailMoneyButton:SetNormalTexture('');
	F.StyleButton(OpenMailMoneyButton);
	F.CreateBD(OpenMailMoneyButton);
	OpenMailMoneyButtonIconTexture:SetPoint('TOPLEFT', 1, -1);
	OpenMailMoneyButtonIconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
	OpenMailMoneyButtonIconTexture:SetTexCoord(unpack(TexCoords));
	
	F.Reskin(OpenMailCancelButton);
	OpenMailDeleteButton:SetPoint('RIGHT', OpenMailCancelButton, 'LEFT', -1, 0);
	F.Reskin(OpenMailDeleteButton);
	OpenMailReplyButton:SetPoint('RIGHT', OpenMailDeleteButton, 'LEFT', -1, 0);
	F.Reskin(OpenMailReplyButton);
	
	F.ReskinClose(OpenMailCloseButton, 'TOPRIGHT', OpenMailFrame, 'TOPRIGHT', -38, -16);
end)