local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.StripTextures(FriendsFrame, true);
	F.SetBD(FriendsFrame, 10, -12, -31, 76);

	F.ReskinClose(FriendsFrameCloseButton, 'TOPRIGHT', FriendsFrame, 'TOPRIGHT', -35, -16)
	
	FriendsFrameStatusDropDown:ClearAllPoints();
	FriendsFrameStatusDropDown:SetPoint('TOPLEFT', FriendsFrame, 'TOPLEFT', 10, -28);
	F.ReskinDropDown(FriendsFrameStatusDropDown);
	
	for i = 1, 5 do
		local Tab = _G['FriendsFrameTab'..i];
		
		F.ReskinTab(Tab);
	end
	
	for i = 1, 2 do -- Друзья
		local Tab = _G['FriendsTabHeaderTab'..i];
		
		F.StripTextures(Tab);
	end
	
	for i = 1, FRIENDS_TO_DISPLAY do
		local Button = _G['FriendsFrameFriendsScrollFrameButton'..i];
		
		Button.background:Hide();

		F.StyleButton(Button);
	end
	
	F.ReskinScroll(FriendsFrameFriendsScrollFrameScrollBar);
	
	F.Reskin(FriendsFrameAddFriendButton, nil, true);
	F.Reskin(FriendsFrameSendMessageButton, nil, true);
	
	F.Reskin(FriendsFrameIgnorePlayerButton, nil, true); -- Черный список
	F.Reskin(FriendsFrameUnsquelchButton, nil, true);
	-- Кто
	for i = 1, 4 do
		local Header = _G['WhoFrameColumnHeader'..i];
		
		F.StripTextures(Header);
		F.StyleButton(Header);
	end
	
	F.ReskinDropDown(WhoFrameDropDown);
	
	F.StripTextures(WhoListScrollFrame);
	F.ReskinScroll(WhoListScrollFrameScrollBar);
	
	F.Reskin(WhoFrameWhoButton);
	F.Reskin(WhoFrameAddFriendButton);
	F.Reskin(WhoFrameGroupInviteButton);
	-- Гильдия
	F.StripTextures(GuildFrameLFGFrame);
	F.CreateBD(GuildFrameLFGFrame, .25);
	F.ReskinCheck(GuildFrameLFGButton);
	
	for i = 1, 4 do
		local Header1 = _G['GuildFrameColumnHeader'..i];
		local Header2 = _G['GuildFrameGuildStatusColumnHeader'..i];
		
		F.StripTextures(Header1);
		F.StyleButton(Header1);
		F.StripTextures(Header2);
		F.StyleButton(Header2);
	end
	
	F.StripTextures(GuildListScrollFrame);
	F.ReskinScroll(GuildListScrollFrameScrollBar);
	
	F.ReskinArrow(GuildFrameGuildListToggleButton, 'right');
	
	F.Reskin(GuildFrameGuildInformationButton);
	F.Reskin(GuildFrameAddMemberButton);
	F.Reskin(GuildFrameControlButton);
	
	F.StripTextures(GuildMemberDetailFrame); -- Иформация о персонаже
	F.CreateBD(GuildMemberDetailFrame);
	
	F.ReskinClose(GuildMemberDetailCloseButton);
	
	F.CreateBD(GuildMemberNoteBackground);
	F.CreateGradient(GuildMemberNoteBackground);
	
	F.CreateBD(GuildMemberOfficerNoteBackground);
	F.CreateGradient(GuildMemberOfficerNoteBackground);
	
	F.Reskin(GuildMemberRemoveButton);
	F.Reskin(GuildMemberGroupInviteButton);
	
	F.StripTextures(GuildInfoFrame); -- Информация
	F.SetBD(GuildInfoFrame, 5, -6, -2, 6);
	
	F.ReskinClose(GuildInfoCloseButton, 'TOPRIGHT', GuildInfoFrame, 'TOPRIGHT', -6, -10);
	
	F.CreateBD(GuildInfoTextBackground);
	
	F.ReskinScroll(GuildInfoFrameScrollFrameScrollBar);
	
	F.Reskin(GuildInfoGuildEventButton);
	F.Reskin(GuildInfoSaveButton);
	F.Reskin(GuildInfoCancelButton);
	
	F.StripTextures(GuildEventLogFrame); -- Журнал
	F.SetBD(GuildEventLogFrame, 5, -6, -2, 6);
	
	F.ReskinClose(GuildEventLogCloseButton, 'TOPRIGHT', GuildEventLogFrame, 'TOPRIGHT', -6, -10);
	
	F.CreateBD(GuildEventFrame);
	
	F.ReskinScroll(GuildEventLogScrollFrameScrollBar);
	
	F.Reskin(GuildEventLogCancelButton);
	
	F.StripTextures(GuildControlPopupFrame); -- Управление
	F.SetBD(GuildControlPopupFrame, 3, -5, -27, 27);
	
	F.ReskinDropDown(GuildControlPopupFrameDropDown);
	--_G['GuildControlPopupFrameDropDownButton']:SetSize(16, 16);
	
	F.ReskinInput(GuildControlPopupFrameEditBox);
	
	for i = 1, 17 do
		local Checkbox = _G['GuildControlPopupFrameCheckbox'..i];
		
		if (Checkbox) then
			F.ReskinCheck(Checkbox);
		end
	end
	
	F.ReskinInput(GuildControlWithdrawGoldEditBox);
	
	for i = 1, MAX_GUILDBANK_TABS do
		local Tab = _G['GuildBankTabPermissionsTab'..i];
		
		F.StripTextures(Tab);
	end
	
	--_G['GuildControlPopupFrameTabPermissions'];
	
	F.ReskinCheck(GuildControlTabPermissionsViewTab);
	F.ReskinCheck(GuildControlTabPermissionsDepositItems);
	F.ReskinCheck(GuildControlTabPermissionsUpdateText);
	
	F.ReskinInput(GuildControlWithdrawItemsEditBox);
	
	--F.ReskinCheck(_G['(GuildControlPopupAcceptButton']);
	--F.ReskinCheck(_G['GuildControlPopupFrameCancelButton']);
	-- Каналы
	for i = 1, MAX_DISPLAY_CHANNEL_BUTTONS do
		local Button = _G['ChannelButton'..i];
		
		F.StripTextures(Button);
		F.StyleButton(Button);
	end
	
	F.Kill(ChannelFrameVerticalBar);
	
	F.StripTextures(ChannelRosterScrollFrame);
	F.ReskinScroll(ChannelRosterScrollFrameScrollBar);
	
	F.Reskin(ChannelFrameNewButton);
	
	F.StripTextures(ChannelFrameDaughterFrame); -- Новый канал
	F.CreateBD(ChannelFrameDaughterFrame);
	
	F.ReskinInput(ChannelFrameDaughterFrameChannelName);
	F.ReskinInput(ChannelFrameDaughterFrameChannelPassword);
	
	F.ReskinClose(ChannelFrameDaughterFrameDetailCloseButton);
	
	F.Reskin(ChannelFrameDaughterFrameOkayButton);
	F.Reskin(ChannelFrameDaughterFrameCancelButton);
	-- Рейд
	F.Reskin(RaidFrameConvertToRaidButton);
	F.Reskin(RaidFrameRaidInfoButton);
	F.Reskin(RaidFrameNotInRaidRaidBrowserButton, nil, true);
	
	F.StripTextures(RaidInfoFrame, true); -- Информация
	F.CreateBD(RaidInfoFrame);
	
	F.ReskinClose(RaidInfoCloseButton);
	
	F.StripTextures(RaidInfoInstanceLabel);
	F.StripTextures(RaidInfoIDLabel);
	
	F.Reskin(RaidInfoExtendButton, nil, true);
	F.Reskin(RaidInfoCancelButton, nil, true);
end)