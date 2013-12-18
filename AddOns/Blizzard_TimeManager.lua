local F, C = unpack(select(2, ...));

local _G = getfenv(0);

C.modules['Blizzard_TimeManager'] = function()
	F.StripTextures(_G['TimeManagerFrame']);
	F.SetBD(_G['TimeManagerFrame'], 14, -11, -49, 9);
	
	F.ReskinClose(_G['TimeManagerCloseButton'], 'TOPRIGHT', TimeManagerFrame, 'TOPRIGHT', -53, -15);
	
	F.StripTextures(_G['TimeManagerStopwatchFrame']);
	
	F.CreateBD(_G['TimeManagerStopwatchCheck'], .25);
	F.StyleButton(_G['TimeManagerStopwatchCheck'], nil, true);
	
	_G['TimeManagerStopwatchCheck']:GetNormalTexture():SetPoint('TOPLEFT', 1, -1);
	_G['TimeManagerStopwatchCheck']:GetNormalTexture():SetPoint('BOTTOMRIGHT', -1, 1);
	_G['TimeManagerStopwatchCheck']:GetNormalTexture():SetTexCoord(unpack(F.TexCoords));
	
	_G['TimeManagerAlarmHourDropDown']:SetWidth(80);
	F.ReskinDropDown(_G['TimeManagerAlarmHourDropDown']);
	
	_G['TimeManagerAlarmMinuteDropDown']:SetWidth(80);
	F.ReskinDropDown(_G['TimeManagerAlarmMinuteDropDown']);
	
	_G['TimeManagerAlarmAMPMDropDown']:SetWidth(90);
	F.ReskinDropDown(_G['TimeManagerAlarmAMPMDropDown']);
	
	F.ReskinInput(_G['TimeManagerAlarmMessageEditBox']);
	
	F.ReskinCheck(_G['TimeManagerMilitaryTimeCheck']);
	F.ReskinCheck(_G['TimeManagerLocalTimeCheck']);
	
	F.Reskin(_G['TimeManagerAlarmEnabledButton'], nil, true);
	
	F.StripTextures(_G['StopwatchFrame']);
	F.SetBD(_G['StopwatchFrame'], 0, -16, 0, 2);
	
	F.ReskinClose(_G['StopwatchCloseButton'], 'TOPRIGHT', StopwatchFrame, 'TOPRIGHT', 0, 6);
	
	F.StripTextures(_G['StopwatchTabFrame']);
end