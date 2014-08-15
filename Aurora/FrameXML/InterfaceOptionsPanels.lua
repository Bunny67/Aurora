local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local tinsert = table.insert;

local CHECK = {
	-- ControlsPanel;
	'ControlsPanelStickyTargeting',
	'ControlsPanelAutoDismount',
	'ControlsPanelAutoClearAFK',
	'ControlsPanelBlockTrades',
	'ControlsPanelLootAtMouse',
	'ControlsPanelAutoLootCorpse',
	-- CombatPanel;
	'CombatPanelAttackOnAssist',
	'CombatPanelAutoRange',
	'CombatPanelStopAutoAttack',
	'CombatPanelNameplateClassColors',
	'CombatPanelAutoSelfCast',
	'CombatPanelEnemyCastBarsOnPortrait',
	'CombatPanelEnemyCastBarsOnNameplates',
	'CombatPanelTargetOfTarget',
	-- DisplayPanel;
	'DisplayPanelShowCloak',
	'DisplayPanelShowHelm',
	'DisplayPanelRotateMinimap',
	'DisplayPanelScreenEdgeFlash',
	'DisplayPanelDetailedLootInfo',
	'DisplayPanelShowFreeBagSpace',
	'DisplayPanelShowClock',
	'DisplayPanelShowAggroPercentage',
	'DisplayPanelPlayAggroSounds',
	'DisplayPanelColorblindMode',
	'DisplayPanelShowItemLevel',
	'DisplayPanelCinematicSubtitles',
	-- ObjectivesPanel;
	'ObjectivesPanelInstantQuestText',
	'ObjectivesPanelAutoQuestTracking',
	'ObjectivesPanelAutoQuestProgress',
	'ObjectivesPanelMapQuestDifficulty',
	'ObjectivesPanelAdvancedWorldMap',
	'ObjectivesPanelWatchFrameWidth',
	-- SocialPanel;
	'SocialPanelProfanityFilter',
	'SocialPanelChatBubbles',
	'SocialPanelPartyChat',
	'SocialPanelSpamFilter',
	'SocialPanelChatHoverDelay',
	'SocialPanelGuildMemberAlert',
	'SocialPanelGuildRecruitment',
	'SocialPanelChatMouseScroll',
	'SocialPanelWholeChatWindowClickable',
	-- ActionBarsPanel;
	'ActionBarsPanelBottomLeft',
	'ActionBarsPanelBottomRight',
	'ActionBarsPanelRight',
	'ActionBarsPanelRightTwo',
	'ActionBarsPanelLockActionBars',
	'ActionBarsPanelAlwaysShowActionBars',
	'ActionBarsPanelSecureAbilityToggle',
	-- NamesPanel;
	'NamesPanelMyName',
	'NamesPanelNPCNames',
	'NamesPanelNonCombatCreature',
	'NamesPanelGuilds',
	'NamesPanelTitles',
	'NamesPanelFriendlyPlayerNames',
	'NamesPanelFriendlyPets',
	'NamesPanelFriendlyGuardians',
	'NamesPanelFriendlyTotems',
	'NamesPanelEnemyPlayerNames',
	'NamesPanelEnemyPets',
	'NamesPanelEnemyGuardians',
	'NamesPanelEnemyTotems',
	'NamesPanelUnitNameplatesAllowOverlap',
	'NamesPanelUnitNameplatesFriends',
	'NamesPanelUnitNameplatesFriendlyPets',
	'NamesPanelUnitNameplatesFriendlyGuardians',
	'NamesPanelUnitNameplatesFriendlyTotems',
	'NamesPanelUnitNameplatesEnemies',
	'NamesPanelUnitNameplatesEnemyPets',
	'NamesPanelUnitNameplatesEnemyGuardians',
	'NamesPanelUnitNameplatesEnemyTotems',
	-- CombatTextPanel;
	'CombatTextPanelTargetDamage',
	'CombatTextPanelPeriodicDamage',
	'CombatTextPanelPetDamage',
	'CombatTextPanelHealing',
	'CombatTextPanelTargetEffects',
	'CombatTextPanelOtherTargetEffects',
	'CombatTextPanelEnableFCT',
	'CombatTextPanelDodgeParryMiss',
	'CombatTextPanelDamageReduction',
	'CombatTextPanelRepChanges',
	'CombatTextPanelReactiveAbilities',
	'CombatTextPanelFriendlyHealerNames',
	'CombatTextPanelCombatState',
	'CombatTextPanelComboPoints',
	'CombatTextPanelLowManaHealth',
	'CombatTextPanelEnergyGains',
	'CombatTextPanelPeriodicEnergyGains',
	'CombatTextPanelHonorGains',
	'CombatTextPanelAuras',
	-- StatusTextPanel;
	'StatusTextPanelPlayer',
	'StatusTextPanelPet',
	'StatusTextPanelParty',
	'StatusTextPanelTarget',
	'StatusTextPanelPercentages',
	'StatusTextPanelXP',
	-- UnitFramePanel;
	'UnitFramePanelPartyBackground',
	'UnitFramePanelPartyInRaid',
	'UnitFramePanelPartyPets',
	'UnitFramePanelRaidRange',
	'UnitFramePanelArenaEnemyFrames',
	'UnitFramePanelArenaEnemyCastBar',
	'UnitFramePanelArenaEnemyPets',
	'UnitFramePanelFullSizeFocusFrame',
	-- BuffsPanel;
	'BuffsPanelBuffDurations',
	'BuffsPanelDispellableDebuffs',
	'BuffsPanelCastableBuffs',
	'BuffsPanelConsolidateBuffs',
	'BuffsPanelShowCastableDebuffs',
	-- BattlenetPanel;
	'BattlenetPanelOnlineFriends',
	'BattlenetPanelOfflineFriends',
	'BattlenetPanelBroadcasts',
	'BattlenetPanelFriendRequests',
	'BattlenetPanelConversations',
	'BattlenetPanelShowToastWindow',
	-- CameraPanel;
	'CameraPanelFollowTerrain',
	'CameraPanelHeadBob',
	'CameraPanelWaterCollision',
	'CameraPanelSmartPivot',
	-- MousePanel;
	'MousePanelInvertMouse',
	'MousePanelClickToMove',
	'MousePanelWoWMouse',
	-- FeaturesPanel;
	'FeaturesPanelEquipmentManager',
	'FeaturesPanelPreviewTalentChanges',
	-- HelpPanel;
	'HelpPanelShowTutorials',
	'HelpPanelLoadingScreenTips',
	'HelpPanelEnhancedTooltips',
	'HelpPanelBeginnerTooltips',
	'HelpPanelShowLuaErrors',
	-- LanguagesPanel;
	'LanguagesPanelUseEnglishAudio',
};

