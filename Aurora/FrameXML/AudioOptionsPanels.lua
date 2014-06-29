local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local tinsert = table.insert;

local AUDIO_OPTIONS_CHECK = {
	'AudioOptionsSoundPanelEnableSound',
	'AudioOptionsSoundPanelSoundEffects',
	'AudioOptionsSoundPanelErrorSpeech',
	'AudioOptionsSoundPanelEmoteSounds',
	'AudioOptionsSoundPanelPetSounds',
	'AudioOptionsSoundPanelMusic',
	'AudioOptionsSoundPanelLoopMusic',
	'AudioOptionsSoundPanelAmbientSounds',
	'AudioOptionsSoundPanelSoundInBG',
	'AudioOptionsSoundPanelReverb',
	'AudioOptionsSoundPanelHRTF',
	'AudioOptionsSoundPanelEnableDSPs',
	'AudioOptionsSoundPanelUseHardware'
};

local AUDIO_OPTIONS_SLIDER = {
	'AudioOptionsSoundPanelSoundQuality',
	'AudioOptionsSoundPanelSoundChannels',
	'AudioOptionsSoundPanelMasterVolume',
	'AudioOptionsSoundPanelSoundVolume',
	'AudioOptionsSoundPanelMusicVolume',
	'AudioOptionsSoundPanelAmbienceVolume'
};

tinsert(C.Modules['Aurora'], function()
	do
		local Check;
	
		for i = 1, #AUDIO_OPTIONS_CHECK do
			Check = _G[AUDIO_OPTIONS_CHECK[i]];
			
			F.ReskinCheck(Check);
		end
	end
	
	F.CreateBD(AudioOptionsSoundPanelPlayback, .25);
	
	do
		local Slider;
	
		for i = 1, #AUDIO_OPTIONS_SLIDER do
			Slider = _G[AUDIO_OPTIONS_SLIDER[i]];
			
			F.ReskinSlider(Slider);
		end
	end
	
	F.CreateBD(AudioOptionsSoundPanelHardware, .25);
	
	F.ReskinDropDown(AudioOptionsSoundPanelHardwareDropDown);
	
	F.CreateBD(AudioOptionsSoundPanelVolume, .25);
end);