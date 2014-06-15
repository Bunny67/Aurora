local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	-- AudioOptionsSoundPanel;
	F.ReskinCheck(AudioOptionsSoundPanelEnableSound);
	
	F.CreateBD(AudioOptionsSoundPanelPlayback, .25);
	
	F.ReskinCheck(AudioOptionsSoundPanelSoundEffects);
	F.ReskinCheck(AudioOptionsSoundPanelErrorSpeech);
	F.ReskinCheck(AudioOptionsSoundPanelEmoteSounds);
	F.ReskinCheck(AudioOptionsSoundPanelPetSounds);
	F.ReskinCheck(AudioOptionsSoundPanelMusic);
	F.ReskinCheck(AudioOptionsSoundPanelLoopMusic);
	F.ReskinCheck(AudioOptionsSoundPanelAmbientSounds);
	F.ReskinCheck(AudioOptionsSoundPanelSoundInBG);
	F.ReskinCheck(AudioOptionsSoundPanelReverb);
	F.ReskinCheck(AudioOptionsSoundPanelHRTF);
	F.ReskinCheck(AudioOptionsSoundPanelEnableDSPs);
	
	F.ReskinSlider(AudioOptionsSoundPanelSoundQuality);
	
	F.CreateBD(AudioOptionsSoundPanelHardware, .25);
	
	F.ReskinDropDown(AudioOptionsSoundPanelHardwareDropDown);
	
	F.ReskinSlider(AudioOptionsSoundPanelSoundChannels);
	
	F.ReskinCheck(AudioOptionsSoundPanelUseHardware);
	
	F.CreateBD(AudioOptionsSoundPanelVolume, .25);
	
	F.ReskinSlider(AudioOptionsSoundPanelMasterVolume);
	F.ReskinSlider(AudioOptionsSoundPanelSoundVolume);
	F.ReskinSlider(AudioOptionsSoundPanelMusicVolume);
	F.ReskinSlider(AudioOptionsSoundPanelAmbienceVolume);
end);