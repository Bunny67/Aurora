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
	F.StripTextures(GuildFrameLFGFrame);
	F.CreateBD(GuildFrameLFGFrame, .25);
	F.ReskinCheck(GuildFrameLFGButton);
	
	for i = 1, 4 do
		local Header1 = _G['GuildFrameColumnHeader'..i];
		local Header2 = _G['GuildFrameGuildStatusColumnHeader'..i];
		
		local Headers = { Header1, Header2 };
		for _, Header in pairs(Headers) do
			F.StripTextures(Header);
			
			Header:SetHighlightTexture(C.Media.Backdrop);
			local Highlight = Header:GetHighlightTexture();
			Highlight:ClearAllPoints();
			Highlight:SetPoint('TOPLEFT', 3, -4);
			Highlight:SetPoint('BOTTOMRIGHT', -2, 4);
			Highlight:SetVertexColor(C.r, C.g, C.b, .25);
			
			local HeaderBG = CreateFrame('Frame', nil, Header);
			HeaderBG:SetPoint('TOPLEFT', 2, -3);
			HeaderBG:SetPoint('BOTTOMRIGHT', -1, 3);
			HeaderBG:SetFrameLevel(Header:GetFrameLevel() - 1);
			F.CreateBD(HeaderBG, 0);
			F.CreateGradient(HeaderBG);
		end
	end
	
	F.StripTextures(GuildListScrollFrame);
	F.ReskinScroll(GuildListScrollFrameScrollBar);
	
	F.ReskinArrow(GuildFrameGuildListToggleButton, 'Right');
	
	F.Reskin(GuildFrameGuildInformationButton);
	F.Reskin(GuildFrameAddMemberButton);
	F.Reskin(GuildFrameControlButton);
	
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