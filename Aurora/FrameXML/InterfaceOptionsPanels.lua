local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local tinsert = table.insert;

local INTERFACE_OPTOINS_CHECK = {
	-- InterfaceOptionsControlsPanel;
	'InterfaceOptionsControlsPanelStickyTargeting',
	'InterfaceOptionsControlsPanelAutoDismount',
	'InterfaceOptionsControlsPanelAutoClearAFK',
	'InterfaceOptionsControlsPanelBlockTrades',
	'InterfaceOptionsControlsPanelLootAtMouse',
	'InterfaceOptionsControlsPanelAutoLootCorpse',
	-- InterfaceOptionsCombatPanel;
	'InterfaceOptionsCombatPanelAttackOnAssist',
	'InterfaceOptionsCombatPanelAutoRange',
	'InterfaceOptionsCombatPanelStopAutoAttack',
	'InterfaceOptionsCombatPanelNameplateClassColors',
	'InterfaceOptionsCombatPanelAutoSelfCast',
	'InterfaceOptionsCombatPanelEnemyCastBarsOnPortrait',
	'InterfaceOptionsCombatPanelEnemyCastBarsOnNameplates',
	'InterfaceOptionsCombatPanelTargetOfTarget',
	-- InterfaceOptionsDisplayPanel;
	'InterfaceOptionsDisplayPanelShowCloak',
	'InterfaceOptionsDisplayPanelShowHelm',
	'InterfaceOptionsDisplayPanelRotateMinimap',
	'InterfaceOptionsDisplayPanelScreenEdgeFlash',
	'InterfaceOptionsDisplayPanelDetailedLootInfo',
	'InterfaceOptionsDisplayPanelShowFreeBagSpace',
	'InterfaceOptionsDisplayPanelShowClock',
	'InterfaceOptionsDisplayPanelShowAggroPercentage',
	'InterfaceOptionsDisplayPanelPlayAggroSounds',
	'InterfaceOptionsDisplayPanelColorblindMode',
	'InterfaceOptionsDisplayPanelShowItemLevel',
	'InterfaceOptionsDisplayPanelCinematicSubtitles',
	-- InterfaceOptionsObjectivesPanel;
	'InterfaceOptionsObjectivesPanelInstantQuestText',
	'InterfaceOptionsObjectivesPanelAutoQuestTracking',
	'InterfaceOptionsObjectivesPanelAutoQuestProgress',
	'InterfaceOptionsObjectivesPanelMapQuestDifficulty',
	'InterfaceOptionsObjectivesPanelAdvancedWorldMap',
	'InterfaceOptionsObjectivesPanelWatchFrameWidth',
	-- InterfaceOptionsSocialPanel;
	'InterfaceOptionsSocialPanelProfanityFilter',
	'InterfaceOptionsSocialPanelChatBubbles',
	'InterfaceOptionsSocialPanelPartyChat',
	'InterfaceOptionsSocialPanelSpamFilter',
	'InterfaceOptionsSocialPanelChatHoverDelay',
	'InterfaceOptionsSocialPanelGuildMemberAlert',
	'InterfaceOptionsSocialPanelGuildRecruitment',
	'InterfaceOptionsSocialPanelChatMouseScroll',
	'InterfaceOptionsSocialPanelWholeChatWindowClickable',
	-- InterfaceOptionsActionBarsPanel;
	'InterfaceOptionsActionBarsPanelBottomLeft',
	'InterfaceOptionsActionBarsPanelBottomRight',
	'InterfaceOptionsActionBarsPanelRight',
	'InterfaceOptionsActionBarsPanelRightTwo',
	'InterfaceOptionsActionBarsPanelLockActionBars',
	'InterfaceOptionsActionBarsPanelAlwaysShowActionBars',
	'InterfaceOptionsActionBarsPanelSecureAbilityToggle',
	-- InterfaceOptionsNamesPanel;
	'InterfaceOptionsNamesPanelMyName',
	'InterfaceOptionsNamesPanelNPCNames',
	'InterfaceOptionsNamesPanelNonCombatCreature',
	'InterfaceOptionsNamesPanelGuilds',
	'InterfaceOptionsNamesPanelTitles',
	'InterfaceOptionsNamesPanelFriendlyPlayerNames',
	'InterfaceOptionsNamesPanelFriendlyPets',
	'InterfaceOptionsNamesPanelFriendlyGuardians',
	'InterfaceOptionsNamesPanelFriendlyTotems',
	'InterfaceOptionsNamesPanelEnemyPlayerNames',
	'InterfaceOptionsNamesPanelEnemyPets',
	'InterfaceOptionsNamesPanelEnemyGuardians',
	'InterfaceOptionsNamesPanelEnemyTotems',
	'InterfaceOptionsNamesPanelUnitNameplatesAllowOverlap',
	'InterfaceOptionsNamesPanelUnitNameplatesFriends',
	'InterfaceOptionsNamesPanelUnitNameplatesFriendlyPets',
	'InterfaceOptionsNamesPanelUnitNameplatesFriendlyGuardians',
	'InterfaceOptionsNamesPanelUnitNameplatesFriendlyTotems',
	'InterfaceOptionsNamesPanelUnitNameplatesEnemies',
	'InterfaceOptionsNamesPanelUnitNameplatesEnemyPets',
	'InterfaceOptionsNamesPanelUnitNameplatesEnemyGuardians',
	'InterfaceOptionsNamesPanelUnitNameplatesEnemyTotems',
	-- InterfaceOptionsCombatTextPanel;
	'InterfaceOptionsCombatTextPanelTargetDamage',
	'InterfaceOptionsCombatTextPanelPeriodicDamage',
	'InterfaceOptionsCombatTextPanelPetDamage',
	'InterfaceOptionsCombatTextPanelHealing',
	'InterfaceOptionsCombatTextPanelTargetEffects',
	'InterfaceOptionsCombatTextPanelOtherTargetEffects',
	'InterfaceOptionsCombatTextPanelEnableFCT',
	'InterfaceOptionsCombatTextPanelDodgeParryMiss',
	'InterfaceOptionsCombatTextPanelDamageReduction',
	'InterfaceOptionsCombatTextPanelRepChanges',
	'InterfaceOptionsCombatTextPanelReactiveAbilities',
	'InterfaceOptionsCombatTextPanelFriendlyHealerNames',
	'InterfaceOptionsCombatTextPanelCombatState',
	'InterfaceOptionsCombatTextPanelComboPoints',
	'InterfaceOptionsCombatTextPanelLowManaHealth',
	'InterfaceOptionsCombatTextPanelEnergyGains',
	'InterfaceOptionsCombatTextPanelPeriodicEnergyGains',
	'InterfaceOptionsCombatTextPanelHonorGains',
	'InterfaceOptionsCombatTextPanelAuras',
	-- InterfaceOptionsStatusTextPanel;
	'InterfaceOptionsStatusTextPanelPlayer',
	'InterfaceOptionsStatusTextPanelPet',
	'InterfaceOptionsStatusTextPanelParty',
	'InterfaceOptionsStatusTextPanelTarget',
	'InterfaceOptionsStatusTextPanelPercentages',
	'InterfaceOptionsStatusTextPanelXP',
	-- InterfaceOptionsUnitFramePanel;
	'InterfaceOptionsUnitFramePanelPartyBackground',
	'InterfaceOptionsUnitFramePanelPartyInRaid',
	'InterfaceOptionsUnitFramePanelPartyPets',
	'InterfaceOptionsUnitFramePanelRaidRange',
	'InterfaceOptionsUnitFramePanelArenaEnemyFrames',
	'InterfaceOptionsUnitFramePanelArenaEnemyCastBar',
	'InterfaceOptionsUnitFramePanelArenaEnemyPets',
	'InterfaceOptionsUnitFramePanelFullSizeFocusFrame',
	-- InterfaceOptionsBuffsPanel;
	'InterfaceOptionsBuffsPanelBuffDurations',
	'InterfaceOptionsBuffsPanelDispellableDebuffs',
	'InterfaceOptionsBuffsPanelCastableBuffs',
	'InterfaceOptionsBuffsPanelConsolidateBuffs',
	'InterfaceOptionsBuffsPanelShowCastableDebuffs',
	-- InterfaceOptionsBattlenetPanel;
	'InterfaceOptionsBattlenetPanelOnlineFriends',
	'InterfaceOptionsBattlenetPanelOfflineFriends',
	'InterfaceOptionsBattlenetPanelBroadcasts',
	'InterfaceOptionsBattlenetPanelFriendRequests',
	'InterfaceOptionsBattlenetPanelConversations',
	'InterfaceOptionsBattlenetPanelShowToastWindow',
	-- InterfaceOptionsCameraPanel;
	'InterfaceOptionsCameraPanelFollowTerrain',
	'InterfaceOptionsCameraPanelHeadBob',
	'InterfaceOptionsCameraPanelWaterCollision',
	'InterfaceOptionsCameraPanelSmartPivot',
	-- InterfaceOptionsMousePanel;
	'InterfaceOptionsMousePanelInvertMouse',
	'InterfaceOptionsMousePanelClickToMove',
	'InterfaceOptionsMousePanelWoWMouse',
	-- InterfaceOptionsFeaturesPanel;
	'InterfaceOptionsFeaturesPanelEquipmentManager',
	'InterfaceOptionsFeaturesPanelPreviewTalentChanges',
	-- InterfaceOptionsHelpPanel;
	'InterfaceOptionsHelpPanelShowTutorials',
	'InterfaceOptionsHelpPanelLoadingScreenTips',
	'InterfaceOptionsHelpPanelEnhancedTooltips',
	'InterfaceOptionsHelpPanelBeginnerTooltips',
	'InterfaceOptionsHelpPanelShowLuaErrors',
	-- InterfaceOptionsLanguagesPanel;
	'InterfaceOptionsLanguagesPanelUseEnglishAudio',
};

