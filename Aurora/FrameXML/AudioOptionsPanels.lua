local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

local CHECK = {
	'EnableSound',
	'SoundEffects',
	'ErrorSpeech',
	'EmoteSounds',
	'PetSounds',
	'Music',
	'LoopMusic',
	'AmbientSounds',
	'SoundInBG',
	'Reverb',
	'HRTF',
	'EnableDSPs',
	'UseHardware'
};

local SLIDER = {
	'SoundQuality',
	'SoundChannels',
	'MasterVolume',
	'SoundVolume',
	'MusicVolume',
	'AmbienceVolume'
};

tinsert(C.Modules['Aurora'], function()
	do
		local NumCheck = #CHECK;
		local Check;
		
		for i = 1, NumCheck do
			Check = _G['AudioOptionsSoundPanel'..CHECK[i]];
			
			F:ReskinCheck(Check);
		end
	end
	
	F:CreateBD(AudioOptionsSoundPanelPlayback, .25);
	
	do
		local NumSlider = #SLIDER;
		local Slider;
		
		for i = 1, NumSlider do
			Slider = _G['AudioOptionsSoundPanel'..SLIDER[i]];
			
			F:ReskinSlider(Slider);
		end
	end
	
	F:CreateBD(AudioOptionsSoundPanelHardware, .25);
	
	F:ReskinDropDown(AudioOptionsSoundPanelHardwareDropDown);
	
	F:CreateBD(AudioOptionsSoundPanelVolume, .25);
end);