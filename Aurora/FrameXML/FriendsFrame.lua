local F, C = unpack(select(2, ...))

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.StripTextures(_G['FriendsFrame'], true);
	F.SetBD(_G['FriendsFrame'], 10, -12, -31, 76);

	F.ReskinClose(_G['FriendsFrameCloseButton'], 'TOPRIGHT', FriendsFrame, 'TOPRIGHT', -35, -16)
	
	F.ReskinDropDown(_G['FriendsFrameStatusDropDown']);
	
	for i = 1, 5 do
		F.ReskinTab(_G['FriendsFrameTab'..i]);
	end
	
	for i = 1, 2 do -- Друзья
		local Tab = _G['FriendsTabHeaderTab'..i];
		F.StripTextures(Tab);
	end
	
	F.ReskinScroll(_G['FriendsFrameFriendsScrollFrameScrollBar']);
	
	F.Reskin(_G['FriendsFrameAddFriendButton'], nil, true);
	F.Reskin(_G['FriendsFrameSendMessageButton'], nil, true);
	
	F.Reskin(_G['FriendsFrameIgnorePlayerButton'], nil, true); -- Черный список
	F.Reskin(_G['FriendsFrameUnsquelchButton'], nil, true);
	-- Кто
	for i = 1, 4 do
		F.StripTextures(_G['WhoFrameColumnHeader'..i]);
		F.StyleButton(_G['WhoFrameColumnHeader'..i]);
	end
	
	F.ReskinDropDown(_G['WhoFrameDropDown']);
	
	F.StripTextures(_G['WhoListScrollFrame']);
	F.ReskinScroll(_G['WhoListScrollFrameScrollBar']);
	
	F.Reskin(_G['WhoFrameWhoButton']);
	F.Reskin(_G['WhoFrameAddFriendButton']);
	F.Reskin(_G['WhoFrameGroupInviteButton']);
	-- Гильдия
	F.StripTextures(_G['GuildFrameLFGFrame']);
	F.CreateBD(_G['GuildFrameLFGFrame']);
	F.ReskinCheck(_G['GuildFrameLFGButton']);
	
	for i = 1, 4 do
		F.StripTextures(_G['GuildFrameColumnHeader'..i]);
		F.StyleButton(_G['GuildFrameColumnHeader'..i]);
		F.StripTextures(_G['GuildFrameGuildStatusColumnHeader'..i]);
		F.StyleButton(_G['GuildFrameGuildStatusColumnHeader'..i]);
	end
	
	F.StripTextures(_G['GuildListScrollFrame']);
	F.ReskinScroll(_G['GuildListScrollFrameScrollBar']);
	
	F.ReskinArrow(_G['GuildFrameGuildListToggleButton'], 'right');
	
	F.Reskin(_G['GuildFrameGuildInformationButton']);
	F.Reskin(_G['GuildFrameAddMemberButton']);
	F.Reskin(_G['GuildFrameControlButton']);
	
	F.StripTextures(_G['GuildMemberDetailFrame']); -- Иформация о персонаже
	F.CreateBD(_G['GuildMemberDetailFrame']);
	
	F.ReskinClose(_G['GuildMemberDetailCloseButton']);
	
	F.CreateBD(_G['GuildMemberNoteBackground']);
	F.CreateGradient(_G['GuildMemberNoteBackground']);
	
	F.CreateBD(_G['GuildMemberOfficerNoteBackground']);
	F.CreateGradient(_G['GuildMemberOfficerNoteBackground']);
	
	F.Reskin(_G['GuildMemberRemoveButton']);
	F.Reskin(_G['GuildMemberGroupInviteButton']);
	
	F.StripTextures(_G['GuildInfoFrame']); -- Информация
	F.SetBD(_G['GuildInfoFrame'], 5, -6, -2, 6);
	
	F.ReskinClose(_G['GuildInfoCloseButton'], 'TOPRIGHT', GuildInfoFrame, 'TOPRIGHT', -6, -10);
	
	F.CreateBD(_G['GuildInfoTextBackground']);
	
	F.ReskinScroll(_G['GuildInfoFrameScrollFrameScrollBar']);
	
	F.Reskin(_G['GuildInfoGuildEventButton']);
	F.Reskin(_G['GuildInfoSaveButton']);
	F.Reskin(_G['GuildInfoCancelButton']);
	
	F.StripTextures(_G['GuildEventLogFrame']); -- Журнал
	F.SetBD(_G['GuildEventLogFrame'], 5, -6, -2, 6);
	
	F.ReskinClose(_G['GuildEventLogCloseButton'], 'TOPRIGHT', GuildEventLogFrame, 'TOPRIGHT', -6, -10);
	
	F.CreateBD(_G['GuildEventFrame']);
	
	F.ReskinScroll(_G['GuildEventLogScrollFrameScrollBar']);
	
	F.Reskin(_G['GuildEventLogCancelButton']);
	
	F.StripTextures(_G['GuildControlPopupFrame']); -- Управление
	F.SetBD(_G['GuildControlPopupFrame'], 3, -5, -27, 27);
	
	F.ReskinDropDown(_G['GuildControlPopupFrameDropDown']);
	--_G['GuildControlPopupFrameDropDownButton']:SetSize(16, 16);
	
	F.ReskinInput(_G['GuildControlPopupFrameEditBox']);
	
	for i = 1, 17 do
		local Checkbox = _G['GuildControlPopupFrameCheckbox'..i];
		
		if (Checkbox) then
			F.ReskinCheck(Checkbox);
		end
	end
	
	F.ReskinInput(_G['GuildControlWithdrawGoldEditBox']);
	
	for i = 1, MAX_GUILDBANK_TABS do
		local Tab = _G['GuildBankTabPermissionsTab'..i];
		F.StripTextures(Tab);
	end
	
	--_G['GuildControlPopupFrameTabPermissions'];
	
	F.ReskinCheck(_G['GuildControlTabPermissionsViewTab']);
	F.ReskinCheck(_G['GuildControlTabPermissionsDepositItems']);
	F.ReskinCheck(_G['GuildControlTabPermissionsUpdateText']);
	
	F.ReskinInput(_G['GuildControlWithdrawItemsEditBox']);
	
	--F.ReskinCheck(_G['(GuildControlPopupAcceptButton']);
	--F.ReskinCheck(_G['GuildControlPopupFrameCancelButton']);
	-- Каналы
	for i = 1, MAX_DISPLAY_CHANNEL_BUTTONS do
		F.StripTextures(_G['ChannelButton'..i]);
		F.StyleButton(_G['ChannelButton'..i]);
	end
	
	F.Kill(_G['ChannelFrameVerticalBar']);
	
	F.StripTextures(_G['ChannelRosterScrollFrame']);
	F.ReskinScroll(_G['ChannelRosterScrollFrameScrollBar']);
	
	F.Reskin(_G['ChannelFrameNewButton']);
	
	F.StripTextures(_G['ChannelFrameDaughterFrame']); -- Новый канал
	F.CreateBD(_G['ChannelFrameDaughterFrame']);
	
	F.ReskinInput(_G['ChannelFrameDaughterFrameChannelName']);
	F.ReskinInput(_G['ChannelFrameDaughterFrameChannelPassword']);
	
	F.ReskinClose(_G['ChannelFrameDaughterFrameDetailCloseButton']);
	
	F.Reskin(_G['ChannelFrameDaughterFrameOkayButton']);
	F.Reskin(_G['ChannelFrameDaughterFrameCancelButton']);
	-- Рейд
	F.Reskin(_G['RaidFrameConvertToRaidButton']);
	F.Reskin(_G['RaidFrameRaidInfoButton']);
	F.Reskin(_G['RaidFrameNotInRaidRaidBrowserButton'], nil, true);
	
	F.StripTextures(_G['RaidInfoFrame'], true); -- Информация
	F.CreateBD(_G['RaidInfoFrame']);
	
	F.ReskinClose(_G['RaidInfoCloseButton']);
	
	F.StripTextures(_G['RaidInfoInstanceLabel']);
	F.StripTextures(_G['RaidInfoIDLabel']);
	
	F.Reskin(_G['RaidInfoExtendButton'], nil, true);
	F.Reskin(_G['RaidInfoCancelButton'], nil, true);
end)