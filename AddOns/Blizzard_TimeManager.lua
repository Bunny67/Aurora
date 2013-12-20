local F, C = unpack(select(2, ...));

local _G = getfenv(0);

C.modules['Blizzard_TimeManager'] = function()
	F.StripTextures(TimeManagerFrame);
	F.SetBD(TimeManagerFrame, 14, -11, -49, 9);
	
	F.ReskinClose(TimeManagerCloseButton, 'TOPRIGHT', TimeManagerFrame, 'TOPRIGHT', -53, -15);
	
	F.StripTextures(TimeManagerStopwatchFrame);
	
	F.CreateBD(TimeManagerStopwatchCheck, .25);
	F.StyleButton(TimeManagerStopwatchCheck, nil, true);
	
	_G['TimeManagerStopwatchCheck']:GetNormalTexture():SetPoint('TOPLEFT', 1, -1);
	_G['TimeManagerStopwatchCheck']:GetNormalTexture():SetPoint('BOTTOMRIGHT', -1, 1);
	_G['TimeManagerStopwatchCheck']:GetNormalTexture():SetTexCoord(unpack(F.TexCoords));
	
	_G['TimeManagerAlarmHourDropDown']:SetWidth(80);
	F.ReskinDropDown(TimeManagerAlarmHourDropDown);
	
	_G['TimeManagerAlarmMinuteDropDown']:SetWidth(80);
	F.ReskinDropDown(TimeManagerAlarmMinuteDropDown);
	
	_G['TimeManagerAlarmAMPMDropDown']:SetWidth(90);
	F.ReskinDropDown(TimeManagerAlarmAMPMDropDown);
	
	F.ReskinInput(TimeManagerAlarmMessageEditBox);
	
	F.ReskinCheck(TimeManagerMilitaryTimeCheck);
	F.ReskinCheck(TimeManagerLocalTimeCheck);
	
	F.Reskin(TimeManagerAlarmEnabledButton, nil, true);
	
	F.StripTextures(StopwatchFrame);
	F.SetBD(StopwatchFrame, 0, -16, 0, 2);
	
	F.ReskinClose(StopwatchCloseButton, 'TOPRIGHT', StopwatchFrame, 'TOPRIGHT', 0, 6);
	
	F.StripTextures(StopwatchTabFrame);
end