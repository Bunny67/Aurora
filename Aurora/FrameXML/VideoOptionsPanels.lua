local F, C = unpack(select(2, ...));

local tinsert = table.insert;

tinsert(C.Modules['Aurora'], function()
	-- VideoOptionsResolutionPanel;
	F.ReskinDropDown(VideoOptionsResolutionPanelResolutionDropDown);
	F.ReskinDropDown(VideoOptionsResolutionPanelRefreshDropDown);
	F.ReskinDropDown(VideoOptionsResolutionPanelMultiSampleDropDown);
	
	F.ReskinCheck(VideoOptionsResolutionPanelUseUIScale);
	
	F.ReskinSlider(VideoOptionsResolutionPanelUIScaleSlider);
	
	F.ReskinCheck(VideoOptionsResolutionPanelVSync);
	F.ReskinCheck(VideoOptionsResolutionPanelTripleBuffer);
	F.ReskinCheck(VideoOptionsResolutionPanelHardwareCursor);
	F.ReskinCheck(VideoOptionsResolutionPanelFixInputLag);
	F.ReskinCheck(VideoOptionsResolutionPanelWindowed);
	F.ReskinCheck(VideoOptionsResolutionPanelMaximized);
	F.ReskinCheck(VideoOptionsResolutionPanelDisableResize);
	
	F.CreateBD(VideoOptionsResolutionPanelBrightness, .25);
	
	F.ReskinCheck(VideoOptionsResolutionPanelDesktopGamma);
	
	F.ReskinSlider(VideoOptionsResolutionPanelGammaSlider);
	-- VideoOptionsEffectsPanel;
	F.CreateBD(VideoOptionsEffectsPanelQuality, .25);
	
	F.ReskinSlider(VideoOptionsEffectsPanelQualitySlider);
	F.ReskinSlider(VideoOptionsEffectsPanelViewDistance);
	F.ReskinSlider(VideoOptionsEffectsPanelTerrainDetail);
	F.ReskinSlider(VideoOptionsEffectsPanelParticleDensity);
	F.ReskinSlider(VideoOptionsEffectsPanelShadowQuality);
	F.ReskinSlider(VideoOptionsEffectsPanelEnvironmentDetail);
	F.ReskinSlider(VideoOptionsEffectsPanelClutterDensity);
	F.ReskinSlider(VideoOptionsEffectsPanelClutterRadius);
	F.ReskinSlider(VideoOptionsEffectsPanelTextureResolution);
	F.ReskinSlider(VideoOptionsEffectsPanelTextureFiltering);
	F.ReskinSlider(VideoOptionsEffectsPanelWeatherIntensity);
	F.ReskinSlider(VideoOptionsEffectsPanelPlayerTexture);
	
	F.CreateBD(VideoOptionsEffectsPanelShaders, .25);
	
	F.ReskinCheck(VideoOptionsEffectsPanelSpecularLighting);
	F.ReskinCheck(VideoOptionsEffectsPanelFullScreenGlow);
	F.ReskinCheck(VideoOptionsEffectsPanelDeathEffect);
	F.ReskinCheck(VideoOptionsEffectsPanelProjectedTextures);
	-- VideoOptionsStereoPanel;
	F.ReskinCheck(VideoOptionsStereoPanelEnabled);
	F.ReskinCheck(VideoOptionsStereoPanelHardwareCursor);
	
	F.ReskinSlider(VideoOptionsStereoPanelConvergence);
	F.ReskinSlider(VideoOptionsStereoPanelEyeSeparation);
end);