local INTERFACE_OPTIONS_DROPDOWN = {
	-- InterfaceOptionsControlsPanel;
	'InterfaceOptionsControlsPanelAutoLootKeyDropDown',
	-- InterfaceOptionsCombatPanel;
	'InterfaceOptionsCombatPanelSelfCastKeyDropDown',
	'InterfaceOptionsCombatPanelTOTDropDown',
	'InterfaceOptionsCombatPanelFocusCastKeyDropDown',
	-- InterfaceOptionsDisplayPanel;
	'InterfaceOptionsDisplayPanelAggroWarningDisplay',
	'InterfaceOptionsDisplayPanelWorldPVPObjectiveDisplay',
	-- InterfaceOptionsSocialPanel;
	'InterfaceOptionsSocialPanelChatStyle',
	'InterfaceOptionsSocialPanelConversationMode',
	'InterfaceOptionsSocialPanelTimestamps',
	-- InterfaceOptionsCombatTextPanel;
	'InterfaceOptionsCombatTextPanelFCTDropDown',
	-- InterfaceOptionsCameraPanel;
	'InterfaceOptionsCameraPanelStyleDropDown',
	-- InterfaceOptionsMousePanel;
	'InterfaceOptionsMousePanelClickMoveStyleDropDown',
	-- InterfaceOptionsLanguagesPanel;
	'InterfaceOptionsLanguagesPanelLocaleDropDown'
};

