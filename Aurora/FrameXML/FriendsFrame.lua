local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local pairs = pairs;
local tinsert = table.insert;

tinsert(C.Modules['Aurora'], function()
	-- FriendsFrame;
	F.SetBD(FriendsFrame, 11, -12, -34, 74);
	
	FriendsFrame:DisableDrawLayer('BACKGROUND');
	FriendsFrame:DisableDrawLayer('ARTWORK');
	
	F.ReskinClose(FriendsFrameCloseButton, 'TOPRIGHT', FriendsFrame, 'TOPRIGHT', -38, -16)
	
	FriendsFrameStatusDropDown:ClearAllPoints();
	FriendsFrameStatusDropDown:SetPoint('TOPLEFT', FriendsFrame, 'TOPLEFT', 10, -28);
	F.ReskinDropDown(FriendsFrameStatusDropDown);
	
	F.ReskinInput(FriendsFrameBroadcastInput);
	
	do
		local Tab;
		
		for i = 1, 3 do
			Tab = _G['FriendsTabHeaderTab'..i];
			
			Tab:DisableDrawLayer('BACKGROUND');
			
			Tab:SetHighlightTexture(nil);
		end
	end
	
	F.Reskin(FriendsFrameAddFriendButton, nil, true);
	F.Reskin(FriendsFrameSendMessageButton, nil, true);
	
	F.ReskinScroll(FriendsFrameFriendsScrollFrameScrollBar);
	
	do
		local Button;
		
		for i = 1, FRIENDS_TO_DISPLAY do
			Button = _G['FriendsFrameFriendsScrollFrameButton'..i];
			
			Button.background:Hide();

			F.StyleButton(Button);
		end
	end
	
	F.Reskin(FriendsFrameIgnorePlayerButton, nil, true);
	F.Reskin(FriendsFrameUnsquelchButton, nil, true);
	F.Reskin(FriendsFrameMutePlayerButton, nil, true);
	
	F.ReskinScroll(FriendsFrameIgnoreScrollFrameScrollBar);
	-- WhoFrame;
	do
		local Header;
		
		for i = 1, 4 do
			Header = _G['WhoFrameColumnHeader'..i];
			
			Header:DisableDrawLayer('BACKGROUND');
			
			F.StyleButton(Header);
		end
	end
	
	F.ReskinDropDown(WhoFrameDropDown);
	
	F.Reskin(WhoFrameGroupInviteButton);
	F.Reskin(WhoFrameAddFriendButton);
	WhoFrameAddFriendButton:SetPoint('RIGHT', WhoFrameGroupInviteButton, 'LEFT', -1, 0);
	F.Reskin(WhoFrameWhoButton);
	WhoFrameWhoButton:SetPoint('RIGHT', WhoFrameAddFriendButton, 'LEFT', -1, 0);
	
	WhoListScrollFrame:DisableDrawLayer('BACKGROUND');
	F.ReskinScroll(WhoListScrollFrameScrollBar);
	-- GuildFrame;
	GuildFrameLFGFrame:DisableDrawLayer('BACKGROUND');
	F.CreateBD(GuildFrameLFGFrame, .25);
	
	F.ReskinCheck(GuildFrameLFGButton);
	
	do
		local Header;
		
		for i = 1, 4 do
			Header = _G['GuildFrameColumnHeader'..i];
			Header = _G['GuildFrameGuildStatusColumnHeader'..i];
			
			F.ReskinHeader(Header);
		end
	end
	
	GuildListScrollFrame:DisableDrawLayer('BACKGROUND');
	F.ReskinScroll(GuildListScrollFrameScrollBar);
	
	F.ReskinArrow(GuildFrameGuildListToggleButton, 'Right');
	
	F.Reskin(GuildFrameControlButton);
	F.Reskin(GuildFrameAddMemberButton);
	F.Reskin(GuildFrameGuildInformationButton);
	-- GuildControlPopupFrame;
	
	
	F.StripTextures(GuildMemberDetailFrame); -- Иформация о персонаже
	F.CreateBD(GuildMemberDetailFrame);
	
	F.ReskinClose(GuildMemberDetailCloseButton);
	
	F.CreateBD(GuildMemberNoteBackground, .25);
	
	F.CreateBD(GuildMemberOfficerNoteBackground, .25);
	
	F.Reskin(GuildMemberRemoveButton);
	F.Reskin(GuildMemberGroupInviteButton);
	
	F.StripTextures(GuildInfoFrame); -- Информация
	F.SetBD(GuildInfoFrame, 5, -6, -2, 6);
	
	F.ReskinClose(GuildInfoCloseButton, 'TOPRIGHT', GuildInfoFrame, 'TOPRIGHT', -6, -10);
	
	F.CreateBD(GuildInfoTextBackground, .25);
	
	F.ReskinScroll(GuildInfoFrameScrollFrameScrollBar);
	
	F.Reskin(GuildInfoGuildEventButton);
	F.Reskin(GuildInfoSaveButton);
	F.Reskin(GuildInfoCancelButton);
	
	F.StripTextures(GuildEventLogFrame); -- Журнал
	F.SetBD(GuildEventLogFrame, 5, -6, -2, 6);
	
	F.ReskinClose(GuildEventLogCloseButton, 'TOPRIGHT', GuildEventLogFrame, 'TOPRIGHT', -6, -10);
	
	F.CreateBD(GuildEventFrame, .25);
	
	F.ReskinScroll(GuildEventLogScrollFrameScrollBar);
	
	F.Reskin(GuildEventLogCancelButton);
	
	F.StripTextures(GuildControlPopupFrame); -- Управление
	F.SetBD(GuildControlPopupFrame, 3, -5, -27, 27);
	
	F.ReskinDropDown(GuildControlPopupFrameDropDown);
	--_G['GuildControlPopupFrameDropDownButton']:SetSize(16, 16);
	
	F.ReskinExpandOrCollapse(GuildControlPopupFrameAddRankButton);
	
	F.ReskinInput(GuildControlPopupFrameEditBox, 14);
	
	for i = 1, 17 do
		local Checkbox = _G['GuildControlPopupFrameCheckbox'..i];
		
		if (Checkbox) then
			F.ReskinCheck(Checkbox);
		end
	end
	
	F.ReskinInput(GuildControlWithdrawGoldEditBox, 14);
	
	for i = 1, MAX_GUILDBANK_TABS do
		local Tab = _G['GuildBankTabPermissionsTab'..i];
		
		F.StripTextures(Tab);
	end
	
	--_G['GuildControlPopupFrameTabPermissions'];
	
	F.ReskinCheck(GuildControlTabPermissionsViewTab);
	F.ReskinCheck(GuildControlTabPermissionsDepositItems);
	F.ReskinCheck(GuildControlTabPermissionsUpdateText);
	
	F.ReskinInput(GuildControlWithdrawItemsEditBox, 14);
	
	F.Reskin(GuildControlPopupAcceptButton);
	F.Reskin(GuildControlPopupFrameCancelButton);
	
	do
		local Tab;
		
		for i = 1, 5 do
			Tab = _G['FriendsFrameTab'..i];
			
			F.ReskinTab(Tab);
		end
	end
end);