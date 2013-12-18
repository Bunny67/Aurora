local F, C = unpack(select(2, ...))
-- ВРЕМЯ
C.modules["Blizzard_TimeManager"] = function()
	if AuroraConfig.TimeManager then
	-- [[ Чистка текстур ]]
		local AllTimeManagerStripTextures = {'TimeManagerFrame', 'TimeManagerStopwatchFrame', 'StopwatchFrame', 'StopwatchTabFrame'}
		for i = 1, #AllTimeManagerStripTextures do
			F.StripTextures(_G[AllTimeManagerStripTextures[i]], true)
		end
	-- [[ Выпадающая кнопка ]]
		local AllTimeManagerDropDowns = {'TimeManagerAlarmHourDropDown', 'TimeManagerAlarmMinuteDropDown', 'TimeManagerAlarmAMPMDropDown'}
		for i = 1, #AllTimeManagerDropDowns do
			F.ReskinDropDown(_G[AllTimeManagerDropDowns[i]])
		end
		
		TimeManagerAlarmHourDropDown:SetWidth(80)
		TimeManagerAlarmMinuteDropDown:SetWidth(80)
		TimeManagerAlarmAMPMDropDown:SetWidth(90)
	-- [[ Поля ввода ]]
		local AllTimeManagerInputs = {'TimeManagerAlarmMessageEditBox'}
		for i = 1, #AllTimeManagerInputs do
			F.ReskinInput(_G[AllTimeManagerInputs[i]])
		end
	-- [[ Флажки ]]
		local AllTimeManagerCheckBoxes = {'TimeManagerMilitaryTimeCheck', 'TimeManagerLocalTimeCheck'}
		for i = 1, #AllTimeManagerCheckBoxes do
			F.ReskinCheck(_G[AllTimeManagerCheckBoxes[i]])
		end
	-- [[ Кнопки ]]
		local AllTimeManagerButtons = {'TimeManagerAlarmEnabledButton'}
		for i = 1, #AllTimeManagerButtons do
			F.Reskin(_G[AllTimeManagerButtons[i]])
		end

		F.CreateBD(TimeManagerStopwatchCheck, .25)
		F.StyleButton(TimeManagerStopwatchCheck)
		TimeManagerStopwatchCheck:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
		TimeManagerStopwatchCheck:GetNormalTexture():ClearAllPoints()
		TimeManagerStopwatchCheck:GetNormalTexture():SetPoint("TOPLEFT", 1, -1)
		TimeManagerStopwatchCheck:GetNormalTexture():SetPoint("BOTTOMRIGHT", -1, 1)
		
		F.SetBD(StopwatchFrame, 0, -16, 0, 2)
		F.ReskinClose(StopwatchCloseButton, 'TOPRIGHT', StopwatchFrame, 'TOPRIGHT', 0, 6)
		
		F.SetBD(TimeManagerFrame, 14, -11, -49, 9)
		F.ReskinClose(TimeManagerCloseButton, 'TOPRIGHT', TimeManagerFrame, 'TOPRIGHT', -53, -15)
	end
end