local DROPDOWN = {
	-- ControlsPanel;
	'ControlsPanelAutoLootKeyDropDown',
	-- CombatPanel;
	'CombatPanelSelfCastKeyDropDown',
	'CombatPanelTOTDropDown',
	'CombatPanelFocusCastKeyDropDown',
	-- DisplayPanel;
	'DisplayPanelAggroWarningDisplay',
	'DisplayPanelWorldPVPObjectiveDisplay',
	-- SocialPanel;
	'SocialPanelChatStyle',
	'SocialPanelConversationMode',
	'SocialPanelTimestamps',
	-- CombatTextPanel;
	'CombatTextPanelFCTDropDown',
	-- CameraPanel;
	'CameraPanelStyleDropDown',
	-- MousePanel;
	'MousePanelClickMoveStyleDropDown',
	-- LanguagesPanel;
	'LanguagesPanelLocaleDropDown'
};

local SLIDER = {
	-- BattlenetPanel;
	'BattlenetPanelToastDurationSlider',
	-- CameraPanel;
	'CameraPanelFollowSpeedSlider',
	'CameraPanelMaxDistanceSlider',
	-- MousePanel;
	'MousePanelMouseSensitivitySlider',
	'MousePanelMouseLookSpeedSlider'
};

tinsert(C.Modules['Aurora'], function()
	do
		local Check;
	
		for i = 1, #CHECK do
			Check = _G['InterfaceOptions'..CHECK[i]];
			
			F:ReskinCheck(Check);
		end
	end
	
	do
		local DropDown;
	
		for i = 1, #DROPDOWN do
			DropDown = _G['InterfaceOptions'..DROPDOWN[i]];
			
			F:ReskinDropDown(DropDown);
		end
	end
	
	do
		local Slider;
	
		for i = 1, #SLIDER do
			Slider = _G['InterfaceOptions'..SLIDER[i]];
			
			F:ReskinSlider(Slider);
		end
	end
	-- InterfaceOptionsHelpPanel;
	F:Reskin(InterfaceOptionsHelpPanelResetTutorials);
end);