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
	F.CreateBD(GuildFrameLFGFrame, .25);
	
	for i = 1, 3 do
		select(i, GuildFrameLFGFrame:GetRegions()):SetTexture(nil);
	end
	
	F.ReskinCheck(GuildFrameLFGButton);
	
	do
		local Header;
		
		for i = 1, 4 do
			Header = _G['GuildFrameColumnHeader'..i];
			
			F.ReskinHeader(Header);
		end
	end
	
	do
		local Header;
		
		for i = 1, 4 do
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
	F.SetBD(GuildControlPopupFrame, 2, -6, -27, 27);
	
	for i = 1, 6 do
		select(i, GuildControlPopupFrame:GetRegions()):SetTexture(nil);
	end
	
	F.ReskinDropDown(GuildControlPopupFrameDropDown);
	
	F.ReskinExpandOrCollapse(GuildControlPopupFrameAddRankButton);
	F.ReskinExpandOrCollapse(GuildControlPopupFrameRemoveRankButton);
	GuildControlPopupFrameRemoveRankButton.Plus:Hide();
	GuildControlPopupFrameRemoveRankButton:SetPoint('LEFT', GuildControlPopupFrameAddRankButton, 'RIGHT', 1, 0);
	
	do
		local Checkbox;
		
		for i = 1, 17 do
			Checkbox = _G['GuildControlPopupFrameCheckbox'..i];
			
			if ( Checkbox ) then
				F.ReskinCheck(Checkbox);
			end
		end
	end
	
	F.ReskinInput(GuildControlWithdrawGoldEditBox, 16);
	
	F.Reskin(GuildControlPopupFrameCancelButton);
	F.Reskin(GuildControlPopupAcceptButton);
	
	F.ReskinInput(GuildControlPopupFrameEditBox, 16);
	
	F.CreateBD(GuildControlPopupFrameTabPermissions, .25);
	
	F.ReskinCheck(GuildControlTabPermissionsViewTab);
	F.ReskinCheck(GuildControlTabPermissionsDepositItems);
	F.ReskinCheck(GuildControlTabPermissionsUpdateText);
	
	F.ReskinInput(GuildControlWithdrawItemsEditBox, 16, 54);
	
	do
		local Tab;
		
		for i = 1, MAX_GUILDBANK_TABS do
			Tab = _G['GuildBankTabPermissionsTab'..i];
			
			Tab:DisableDrawLayer('BACKGROUND');
			
			Tab:SetHighlightTexture(nil);
		end
	end
	-- GuildInfoFrame;
	F.SetBD(GuildInfoFrame, 5, -6, -2, 6);
	
	GuildInfoCorner:SetTexture(nil);
	
	F.CreateBD(GuildInfoTextBackground, .25);
	
	F.ReskinScroll(GuildInfoFrameScrollFrameScrollBar);
	
	F.ReskinClose(GuildInfoCloseButton, 'TOPRIGHT', GuildInfoFrame, 'TOPRIGHT', -6, -10);
	
	F.Reskin(GuildInfoSaveButton);
	F.Reskin(GuildInfoCancelButton);
	GuildInfoCancelButton:SetPoint('LEFT', GuildInfoSaveButton, 'RIGHT', 1, 0);
	F.Reskin(GuildInfoGuildEventButton);
	
	GuildInfoFrame:SetBackdrop(nil);
	-- GuildMemberDetailFrame;
	F.CreateBD(GuildMemberDetailFrame);
	select(11, GuildMemberDetailFrame:GetRegions()):SetTexture(nil);
	
	GuildMemberDetailCorner:SetTexture(nil);
	
	F.ReskinClose(GuildMemberDetailCloseButton);
	
	F.Reskin(GuildMemberRemoveButton);
	F.Reskin(GuildMemberGroupInviteButton);
	
	F.ReskinArrow(GuildFramePromoteButton, 'Up');
	F.ReskinArrow(GuildFrameDemoteButton, 'Down');
	GuildFrameDemoteButton:SetPoint('LEFT', GuildFramePromoteButton, 'RIGHT', 1, 0);
	
	F.CreateBD(GuildMemberNoteBackground, .25);
	F.CreateBD(GuildMemberOfficerNoteBackground, .25);
	-- GuildEventLogFrame;
	F.SetBD(GuildEventLogFrame, 5, -6, -2, 6);
	select(1, GuildEventLogFrame:GetRegions()):SetTexture(nil);
	
	F.CreateBD(GuildEventFrame, .25);
	
	F.ReskinScroll(GuildEventLogScrollFrameScrollBar);
	
	F.ReskinClose(GuildEventLogCloseButton, 'TOPRIGHT', GuildEventLogFrame, 'TOPRIGHT', -6, -10);
	
	F.Reskin(GuildEventLogCancelButton);
	
	GuildEventLogFrame:SetBackdrop(nil);
	
	do
		local Tab;
		
		for i = 1, 5 do
			Tab = _G['FriendsFrameTab'..i];
			
			F.ReskinTab(Tab);
		end
	end
end);