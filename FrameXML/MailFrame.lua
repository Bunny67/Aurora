local F, C = unpack(select(2, ...))

tinsert(C.modules['Aurora'], function()
	local AllMailFrameStripTextures = {'MailFrame', 'InboxFrame', 'SendMailFrame', 'SendMailScrollFrame', 'OpenMailFrame', 'OpenMailScrollFrame'}
	for i = 1, #AllMailFrameStripTextures do
	local AllMailFrameStripTexture = _G[AllMailFrameStripTextures[i]]
		if AllMailFrameStripTexture then
			F.StripTextures(AllMailFrameStripTexture, true)
		else
			print('Ошибка Aurora: '..AllMailFrameStripTextures[i]..' не был найден.')
		end
	end

	local AllMailFrameScrollbars = {'SendMailScrollFrameScrollBar', 'OpenMailScrollFrameScrollBar'}
	for i = 1, #AllMailFrameScrollbars do
		local AllMailFrameScrollbar = _G[AllMailFrameScrollbars[i]]
		if AllMailFrameScrollbar then
			F.ReskinScroll(AllMailFrameScrollbar)
		else
			print('Ошибка Aurora: '..AllMailFrameScrollbars[i]..' не был найден.')
		end
	end

	local AllMailFrameInputs = {'SendMailNameEditBox', 'SendMailSubjectEditBox', 'SendMailMoneyGold', 'SendMailMoneySilver', 'SendMailMoneyCopper'}
	for i = 1, #AllMailFrameInputs do
		local AllMailFrameInput = _G[AllMailFrameInputs[i]]
		if AllMailFrameInput then
			F.ReskinInput(AllMailFrameInput)
		else
			print('Ошибка Aurora: '..AllMailFrameInputs[i]..' не был найден.')
		end
	end

	for i = 1, 2 do
		F.ReskinTab(_G['MailFrameTab'..i])
	end

	local AllMailFrameRadioButtons = {'SendMailSendMoneyButton', 'SendMailCODButton'}
	for i = 1, #AllMailFrameRadioButtons do
		local AllMailFrameRadioButton = _G[AllMailFrameRadioButtons[i]]
		if AllMailFrameRadioButton then
			F.ReskinRadio(AllMailFrameRadioButton)
		else
			print('Ошибка Aurora: '..AllMailFrameRadioButtons[i]..' не был найден.')
		end
	end

	local AllMailFrameButtons = {'SendMailMailButton', 'SendMailCancelButton', 'OpenMailReplyButton', 'OpenMailDeleteButton', 'OpenMailCancelButton', 'OpenMailReportSpamButton'}
	for i = 1, #AllMailFrameButtons do
	local AllMailFrameButton = _G[AllMailFrameButtons[i]]
		if AllMailFrameButton then
			F.Reskin(AllMailFrameButton)
		else
			print('Ошибка Aurora: '..AllMailFrameButtons[i]..' не был найден.')
		end
	end

	F.StripTextures(OpenMailLetterButton)
	F.CreateBD(OpenMailLetterButton, .25)
	F.StyleButton(OpenMailLetterButton)
	OpenMailLetterButtonIconTexture:SetTexCoord(.08, .92, .08, .92)						
	OpenMailLetterButtonIconTexture:ClearAllPoints()
	OpenMailLetterButtonIconTexture:SetPoint('BOTTOMRIGHT', -1, 1)
	OpenMailLetterButtonIconTexture:SetPoint('TOPLEFT', 1, -1)
	
	F.StripTextures(OpenMailMoneyButton)
	F.CreateBD(OpenMailMoneyButton, .25)
	F.StyleButton(OpenMailMoneyButton)
	OpenMailMoneyButtonIconTexture:SetTexCoord(.08, .92, .08, .92)						
	OpenMailMoneyButtonIconTexture:ClearAllPoints()
	OpenMailMoneyButtonIconTexture:SetPoint('TOPLEFT', 1, -1)
	OpenMailMoneyButtonIconTexture:SetPoint('BOTTOMRIGHT', -1, 1)
	
	for i = 1, INBOXITEMS_TO_DISPLAY do
		local bg = _G['MailItem'..i]
		F.StripTextures(bg)
		F.CreateBD(bg, .25)
		
		local bu = _G['MailItem'..i..'Button']
		F.StripTextures(bu)
		F.CreateBD(bu, .25)
		F.StyleButton(bu)

		local ic = _G['MailItem'..i..'Button'..'Icon']
		ic:SetTexCoord(.08, .92, .08, .92)
		ic:ClearAllPoints()
		ic:SetPoint('TOPLEFT', 1, -1)
		ic:SetPoint('BOTTOMRIGHT', -1, 1)
	end

	local function MailFrameSkin()
		for i = 1, ATTACHMENTS_MAX_SEND do				
			local b = _G['SendMailAttachment'..i]
			if not b.skinned then
				F.StripTextures(b)
				F.CreateBD(b, .25)
				F.StyleButton(b)
				b.skinned = true
			end
			local t = b:GetNormalTexture()
			if t then
				t:SetTexCoord(.08, .92, .08, .92)
				t:ClearAllPoints()
				t:SetPoint('TOPLEFT', 1, -1)
				t:SetPoint('BOTTOMRIGHT', -1, 1)
			end
		end
	end
	hooksecurefunc('SendMailFrame_Update', MailFrameSkin)

	for i = 1, ATTACHMENTS_MAX_RECEIVE do
		local bu = _G['OpenMailAttachmentButton'..i]
		F.StripTextures(bu)
		F.CreateBD(bu, .25)
		F.StyleButton(bu)
		
		local ic = _G['OpenMailAttachmentButton'..i..'IconTexture']
		ic:SetTexCoord(.08, .92, .08, .92)
		ic:ClearAllPoints()
		ic:SetPoint('TOPLEFT', 1, -1)
		ic:SetPoint('BOTTOMRIGHT', -1, 1)
	end

	MailFont_Large:SetTextColor(1, 1, 1)
	MailFont_Large:SetShadowColor(0, 0, 0)
	MailFont_Large:SetShadowOffset(1, -1)
	MailTextFontNormal:SetTextColor(1, 1, 1)
	MailTextFontNormal:SetShadowOffset(1, -1)
	MailTextFontNormal:SetShadowColor(0, 0, 0)
	
	F.SetBD(MailFrame, 16, -12, -34, 74)
	F.ReskinClose(InboxCloseButton, 'TOPRIGHT', MailFrame, 'TOPRIGHT', -38, -16)
	F.SetBD(OpenMailFrame, 12, -12, -34, 74)
	F.ReskinClose(OpenMailCloseButton, 'TOPRIGHT', OpenMailFrame, 'TOPRIGHT', -38, -16)
	F.ReskinArrow(InboxPrevPageButton, 'left')
	F.ReskinArrow(InboxNextPageButton, 'right')
end)