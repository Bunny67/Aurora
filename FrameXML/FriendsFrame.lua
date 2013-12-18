local F, C = unpack(select(2, ...))

tinsert(C.modules['Aurora'], function()
	local AllFriendsFrameStripTextures = {'FriendsFrame', 'FriendsListFrame', 'FriendsTabHeader', 'WhoFrame', 'WhoListScrollFrame', 'GuildFrame', 'GuildListScrollFrame', 'GuildFrameLFGFrame', 'GuildInfoFrame', 'GuildInfoTextBackground', 'GuildEventLogFrame', 'GuildEventFrame', 'GuildMemberDetailFrame', 'GuildMemberNoteBackground', 'GuildMemberOfficerNoteBackground', 'GuildControlPopupFrame', 'ChannelFrame', 'ChannelFrameVerticalBar', 'ChannelRosterScrollFrame', 'ChannelFrameDaughterFrame', 'ChannelFrameDaughterFrameChannelName', 'RaidFrame', 'RaidInfoFrame', 'RaidInfoInstanceLabel', 'RaidInfoIDLabel'}
	for i = 1, #AllFriendsFrameStripTextures do
		F.StripTextures(_G[AllFriendsFrameStripTextures[i]], true)
	end

	local AllFriendsFrameDropDowns = {'FriendsFrameStatusDropDown', 'WhoFrameDropDown', 'GuildControlPopupFrameDropDown'}
	for i = 1, #AllFriendsFrameDropDowns do
		F.ReskinDropDown(_G[AllFriendsFrameDropDowns[i]])
	end

	local AllFriendsFrameScrollbars = {'FriendsFrameFriendsScrollFrameScrollBar', 'WhoListScrollFrameScrollBar', 'GuildListScrollFrameScrollBar', 'GuildEventLogScrollFrameScrollBar', 'GuildInfoFrameScrollFrameScrollBar', 'ChannelRosterScrollFrameScrollBar', 'RaidInfoScrollFrameScrollBar'}
	for i = 1, #AllFriendsFrameScrollbars do
		F.ReskinScroll(_G[AllFriendsFrameScrollbars[i]])
	end

	local AllFriendsFrameInputs = {'GuildControlPopupFrameEditBox', 'GuildControlWithdrawGoldEditBox', 'GuildControlWithdrawItemsEditBox'}
	for i = 1, #AllFriendsFrameInputs do
		F.ReskinInput(_G[AllFriendsFrameInputs[i]], 16)
	end

	local AllFriendsFrameCheckBoxes = {'GuildFrameLFGButton'}
	for i = 1, #AllFriendsFrameCheckBoxes do
		F.ReskinCheck(_G[AllFriendsFrameCheckBoxes[i]])
	end

	for i = 1, 2 do
		F.StripTextures(_G['FriendsTabHeaderTab'..i])
	end
	
	for i = 1, 5 do
		F.ReskinTab(_G['FriendsFrameTab'..i])
	end
	
	for i = 1, 4 do
		F.StripTextures(_G['WhoFrameColumnHeader'..i])
		F.StripTextures(_G['GuildFrameColumnHeader'..i])
		F.StripTextures(_G['GuildFrameGuildStatusColumnHeader'..i])
	end

	local AllFriendsFrameButtons = {'FriendsFrameAddFriendButton', 'FriendsFrameSendMessageButton', 'FriendsFrameIgnorePlayerButton', 'FriendsFrameUnsquelchButton', 'WhoFrameWhoButton', 'WhoFrameAddFriendButton', 'WhoFrameGroupInviteButton', 'GuildFrameGuildInformationButton', 'GuildFrameAddMemberButton', 'GuildFrameControlButton', 'GuildMemberRemoveButton', 'GuildMemberGroupInviteButton', 'GuildInfoGuildEventButton', 'GuildInfoSaveButton', 'GuildInfoCancelButton', 'GuildEventLogCancelButton', 'GuildControlPopupAcceptButton', 'GuildControlPopupFrameCancelButton', 'ChannelFrameNewButton', 'ChannelFrameDaughterFrameOkayButton', 'ChannelFrameDaughterFrameCancelButton', 'RaidFrameConvertToRaidButton', 'RaidFrameRaidInfoButton', 'RaidInfoExtendButton', 'RaidInfoCancelButton', 'RaidFrameNotInRaidRaidBrowserButton'}
	for i = 1, #AllFriendsFrameButtons do
		F.Reskin(_G[AllFriendsFrameButtons[i]])
	end

	F.SetBD(FriendsFrame, 10, -12, -31, 76)
	F.ReskinClose(FriendsFrameCloseButton, 'TOPRIGHT', FriendsFrame, 'TOPRIGHT', -35, -16)
	FriendsFrameStatusDropDown:ClearAllPoints()
	FriendsFrameStatusDropDown:SetPoint('TOPLEFT', FriendsFrame, 'TOPLEFT', 10, -28)
	
	for i = 1, FRIENDS_TO_DISPLAY do
		local FriendsFrameFriendsScrollFrameButtons = _G['FriendsFrameFriendsScrollFrameButton'..i]
		FriendsFrameFriendsScrollFrameButtons.background:Hide()
		FriendsFrameFriendsScrollFrameButtons:SetHighlightTexture(C.media.backdrop)
		FriendsFrameFriendsScrollFrameButtons:GetHighlightTexture():SetVertexColor(.24, .56, 1, .2)
	end
	F.ReskinArrow(GuildFrameGuildListToggleButton, 'right')
	
	F.CreateBD(GuildInfoFrame)
	GuildInfoFrame:SetPoint('TOPLEFT', GuildFrame, 'TOPRIGHT', -30, -14)
	F.ReskinClose(GuildInfoCloseButton, 'TOPRIGHT', GuildInfoFrame, 'TOPRIGHT', -4, -4)
	
	F.CreateBD(GuildEventLogFrame)
	GuildEventLogFrame:SetPoint('TOPLEFT', GuildFrame, 'TOPRIGHT', -30, -14)
	F.ReskinClose(GuildEventLogCloseButton, 'TOPRIGHT', GuildEventLogFrame, 'TOPRIGHT', -4, -4)
	
	F.CreateBD(GuildMemberDetailFrame)
	GuildMemberDetailFrame:SetPoint('TOPLEFT', GuildFrame, 'TOPRIGHT', -30, -14)
	F.ReskinClose(GuildMemberDetailCloseButton, 'TOPRIGHT', GuildMemberDetailFrame, 'TOPRIGHT', -4, -4)
	
	F.SetBD(GuildControlPopupFrame, 3, -6, -28, 27)
	GuildControlPopupFrame:SetPoint('TOPLEFT', GuildFrame, 'TOPRIGHT', -22, -6)
	F.ReskinExpandOrCollapse(GuildControlPopupFrameAddRankButton)
	
	for i = 1, MAX_DISPLAY_CHANNEL_BUTTONS do
		F.StripTextures(_G['ChannelButton'..i])
		F.StyleButton(_G['ChannelButton'..i])
	end
	
	F.SetBD(ChannelFrameDaughterFrame, 5, -6, -5, 0)
	F.ReskinClose(ChannelFrameDaughterFrameDetailCloseButton, 'TOPRIGHT', ChannelFrameDaughterFrame, 'TOPRIGHT', -10, -9)
	F.StripTextures(ChannelFrameDaughterFrameChannelName)
	F.CreateBD(ChannelFrameDaughterFrameChannelName)
	F.StripTextures(ChannelFrameDaughterFrameChannelPassword)
	F.CreateBD(ChannelFrameDaughterFrameChannelPassword)
	
	F.CreateBD(RaidInfoFrame)
	F.ReskinClose(RaidInfoCloseButton, 'TOPRIGHT', RaidInfoFrame, 'TOPRIGHT', -4, -4)
end)