local INTERFACE_OPRIONS_SLIDER = {
	-- InterfaceOptionsBattlenetPanel;
	'InterfaceOptionsBattlenetPanelToastDurationSlider',
	-- InterfaceOptionsCameraPanel;
	'InterfaceOptionsCameraPanelFollowSpeedSlider',
	'InterfaceOptionsCameraPanelMaxDistanceSlider',
	-- InterfaceOptionsMousePanel;
	'InterfaceOptionsMousePanelMouseSensitivitySlider',
	'InterfaceOptionsMousePanelMouseLookSpeedSlider'
};

tinsert(C.Modules['Aurora'], function()
	do
		local Check;
	
		for i = 1, #INTERFACE_OPTOINS_CHECK do
			Check = _G[INTERFACE_OPTOINS_CHECK[i]];
			
			F.ReskinCheck(Check);
		end
	end
	
	do
		local DropDown;
	
		for i = 1, #INTERFACE_OPTIONS_DROPDOWN do
			DropDown = _G[INTERFACE_OPTIONS_DROPDOWN[i]];
			
			F.ReskinDropDown(DropDown);
		end
	end
	
	do
		local Slider;
	
		for i = 1, #INTERFACE_OPRIONS_SLIDER do
			Slider = _G[INTERFACE_OPRIONS_SLIDER[i]];
			
			F.ReskinSlider(Slider);
		end
	end
	-- InterfaceOptionsHelpPanel;
	F.Reskin(InterfaceOptionsHelpPanelResetTutorials);
end);