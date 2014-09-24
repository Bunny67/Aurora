local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	if (not AuroraConfig.Font ) then
		return;
	end
	
	local Font = C.Media.Font;
	
	RaidWarningFrame.slot1:SetFont(Font, 20, 'OUTLINE');
	RaidWarningFrame.slot2:SetFont(Font, 20, 'OUTLINE');
	RaidBossEmoteFrame.slot1:SetFont(Font, 20, 'OUTLINE');
	RaidBossEmoteFrame.slot2:SetFont(Font, 20, 'OUTLINE');
	
	STANDARD_TEXT_FONT = Font;
	UNIT_NAME_FONT = Font;
	DAMAGE_TEXT_FONT = Font;
	NAMEPLATE_FONT = Font;
	
	SystemFont_Tiny:SetFont(Font, 9);
	SystemFont_Tiny:SetShadowColor(0, 0, 0);
	SystemFont_Tiny:SetShadowOffset(1, -1);
	SystemFont_Small:SetFont(Font, 10);
	SystemFont_Small:SetShadowColor(0, 0, 0);
	SystemFont_Small:SetShadowOffset(1, -1);
	SystemFont_Outline_Small:SetFont(Font, 10, 'OUTLINE');
	SystemFont_Outline:SetFont(Font, 13, 'OUTLINE');
	SystemFont_Shadow_Small:SetFont(Font, 10);
	SystemFont_InverseShadow_Small:SetFont(Font, 10);
	SystemFont_Med1:SetFont(Font, 12);
	SystemFont_Med1:SetShadowColor(0, 0, 0);
	SystemFont_Med1:SetShadowOffset(1, -1);
	SystemFont_Shadow_Med1:SetFont(Font, 12);
	SystemFont_Med2:SetFont(Font, 13);
	SystemFont_Med2:SetShadowColor(0, 0, 0);
	SystemFont_Med2:SetShadowOffset(1, -1);
	SystemFont_Shadow_Med2:SetFont(Font, 13);
	SystemFont_Med3:SetFont(Font, 14);
	SystemFont_Med3:SetShadowColor(0, 0, 0);
	SystemFont_Med3:SetShadowOffset(1, -1);
	SystemFont_Shadow_Med3:SetFont(Font, 14);
	SystemFont_Large:SetFont(Font, 16);
	SystemFont_Large:SetShadowColor(0, 0, 0);
	SystemFont_Large:SetShadowOffset(1, -1);
	SystemFont_Shadow_Large:SetFont(Font, 16);
	SystemFont_Huge1:SetFont(Font, 20);
	SystemFont_Huge1:SetShadowColor(0, 0, 0);
	SystemFont_Huge1:SetShadowOffset(1, -1);
	SystemFont_Shadow_Huge1:SetFont(Font, 20);
	SystemFont_OutlineThick_Huge2:SetFont(Font, 22, 'THICKOUTLINE');
	SystemFont_Shadow_Outline_Huge2:SetFont(Font, 22, 'OUTLINE');
	SystemFont_Shadow_Huge3:SetFont(Font, 25);
	SystemFont_OutlineThick_Huge4:SetFont(Font, 26, 'THICKOUTLINE');
	SystemFont_OutlineThick_WTF:SetFont(Font, 32, 'THICKOUTLINE');
	
	NumberFont_Shadow_Small:SetFont(Font, 12);
	NumberFont_OutlineThick_Mono_Small:SetFont(Font, 12, 'OUTLINE');
	NumberFont_Shadow_Med:SetFont(Font, 14);
	NumberFont_Outline_Med:SetFont(Font, 14, 'OUTLINE')
	NumberFont_Outline_Large:SetFont(Font, 16, 'OUTLINE');
	NumberFont_Outline_Huge:SetFont(Font, 30, 'OUTLINE');
	
	QuestFont_Large:SetFont(Font, 15);
	QuestFont_Large:SetShadowColor(0, 0, 0);
	QuestFont_Large:SetShadowOffset(1, -1);
	QuestFont_Shadow_Huge:SetFont(Font, 17);
	
	GameTooltipHeader:SetFont(Font, 14);
	GameTooltipHeader:SetShadowColor(0, 0, 0);
	GameTooltipHeader:SetShadowOffset(1, -1);
	
	MailFont_Large:SetFont(Font, 15);
	SpellFont_Small:SetFont(Font, 10);
	SpellFont_Small:SetShadowColor(0, 0, 0);
	SpellFont_Small:SetShadowOffset(1, -1);
	
	InvoiceFont_Med:SetFont(Font, 12);
	InvoiceFont_Med:SetShadowColor(0, 0, 0);
	InvoiceFont_Med:SetShadowOffset(1, -1);
	InvoiceFont_Small:SetFont(Font, 10);
	InvoiceFont_Small:SetShadowColor(0, 0, 0);
	InvoiceFont_Small:SetShadowOffset(1, -1);
	Tooltip_Med:SetFont(Font, 12);
	Tooltip_Med:SetShadowColor(0, 0, 0);
	Tooltip_Med:SetShadowOffset(1, -1);
	Tooltip_Small:SetFont(Font, 10);
	Tooltip_Small:SetShadowColor(0, 0, 0);
	Tooltip_Small:SetShadowOffset(1, -1);
	AchievementFont_Small:SetFont(Font, 10);
	AchievementFont_Small:SetShadowColor(0, 0, 0);
	AchievementFont_Small:SetShadowOffset(1, -1);
	ReputationDetailFont:SetFont(Font, 10);
	FriendsFont_Normal:SetFont(Font, 12);
	FriendsFont_Small:SetFont(Font, 10);
	FriendsFont_Large:SetFont(Font, 14);
	FriendsFont_UserText:SetFont(Font, 11);
end);