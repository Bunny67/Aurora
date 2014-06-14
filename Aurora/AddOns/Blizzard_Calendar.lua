local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local pairs = pairs;
local ipairs = ipairs;
local select = select;

local CALENDAR_MAX_DAYS_PER_MONTH = 42;
local CALENDAR_DAYBUTTON_MAX_VISIBLE_EVENTS	= 4;

local Noop = F.dummy;

C.Modules['Blizzard_Calendar'] = function()
	F.SetBD(CalendarFrame, 11, 0, -9, 4);
	
	CalendarFrame:DisableDrawLayer('BORDER');
	
	CalendarWeekdaySelectedTexture:SetVertexColor(C.r, C.g, C.b);
	
	CalendarMonthBackground:SetAlpha(0);
	CalendarYearBackground:SetAlpha(0);
	
	CalendarTodayFrame:SetBackdrop({
		edgeFile = C.Media.Backdrop,
		edgeSize = 1
	});
	CalendarTodayFrame:SetBackdropBorderColor(C.r, C.g, C.b);
	
	CalendarTodayFrame:SetScript('OnUpdate', nil);
	
	CalendarTodayTextureGlow:Hide();
	CalendarTodayTexture:Hide();
	
	F.ReskinArrow(CalendarPrevMonthButton, 'Left');
	F.ReskinArrow(CalendarNextMonthButton, 'Right');
	
	F.CreateBD(CalendarFilterFrame, 0);
	F.CreateGradient(CalendarFilterFrame);
	
	CalendarFilterFrameLeft:Hide();
	CalendarFilterFrameMiddle:Hide();
	CalendarFilterFrameRight:Hide();
	
	CalendarFilterFrameText:SetDrawLayer('OVERLAY');
	
	do
		local DownTexture = CalendarFilterButton:CreateTexture(nil, 'ARTWORK');
		DownTexture:SetTexture(C.Media.ArrowDown);
		DownTexture:SetSize(8, 8);
		DownTexture:SetPoint('CENTER');
		DownTexture:SetVertexColor(1, 1, 1);
	end
	
	F.Reskin(CalendarFilterButton);
	
	F.ReskinClose(CalendarCloseButton, 'TOPRIGHT', CalendarFrame, 'TOPRIGHT', -13, -4);
	
	if not(IsAddOnLoaded('CowTip') or IsAddOnLoaded('TipTac') or IsAddOnLoaded('FreebTip') or IsAddOnLoaded('lolTip') or IsAddOnLoaded('StarTip') or IsAddOnLoaded('TipTop')) then
		local Tooltips = { CalendarContextMenu, CalendarArenaTeamContextMenu, CalendarInviteStatusContextMenu }

		for _, tooltip in pairs(Tooltips) do
			tooltip:SetBackdrop(nil);
			
			local BG = CreateFrame('Frame', nil, tooltip);
			BG:SetPoint('TOPLEFT', 2, -2);
			BG:SetPoint('BOTTOMRIGHT', -1, 2);
			BG:SetFrameLevel(tooltip:GetFrameLevel() - 1);
			
			F.CreateBD(BG);
		end
	end
	
	for i = 1, 7 do
		_G['CalendarWeekday'..i..'Background']:SetAlpha(0);
	end
	
	do
		local Button, EventButton;
		local EventButtonBlack;
		
		for i = 1, CALENDAR_MAX_DAYS_PER_MONTH do
			Button = _G['CalendarDayButton'..i];
			Button:DisableDrawLayer('BACKGROUND');
			Button:SetHighlightTexture(C.Media.Backdrop);
			
			Button:GetHighlightTexture():SetVertexColor(C.r, C.g, C.b, .2);
			Button:GetHighlightTexture().SetAlpha = Noop;
			Button:GetHighlightTexture():SetAllPoints();
			
			_G['CalendarDayButton'..i..'DarkFrame']:SetAlpha(.5);
			
			for j = 1, CALENDAR_DAYBUTTON_MAX_VISIBLE_EVENTS do
				EventButton = _G['CalendarDayButton'..i..'EventButton'..j];
				EventButtonBlack = _G['CalendarDayButton'..i..'EventButton'..j..'Black'];
				
				EventButton:SetHighlightTexture(C.Media.Backdrop);
			
				EventButton:GetHighlightTexture():SetVertexColor(0.9, 0.8, 0.1, .25);
				EventButton:GetHighlightTexture():SetPoint('TOPLEFT', -3, 1);
				EventButton:GetHighlightTexture():SetPoint('BOTTOMRIGHT', 4, -2);
				
				EventButtonBlack:SetTexture(C.Media.Backdrop);
				EventButtonBlack:SetVertexColor(1, 1, 1, .25);
				EventButtonBlack:SetPoint('TOPLEFT', -3, 1);
				EventButtonBlack:SetPoint('BOTTOMRIGHT', 4, -2);
			end
		end
	end
	
	for i = 1, 6 do
		local VLine = CreateFrame('Frame', nil, _G['CalendarDayButton'..i]);
		VLine:SetSize(1, 546);
		VLine:SetPoint('TOP', _G['CalendarDayButton'..i], 'TOPRIGHT');
		
		F.CreateBD(VLine);
	end
	
	for i = 1, 36, 7 do
		local HLine = CreateFrame('Frame', nil, _G['CalendarDayButton'..i]);
		HLine:SetSize(637, 1);
		HLine:SetPoint('LEFT', _G['CalendarDayButton'..i], 'TOPLEFT');
		
		F.CreateBD(HLine);
	end
	-- CalendarViewHolidayFrame;
	F.CreateBD(CalendarViewHolidayFrame);
	
	CalendarViewHolidayBackground:Hide();
	CalendarViewHolidayInfoTexture:Hide();
	CalendarViewHolidayInfoTexture.Show = Noop;
	
	for i = 1, 3 do
		select(i, CalendarViewHolidayTitleFrame:GetRegions()):Hide();
	end
	
	F.ReskinClose(CalendarViewHolidayCloseButton);
	select(4, CalendarViewHolidayCloseButton:GetRegions()):Hide();
	-- CalendarViewRaidFrame;
	F.CreateBD(CalendarViewRaidFrame);
	
	CalendarViewRaidBackground:Hide();
	
	for i = 1, 3 do
		select(i, CalendarViewRaidTitleFrame:GetRegions()):Hide();
	end
	
	F.ReskinClose(CalendarViewRaidCloseButton);
	select(4, CalendarViewRaidCloseButton:GetRegions()):Hide();
	-- CalendarViewEventFrame;
	F.CreateBD(CalendarViewEventFrame);
	
	CalendarViewEventBackground:Hide();
	
	for i = 1, 3 do
		select(i, CalendarViewEventTitleFrame:GetRegions()):Hide();
	end
	
	F.CreateBD(CalendarViewEventDescriptionContainer, .25);
	
	F.ReskinScroll(CalendarViewEventDescriptionScrollFrameScrollBar);
	
	CalendarViewEventDivider:Hide();
	
	F.Reskin(CalendarViewEventAcceptButton);
	F.Reskin(CalendarViewEventTentativeButton);
	F.Reskin(CalendarViewEventDeclineButton);
	F.Reskin(CalendarViewEventRemoveButton);
	
	F.CreateBD(CalendarViewEventInviteList, .25);
	
	F.ReskinScroll(CalendarViewEventInviteListScrollFrameScrollBar);
	
	F.ReskinClose(CalendarViewEventCloseButton);
	select(4, CalendarViewEventCloseButton:GetRegions()):Hide();
	-- CalendarCreateEventFrame;
	F.CreateBD(CalendarCreateEventFrame);
	
	CalendarCreateEventBackground:Hide();
	CalendarCreateEventFrameButtonBackground:Hide();
	
	for i = 1, 3 do
		select(i, CalendarCreateEventTitleFrame:GetRegions()):Hide();
	end
	
	F.ReskinInput(CalendarCreateEventTitleEdit);
	
	F.ReskinDropDown(CalendarCreateEventTypeDropDown);
	F.ReskinDropDown(CalendarCreateEventHourDropDown);
	CalendarCreateEventHourDropDown:SetWidth(80);
	F.ReskinDropDown(CalendarCreateEventMinuteDropDown);
	CalendarCreateEventMinuteDropDown:SetWidth(80);
	F.ReskinDropDown(CalendarCreateEventAMPMDropDown);
	CalendarCreateEventAMPMDropDown:SetWidth(90);
	F.ReskinDropDown(CalendarCreateEventRepeatOptionDropDown);
	
	F.CreateBD(CalendarCreateEventDescriptionContainer, .25);
	
	F.ReskinScroll(CalendarCreateEventDescriptionScrollFrameScrollBar);
	
	CalendarCreateEventDivider:Hide();
	
	F.ReskinCheck(CalendarCreateEventAutoApproveCheck);
	F.ReskinCheck(CalendarCreateEventLockEventCheck);
	
	F.CreateBD(CalendarCreateEventInviteList, .25);
	
	F.ReskinScroll(CalendarCreateEventInviteListScrollFrameScrollBar);
	
	F.ReskinInput(CalendarCreateEventInviteEdit);
	CalendarCreateEventInviteEdit:SetPoint('TOPLEFT', CalendarCreateEventInviteList, 'BOTTOMLEFT', 2, -3);
	
	F.Reskin(CalendarCreateEventInviteButton);
	CalendarCreateEventInviteButton:SetPoint('TOPLEFT', CalendarCreateEventInviteEdit, 'TOPRIGHT', 1, 1);
	
	F.Reskin(CalendarCreateEventMassInviteButton);
	CalendarCreateEventMassInviteButtonBorder:Hide();
	F.Reskin(CalendarCreateEventRaidInviteButton);
	CalendarCreateEventRaidInviteButtonBorder:Hide();
	F.Reskin(CalendarCreateEventCreateButton);
	CalendarCreateEventCreateButtonBorder:Hide();
	
	F.ReskinClose(CalendarCreateEventCloseButton);
	select(4, CalendarCreateEventCloseButton:GetRegions()):Hide();
	-- CalendarMassInviteFrame;
	F.CreateBD(CalendarMassInviteFrame);
	
	CalendarMassInviteFrameDivider:Hide();
	
	for i = 1, 3 do
		select(i, CalendarMassInviteTitleFrame:GetRegions()):Hide();
	end
	
	F.ReskinInput(CalendarMassInviteGuildMinLevelEdit);
	F.ReskinInput(CalendarMassInviteGuildMaxLevelEdit);
	
	F.ReskinDropDown(CalendarMassInviteGuildRankMenu);
	
	F.Reskin(CalendarMassInviteGuildAcceptButton);
	F.Reskin(CalendarMassInviteArenaButton2);
	F.Reskin(CalendarMassInviteArenaButton3);
	F.Reskin(CalendarMassInviteArenaButton5);
	
	F.ReskinClose(CalendarMassInviteCloseButton);
	select(4, CalendarMassInviteCloseButton:GetRegions()):Hide();
	-- CalendarEventPickerFrame;
	F.CreateBD(CalendarEventPickerFrame);
	
	CalendarEventPickerFrameButtonBackground:Hide();
	
	for i = 1, 3 do
		select(i, CalendarEventPickerTitleFrame:GetRegions()):Hide();
	end
	
	F.ReskinScroll(CalendarEventPickerScrollBar);
	
	F.Reskin(CalendarEventPickerCloseButton);
	CalendarEventPickerCloseButtonBorder:Hide();
	-- CalendarTexturePickerFrame;
	F.CreateBD(CalendarTexturePickerFrame);
	
	CalendarTexturePickerFrameButtonBackground:Hide();
	
	for i = 1, 3 do
		select(i, CalendarTexturePickerTitleFrame:GetRegions()):Hide();
	end
	
	F.ReskinScroll(CalendarTexturePickerScrollBar);
	
	F.Reskin(CalendarTexturePickerCancelButton);
	CalendarTexturePickerCancelButtonBorder:Hide();
	F.Reskin(CalendarTexturePickerAcceptButton);
	CalendarTexturePickerAcceptButtonBorder:Hide();
	-- CalendarClassButtonContainer;
	do
		local Button, ButtonIcon;
		local TCoords;
		
		for i, class in ipairs(CLASS_SORT_ORDER) do
			Button = _G['CalendarClassButton'..i];
			
			F.CreateBG(Button);
			Button:GetRegions():Hide();
			
			TCoords = CLASS_ICON_TCOORDS[class]
			
			ButtonIcon = Button:GetNormalTexture();
			ButtonIcon:SetTexCoord(TCoords[1] + 0.015, TCoords[2] - 0.02, TCoords[3] + 0.018, TCoords[4] - 0.02);
		end
	end
	
	CalendarClassButton1:SetPoint('TOPLEFT', CalendarClassButtonContainer, 'TOPLEFT', 5, 0);
	
	F.CreateBD(CalendarClassTotalsButton);
	CalendarClassTotalsButtonBackgroundTop:Hide();
	CalendarClassTotalsButtonBackgroundMiddle:Hide();
	CalendarClassTotalsButtonBackgroundBottom:Hide();
	
	hooksecurefunc('CalendarFrame_SetToday', function()
		CalendarTodayFrame:SetAllPoints();
	end);
end