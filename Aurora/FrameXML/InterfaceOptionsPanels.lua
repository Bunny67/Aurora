local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	-- InterfaceOptionsControlsPanel;
	F.ReskinCheck(InterfaceOptionsControlsPanelStickyTargeting);
	F.ReskinCheck(InterfaceOptionsControlsPanelAutoDismount);
	F.ReskinCheck(InterfaceOptionsControlsPanelAutoClearAFK);
	F.ReskinCheck(InterfaceOptionsControlsPanelBlockTrades);
	F.ReskinCheck(InterfaceOptionsControlsPanelLootAtMouse);
	F.ReskinCheck(InterfaceOptionsControlsPanelAutoLootCorpse);
	
	F.ReskinDropDown(InterfaceOptionsControlsPanelAutoLootKeyDropDown);
	-- InterfaceOptionsCombatPanel;
	F.ReskinCheck(InterfaceOptionsCombatPanelAttackOnAssist);
	F.ReskinCheck(InterfaceOptionsCombatPanelAutoRange);
	F.ReskinCheck(InterfaceOptionsCombatPanelStopAutoAttack);
	F.ReskinCheck(InterfaceOptionsCombatPanelNameplateClassColors);
	F.ReskinCheck(InterfaceOptionsCombatPanelAutoSelfCast);
	
	F.ReskinDropDown(InterfaceOptionsCombatPanelSelfCastKeyDropDown);
	
	F.ReskinCheck(InterfaceOptionsCombatPanelEnemyCastBarsOnPortrait);
	F.ReskinCheck(InterfaceOptionsCombatPanelEnemyCastBarsOnNameplates);
	F.ReskinCheck(InterfaceOptionsCombatPanelTargetOfTarget);
	
	F.ReskinDropDown(InterfaceOptionsCombatPanelTOTDropDown);
	F.ReskinDropDown(InterfaceOptionsCombatPanelFocusCastKeyDropDown);
	-- InterfaceOptionsDisplayPanel;
	F.ReskinCheck(InterfaceOptionsDisplayPanelShowCloak);
	F.ReskinCheck(InterfaceOptionsDisplayPanelShowHelm);
	F.ReskinCheck(InterfaceOptionsDisplayPanelRotateMinimap);
	F.ReskinCheck(InterfaceOptionsDisplayPanelScreenEdgeFlash);
	F.ReskinCheck(InterfaceOptionsDisplayPanelDetailedLootInfo);
	F.ReskinCheck(InterfaceOptionsDisplayPanelShowFreeBagSpace);
	F.ReskinCheck(InterfaceOptionsDisplayPanelShowClock);
	
	F.ReskinDropDown(InterfaceOptionsDisplayPanelAggroWarningDisplay);
	
	F.ReskinCheck(InterfaceOptionsDisplayPanelShowAggroPercentage);
	F.ReskinCheck(InterfaceOptionsDisplayPanelPlayAggroSounds);
	F.ReskinCheck(InterfaceOptionsDisplayPanelColorblindMode);
	F.ReskinCheck(InterfaceOptionsDisplayPanelShowItemLevel);
	
	F.ReskinDropDown(InterfaceOptionsDisplayPanelWorldPVPObjectiveDisplay);
	
	F.ReskinCheck(InterfaceOptionsDisplayPanelCinematicSubtitles);
	-- InterfaceOptionsObjectivesPanel;
	F.ReskinCheck(InterfaceOptionsObjectivesPanelInstantQuestText);
	F.ReskinCheck(InterfaceOptionsObjectivesPanelAutoQuestTracking);
	F.ReskinCheck(InterfaceOptionsObjectivesPanelAutoQuestProgress);
	F.ReskinCheck(InterfaceOptionsObjectivesPanelMapQuestDifficulty);
	F.ReskinCheck(InterfaceOptionsObjectivesPanelAdvancedWorldMap);
	F.ReskinCheck(InterfaceOptionsObjectivesPanelWatchFrameWidth);
	-- InterfaceOptionsSocialPanel;
	F.ReskinCheck(InterfaceOptionsSocialPanelProfanityFilter);
	F.ReskinCheck(InterfaceOptionsSocialPanelChatBubbles);
	F.ReskinCheck(InterfaceOptionsSocialPanelPartyChat);
	F.ReskinCheck(InterfaceOptionsSocialPanelSpamFilter);
	F.ReskinCheck(InterfaceOptionsSocialPanelChatHoverDelay);
	F.ReskinCheck(InterfaceOptionsSocialPanelGuildMemberAlert);
	F.ReskinCheck(InterfaceOptionsSocialPanelGuildRecruitment);
	F.ReskinCheck(InterfaceOptionsSocialPanelChatMouseScroll);
	
	F.ReskinDropDown(InterfaceOptionsSocialPanelChatStyle);
	
	F.ReskinCheck(InterfaceOptionsSocialPanelWholeChatWindowClickable);
	
	F.ReskinDropDown(InterfaceOptionsSocialPanelConversationMode);
	F.ReskinDropDown(InterfaceOptionsSocialPanelTimestamps);
	-- InterfaceOptionsActionBarsPanel;
	F.ReskinCheck(InterfaceOptionsActionBarsPanelBottomLeft);
	F.ReskinCheck(InterfaceOptionsActionBarsPanelBottomRight);
	F.ReskinCheck(InterfaceOptionsActionBarsPanelRight);
	F.ReskinCheck(InterfaceOptionsActionBarsPanelRightTwo);
	F.ReskinCheck(InterfaceOptionsActionBarsPanelLockActionBars);
	F.ReskinCheck(InterfaceOptionsActionBarsPanelAlwaysShowActionBars);
	F.ReskinCheck(InterfaceOptionsActionBarsPanelSecureAbilityToggle);
	-- InterfaceOptionsNamesPanel;
	F.ReskinCheck(InterfaceOptionsNamesPanelMyName);
	F.ReskinCheck(InterfaceOptionsNamesPanelNPCNames);
	F.ReskinCheck(InterfaceOptionsNamesPanelNonCombatCreature);
	F.ReskinCheck(InterfaceOptionsNamesPanelGuilds);
	F.ReskinCheck(InterfaceOptionsNamesPanelTitles);
	F.ReskinCheck(InterfaceOptionsNamesPanelFriendlyPlayerNames);
	F.ReskinCheck(InterfaceOptionsNamesPanelFriendlyPets);
	F.ReskinCheck(InterfaceOptionsNamesPanelFriendlyGuardians);
	F.ReskinCheck(InterfaceOptionsNamesPanelFriendlyTotems);
	F.ReskinCheck(InterfaceOptionsNamesPanelEnemyPlayerNames);
	F.ReskinCheck(InterfaceOptionsNamesPanelEnemyPets);
	F.ReskinCheck(InterfaceOptionsNamesPanelEnemyGuardians);
	F.ReskinCheck(InterfaceOptionsNamesPanelEnemyTotems);
	F.ReskinCheck(InterfaceOptionsNamesPanelUnitNameplatesAllowOverlap);
	F.ReskinCheck(InterfaceOptionsNamesPanelUnitNameplatesFriends);
	F.ReskinCheck(InterfaceOptionsNamesPanelUnitNameplatesFriendlyPets);
	F.ReskinCheck(InterfaceOptionsNamesPanelUnitNameplatesFriendlyGuardians);
	F.ReskinCheck(InterfaceOptionsNamesPanelUnitNameplatesFriendlyTotems);
	F.ReskinCheck(InterfaceOptionsNamesPanelUnitNameplatesEnemies);
	F.ReskinCheck(InterfaceOptionsNamesPanelUnitNameplatesEnemyPets);
	F.ReskinCheck(InterfaceOptionsNamesPanelUnitNameplatesEnemyGuardians);
	F.ReskinCheck(InterfaceOptionsNamesPanelUnitNameplatesEnemyTotems);
	-- InterfaceOptionsCombatTextPanel;
	F.ReskinCheck(InterfaceOptionsCombatTextPanelTargetDamage);
	F.ReskinCheck(InterfaceOptionsCombatTextPanelPeriodicDamage);
	F.ReskinCheck(InterfaceOptionsCombatTextPanelPetDamage);
	F.ReskinCheck(InterfaceOptionsCombatTextPanelHealing);
	F.ReskinCheck(InterfaceOptionsCombatTextPanelTargetEffects);
	F.ReskinCheck(InterfaceOptionsCombatTextPanelOtherTargetEffects);
	F.ReskinCheck(InterfaceOptionsCombatTextPanelEnableFCT);
	
	F.ReskinDropDown(InterfaceOptionsCombatTextPanelFCTDropDown);
	
	F.ReskinCheck(InterfaceOptionsCombatTextPanelDodgeParryMiss);
	F.ReskinCheck(InterfaceOptionsCombatTextPanelDamageReduction);
	F.ReskinCheck(InterfaceOptionsCombatTextPanelRepChanges);
	F.ReskinCheck(InterfaceOptionsCombatTextPanelReactiveAbilities);
	F.ReskinCheck(InterfaceOptionsCombatTextPanelFriendlyHealerNames);
	F.ReskinCheck(InterfaceOptionsCombatTextPanelCombatState);
	F.ReskinCheck(InterfaceOptionsCombatTextPanelComboPoints);
	F.ReskinCheck(InterfaceOptionsCombatTextPanelLowManaHealth);
	F.ReskinCheck(InterfaceOptionsCombatTextPanelEnergyGains);
	F.ReskinCheck(InterfaceOptionsCombatTextPanelPeriodicEnergyGains);
	F.ReskinCheck(InterfaceOptionsCombatTextPanelHonorGains);
	F.ReskinCheck(InterfaceOptionsCombatTextPanelAuras);
	-- InterfaceOptionsStatusTextPanel;
	F.ReskinCheck(InterfaceOptionsStatusTextPanelPlayer);
	F.ReskinCheck(InterfaceOptionsStatusTextPanelPet);
	F.ReskinCheck(InterfaceOptionsStatusTextPanelParty);
	F.ReskinCheck(InterfaceOptionsStatusTextPanelTarget);
	F.ReskinCheck(InterfaceOptionsStatusTextPanelPercentages);
	F.ReskinCheck(InterfaceOptionsStatusTextPanelXP);
	-- InterfaceOptionsUnitFramePanel;
	F.ReskinCheck(InterfaceOptionsUnitFramePanelPartyBackground);
	F.ReskinCheck(InterfaceOptionsUnitFramePanelPartyInRaid);
	F.ReskinCheck(InterfaceOptionsUnitFramePanelPartyPets);
	F.ReskinCheck(InterfaceOptionsUnitFramePanelRaidRange);
	F.ReskinCheck(InterfaceOptionsUnitFramePanelArenaEnemyFrames);
	F.ReskinCheck(InterfaceOptionsUnitFramePanelArenaEnemyCastBar);
	F.ReskinCheck(InterfaceOptionsUnitFramePanelArenaEnemyPets);
	F.ReskinCheck(InterfaceOptionsUnitFramePanelFullSizeFocusFrame);
	-- InterfaceOptionsBuffsPanel;
	F.ReskinCheck(InterfaceOptionsBuffsPanelBuffDurations);
	F.ReskinCheck(InterfaceOptionsBuffsPanelDispellableDebuffs);
	F.ReskinCheck(InterfaceOptionsBuffsPanelCastableBuffs);
	F.ReskinCheck(InterfaceOptionsBuffsPanelConsolidateBuffs);
	F.ReskinCheck(InterfaceOptionsBuffsPanelShowCastableDebuffs);
	-- InterfaceOptionsBattlenetPanel;
	F.ReskinCheck(InterfaceOptionsBattlenetPanelOnlineFriends);
	F.ReskinCheck(InterfaceOptionsBattlenetPanelOfflineFriends);
	F.ReskinCheck(InterfaceOptionsBattlenetPanelBroadcasts);
	F.ReskinCheck(InterfaceOptionsBattlenetPanelFriendRequests);
	F.ReskinCheck(InterfaceOptionsBattlenetPanelConversations);
	F.ReskinCheck(InterfaceOptionsBattlenetPanelShowToastWindow);
	
	F.ReskinSlider(InterfaceOptionsBattlenetPanelToastDurationSlider);
	-- InterfaceOptionsCameraPanel;
	F.ReskinDropDown(InterfaceOptionsCameraPanelStyleDropDown);
	
	F.ReskinSlider(InterfaceOptionsCameraPanelFollowSpeedSlider);
	F.ReskinSlider(InterfaceOptionsCameraPanelMaxDistanceSlider);
	
	F.ReskinCheck(InterfaceOptionsCameraPanelFollowTerrain);
	F.ReskinCheck(InterfaceOptionsCameraPanelHeadBob);
	F.ReskinCheck(InterfaceOptionsCameraPanelWaterCollision);
	F.ReskinCheck(InterfaceOptionsCameraPanelSmartPivot);
	-- InterfaceOptionsMousePanel;
	F.ReskinCheck(InterfaceOptionsMousePanelInvertMouse);
	F.ReskinCheck(InterfaceOptionsMousePanelClickToMove);
	
	F.ReskinSlider(InterfaceOptionsMousePanelMouseSensitivitySlider);
	F.ReskinSlider(InterfaceOptionsMousePanelMouseLookSpeedSlider);
	
	F.ReskinCheck(InterfaceOptionsMousePanelWoWMouse);
	
	F.ReskinDropDown(InterfaceOptionsMousePanelClickMoveStyleDropDown);
	-- InterfaceOptionsFeaturesPanel;
	F.ReskinCheck(InterfaceOptionsFeaturesPanelEquipmentManager);
	F.ReskinCheck(InterfaceOptionsFeaturesPanelPreviewTalentChanges);
	-- InterfaceOptionsHelpPanel;
	F.ReskinCheck(InterfaceOptionsHelpPanelShowTutorials);
	F.ReskinCheck(InterfaceOptionsHelpPanelLoadingScreenTips);
	F.ReskinCheck(InterfaceOptionsHelpPanelEnhancedTooltips);
	F.ReskinCheck(InterfaceOptionsHelpPanelBeginnerTooltips);
	F.ReskinCheck(InterfaceOptionsHelpPanelShowLuaErrors);
	
	F.Reskin(InterfaceOptionsHelpPanelResetTutorials);
	-- InterfaceOptionsLanguagesPanel;
	F.ReskinDropDown(InterfaceOptionsLanguagesPanelLocaleDropDown);
	
	F.ReskinCheck(InterfaceOptionsLanguagesPanelUseEnglishAudio);
end);