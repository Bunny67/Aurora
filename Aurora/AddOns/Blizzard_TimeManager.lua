local F, C = unpack(select(2, ...));

local unpack = unpack;

local TexCoords = F.TexCoords;
local Hoop = F.dummy;

C.Modules['Blizzard_TimeManager'] = function()
	-- TimeManagerFrame;
	F.SetBD(TimeManagerFrame, 14, -11, -49, 9);
	
	F.ReskinClose(TimeManagerCloseButton, 'TOPRIGHT', TimeManagerFrame, 'TOPRIGHT', -53, -15);
	
	TimeManagerStopwatchFrameBackground:Hide();
	
	F.CreateBD(TimeManagerStopwatchCheck);
	F.StyleButton(TimeManagerStopwatchCheck, nil, true);
	
	TimeManagerStopwatchCheck:GetNormalTexture():SetPoint('TOPLEFT', 1, -1);
	TimeManagerStopwatchCheck:GetNormalTexture():SetPoint('BOTTOMRIGHT', -1, 1);
	TimeManagerStopwatchCheck:GetNormalTexture():SetTexCoord(unpack(TexCoords));
	
	TimeManagerAlarmHourDropDown:SetWidth(80);
	F.ReskinDropDown(TimeManagerAlarmHourDropDown);
	TimeManagerAlarmMinuteDropDown:SetWidth(80);
	F.ReskinDropDown(TimeManagerAlarmMinuteDropDown);
	TimeManagerAlarmAMPMDropDown:SetWidth(90);
	F.ReskinDropDown(TimeManagerAlarmAMPMDropDown);
	
	F.ReskinInput(TimeManagerAlarmMessageEditBox);
	
	TimeManagerAlarmEnabledButton:SetNormalTexture('');
	TimeManagerAlarmEnabledButton.SetNormalTexture = Hoop;
	TimeManagerAlarmEnabledButton:SetPushedTexture('');
	TimeManagerAlarmEnabledButton.SetPushedTexture = Hoop;
	F.Reskin(TimeManagerAlarmEnabledButton);
	
	F.ReskinCheck(TimeManagerMilitaryTimeCheck);
	F.ReskinCheck(TimeManagerLocalTimeCheck);
	-- TimeManagerClockButton;
	-- nil;
	-- StopwatchFrame;
	F.SetBD(StopwatchFrame, 0, -16, 0, 2);
	
	StopwatchTabFrameLeft:Hide();
	StopwatchTabFrameMiddle:Hide();
	StopwatchTabFrameRight:Hide();
	
	F.ReskinClose(StopwatchCloseButton, 'TOPRIGHT', StopwatchFrame, 'TOPRIGHT', 0, 4);
end