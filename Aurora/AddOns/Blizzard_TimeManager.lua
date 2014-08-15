local F, C = unpack(select(2, ...));

local select = select;
local unpack = unpack;

local TexCoords = F.TexCoords;
local Hoop = F.dummy;

C.Modules['Blizzard_TimeManager'] = function()
	-- TimeManagerFrame;
	F:SetBD(TimeManagerFrame, 14, -11, -49, 9);
	TimeManagerGlobe:Hide();
	
	for i = 2, 5 do
		select(i, TimeManagerFrame:GetRegions()):SetTexture(nil);
	end
	
	F:ReskinClose(TimeManagerCloseButton, 'TOPRIGHT', TimeManagerFrame, 'TOPRIGHT', -53, -15);
	
	TimeManagerStopwatchFrameBackground:SetTexture(nil);
	
	F:CreateBD(TimeManagerStopwatchCheck);
	F:StyleButton(TimeManagerStopwatchCheck, nil, true);
	
	TimeManagerStopwatchCheck:GetNormalTexture():SetPoint('TOPLEFT', 1, -1);
	TimeManagerStopwatchCheck:GetNormalTexture():SetPoint('BOTTOMRIGHT', -1, 1);
	TimeManagerStopwatchCheck:GetNormalTexture():SetTexCoord(unpack(TexCoords));
	
	TimeManagerAlarmHourDropDown:SetWidth(80);
	F:ReskinDropDown(TimeManagerAlarmHourDropDown);
	TimeManagerAlarmMinuteDropDown:SetWidth(80);
	F:ReskinDropDown(TimeManagerAlarmMinuteDropDown);
	TimeManagerAlarmAMPMDropDown:SetWidth(90);
	F:ReskinDropDown(TimeManagerAlarmAMPMDropDown);
	
	F:ReskinInput(TimeManagerAlarmMessageEditBox);
	
	TimeManagerAlarmEnabledButton:SetNormalTexture(nil);
	TimeManagerAlarmEnabledButton.SetNormalTexture = Hoop;
	TimeManagerAlarmEnabledButton:SetPushedTexture(nil);
	TimeManagerAlarmEnabledButton.SetPushedTexture = Hoop;
	F:Reskin(TimeManagerAlarmEnabledButton);
	
	F:ReskinCheck(TimeManagerMilitaryTimeCheck);
	F:ReskinCheck(TimeManagerLocalTimeCheck);
	-- TimeManagerClockButton;
	-- nil;
	-- StopwatchFrame;
	F:SetBD(StopwatchFrame, 0, -16, 0, 2);
	
	StopwatchFrame:DisableDrawLayer('BACKGROUND');
	
	StopwatchTabFrameLeft:SetTexture(nil);
	StopwatchTabFrameMiddle:SetTexture(nil);
	StopwatchTabFrameRight:SetTexture(nil);
	
	F:ReskinClose(StopwatchCloseButton, 'TOPRIGHT', StopwatchFrame, 'TOPRIGHT', 0, 4);
end