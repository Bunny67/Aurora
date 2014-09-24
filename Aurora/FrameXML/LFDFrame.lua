local _G = getfenv(0);
local unpack = unpack;
local select = select;
local pairs = pairs;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

local TexCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	local function ColourMinimize(Frame)
		if Frame:IsEnabled() then
			Frame.Minimize:SetVertexColor(C.r, C.g, C.b);
		end
	end

	local function ClearMinimize(Frame)
		Frame.Minimize:SetVertexColor(1, 1, 1);
	end
	
	-- LFDDungeonReadyPopup
	F:CreateBD(LFDDungeonReadyStatus);
	
	F:ReskinClose(LFDDungeonReadyStatusCloseButton);
	LFDDungeonReadyStatusCloseButton.Minimize = LFDDungeonReadyStatusCloseButton:CreateTexture(nil, 'OVERLAY');
	LFDDungeonReadyStatusCloseButton.Minimize:SetSize(9, 1);
	LFDDungeonReadyStatusCloseButton.Minimize:SetPoint('CENTER');
	LFDDungeonReadyStatusCloseButton.Minimize:SetTexture(C.Media.Backdrop);
	LFDDungeonReadyStatusCloseButton.Minimize:SetVertexColor(1, 1, 1);
	LFDDungeonReadyStatusCloseButton:HookScript('OnEnter', ColourMinimize);
	LFDDungeonReadyStatusCloseButton:HookScript('OnLeave', ClearMinimize);
	for _, Pixel in pairs(LFDDungeonReadyStatusCloseButton.Pixels) do
		Pixel:Hide();
	end
	
	do
		local RoleButtons = { LFDDungeonReadyStatusGroupedTank, LFDDungeonReadyStatusGroupedHealer, LFDDungeonReadyStatusGroupedDamager };

		for i = 1, 5 do
			tinsert(RoleButtons, _G['LFDDungeonReadyStatusPlayer'..i]);
		end

		for _, RoleButton in pairs(RoleButtons) do
			RoleButton.texture:SetTexture(C.Media.RoleIcons);
			RoleButton.statusIcon:SetDrawLayer('OVERLAY', 2);

			local Left = RoleButton:CreateTexture(nil, 'OVERLAY');
			Left:SetWidth(1);
			Left:SetTexture(C.Media.Backdrop);
			Left:SetVertexColor(0, 0, 0);
			Left:SetPoint('TOPLEFT', 7, -6);
			Left:SetPoint('BOTTOMLEFT', 7, 8);

			local Right = RoleButton:CreateTexture(nil, 'OVERLAY');
			Right:SetWidth(1);
			Right:SetTexture(C.Media.Backdrop);
			Right:SetVertexColor(0, 0, 0);
			Right:SetPoint('TOPRIGHT', -7, -6);
			Right:SetPoint('BOTTOMRIGHT', -7, 8);

			local Top = RoleButton:CreateTexture(nil, 'OVERLAY');
			Top:SetHeight(1);
			Top:SetTexture(C.Media.Backdrop);
			Top:SetVertexColor(0, 0, 0);
			Top:SetPoint('TOPLEFT', 7, -5);
			Top:SetPoint('TOPRIGHT', -7, -6);

			local Bottom = RoleButton:CreateTexture(nil, 'OVERLAY');
			Bottom:SetHeight(1);
			Bottom:SetTexture(C.Media.Backdrop);
			Bottom:SetVertexColor(0, 0, 0);
			Bottom:SetPoint('BOTTOMLEFT', 7, 8);
			Bottom:SetPoint('BOTTOMRIGHT', -7, 8);
		end
	end
	
	F:CreateBD(LFDDungeonReadyDialog);
	
	LFDDungeonReadyDialogBackground:Hide();
	LFDDungeonReadyDialogFiligree:Hide();
	LFDDungeonReadyDialogBottomArt:Hide();
	
	F:ReskinClose(LFDDungeonReadyDialogCloseButton);
	LFDDungeonReadyDialogCloseButton.Minimize = LFDDungeonReadyDialogCloseButton:CreateTexture(nil, 'OVERLAY');
	LFDDungeonReadyDialogCloseButton.Minimize:SetSize(9, 1);
	LFDDungeonReadyDialogCloseButton.Minimize:SetPoint('CENTER');
	LFDDungeonReadyDialogCloseButton.Minimize:SetTexture(C.Media.Backdrop);
	LFDDungeonReadyDialogCloseButton.Minimize:SetVertexColor(1, 1, 1);
	LFDDungeonReadyDialogCloseButton:HookScript('OnEnter', ColourMinimize);
	LFDDungeonReadyDialogCloseButton:HookScript('OnLeave', ClearMinimize);
	for _, Pixel in pairs(LFDDungeonReadyDialogCloseButton.Pixels) do
		Pixel:Hide();
	end
	
	F:Reskin(LFDDungeonReadyDialogEnterDungeonButton);
	F:Reskin(LFDDungeonReadyDialogLeaveQueueButton);
	
	local LFDDungeonReadyDialogRoleIconBG = CreateFrame('Frame', nil, LFDDungeonReadyDialogRoleIcon);
	LFDDungeonReadyDialogRoleIconBG:SetPoint('TOPLEFT', 8, -7);
	LFDDungeonReadyDialogRoleIconBG:SetPoint('BOTTOMRIGHT', -9, 10);
	F:CreateBD(LFDDungeonReadyDialogRoleIconBG, 0);
	
	LFDDungeonReadyDialogRoleIconTexture:SetTexture(C.Media.RoleIcons);
	LFDDungeonReadyDialogRoleIconLeaderIcon:SetTexture(C.Media.RoleIcons);
	LFDDungeonReadyDialogRoleIconLeaderIcon:SetTexCoord(0, 0.296875, 0.015625, 0.2875);
	
	for i = 1, 2 do
		local RewardTexture = _G['LFDDungeonReadyDialogRewardsFrameReward'..i..'Texture'];
		local RewardBorder = _G['LFDDungeonReadyDialogRewardsFrameReward'..i..'Border'];
		
		RewardTexture:SetTexCoord(unpack(F.TexCoords))
		
		RewardBorder:SetTexture(0, 0, 0);
		RewardBorder:SetDrawLayer('BACKGROUND');
		RewardBorder:SetPoint("TOPLEFT", RewardTexture, -1, 1);
		RewardBorder:SetPoint("BOTTOMRIGHT", RewardTexture, 1, -1);
	end
	-- LFDRoleCheckPopup
	F:CreateBD(LFDRoleCheckPopup);
	
	for _, RoleButton in pairs({ LFDRoleCheckPopupRoleButtonTank, LFDRoleCheckPopupRoleButtonHealer, LFDRoleCheckPopupRoleButtonDPS }) do
		RoleButton.cover:SetTexture(C.Media.RoleIcons);
		RoleButton:SetNormalTexture(C.Media.RoleIcons);

		RoleButton.checkButton:SetFrameLevel(RoleButton:GetFrameLevel() + 2);

		local Left = RoleButton:CreateTexture(nil, 'OVERLAY');
		Left:SetWidth(1);
		Left:SetTexture(C.Media.Backdrop);
		Left:SetVertexColor(0, 0, 0);
		Left:SetPoint('TOPLEFT', RoleButton, 9, -7);
		Left:SetPoint('BOTTOMLEFT', RoleButton, 9, 11);

		local Right = RoleButton:CreateTexture(nil, 'OVERLAY');
		Right:SetWidth(1);
		Right:SetTexture(C.Media.Backdrop);
		Right:SetVertexColor(0, 0, 0);
		Right:SetPoint('TOPRIGHT', RoleButton, -9, -7);
		Right:SetPoint('BOTTOMRIGHT', RoleButton, -9, 11);

		local Top = RoleButton:CreateTexture(nil, 'OVERLAY');
		Top:SetHeight(1);
		Top:SetTexture(C.Media.Backdrop);
		Top:SetVertexColor(0, 0, 0);
		Top:SetPoint('TOPLEFT', RoleButton, 9, -6);
		Top:SetPoint('TOPRIGHT', RoleButton, -9, -7);

		local Bottom = RoleButton:CreateTexture(nil, 'OVERLAY');
		Bottom:SetHeight(1);
		Bottom:SetTexture(C.Media.Backdrop);
		Bottom:SetVertexColor(0, 0, 0);
		Bottom:SetPoint('BOTTOMLEFT', RoleButton, 9, 11);
		Bottom:SetPoint('BOTTOMRIGHT', RoleButton, -9, 11);

		F:ReskinCheck(RoleButton.checkButton);
	end
	
	F:Reskin(LFDRoleCheckPopupAcceptButton);
	F:Reskin(LFDRoleCheckPopupDeclineButton);
	-- LFDSearchStatus;
	F:CreateBD(LFDSearchStatus);
	
	do
		local RoleButton = { 'Tank1', 'Healer1', 'Damage1', 'Damage2', 'Damage3' };
		local Button;
		
		for i = 1, #RoleButton do
			Button = _G['LFDSearchStatus'..RoleButton[i]];
			Button.texture:SetTexture(C.Media.RoleIcons);
			
			local Left = Button:CreateTexture(nil, 'OVERLAY');
			Left:SetWidth(1);
			Left:SetTexture(C.Media.Backdrop);
			Left:SetVertexColor(0, 0, 0);
			Left:SetPoint('TOPLEFT', 7, -6);
			Left:SetPoint('BOTTOMLEFT', 7, 8);

			local Right = Button:CreateTexture(nil, 'OVERLAY');
			Right:SetWidth(1);
			Right:SetTexture(C.Media.Backdrop);
			Right:SetVertexColor(0, 0, 0);
			Right:SetPoint('TOPRIGHT', -7, -6);
			Right:SetPoint('BOTTOMRIGHT', -7, 8);

			local Top = Button:CreateTexture(nil, 'OVERLAY');
			Top:SetHeight(1);
			Top:SetTexture(C.Media.Backdrop);
			Top:SetVertexColor(0, 0, 0);
			Top:SetPoint('TOPLEFT', 7, -5);
			Top:SetPoint('TOPRIGHT', -7, -6);

			local Bottom = Button:CreateTexture(nil, 'OVERLAY');
			Bottom:SetHeight(1);
			Bottom:SetTexture(C.Media.Backdrop);
			Bottom:SetVertexColor(0, 0, 0);
			Bottom:SetPoint('BOTTOMLEFT', 7, 8);
			Bottom:SetPoint('BOTTOMRIGHT', -7, 8);
		end
	end
	
	hooksecurefunc('LFDSearchStatusPlayer_SetFound', function(button, isFound)
		if ( isFound ) then
			SetDesaturation(button.texture, false);
			button.cover:Hide();
		else
			SetDesaturation(button.texture, true);
			button.cover:Hide();
		end
	end);
	
	hooksecurefunc('LFDSearchStatus_UpdateRoles', function()
		local _, Tank, Healer, Damage = GetLFGRoles();
		local CurrentIcon = 1;
		
		if ( Tank ) then
			local Icon = _G['LFDSearchStatusRoleIcon'..CurrentIcon];
			Icon:SetTexture(C.Media.RoleIcons);
			CurrentIcon = CurrentIcon + 1;
		end
		
		if ( Healer ) then
			local Icon = _G['LFDSearchStatusRoleIcon'..CurrentIcon];
			Icon:SetTexture(C.Media.RoleIcons);
			CurrentIcon = CurrentIcon + 1;
		end
		
		if ( Damage ) then
			local Icon = _G['LFDSearchStatusRoleIcon'..CurrentIcon];
			Icon:SetTexture(C.Media.RoleIcons);
			CurrentIcon = CurrentIcon + 1;
		end
	end);
	-- LFDParentFrame;
	F:SetBD(LFDParentFrame, 15, -12, -1, 3);
	
	do
		local Child;
		
		for i = 1, LFDParentFrame:GetNumChildren() do
			Child = select(i, LFDParentFrame:GetChildren());
			
			if Child.GetPushedTexture and Child:GetPushedTexture() and not Child:GetName() then
				F:ReskinClose(Child, 'TOPRIGHT', LFDParentFrame, 'TOPRIGHT', -5, -16);
			end
		end
	end
	
	LFDQueueFrameBackground:Hide();
	LFDQueueFrameLayout:SetTexture(nil);
	
	do
		local RoleButton = { 'Tank', 'Healer', 'DPS', 'Leader' };
		local Button;
		
		for i = 1, #RoleButton do
			Button = _G['LFDQueueFrameRoleButton'..RoleButton[i]];
			
			Button:SetNormalTexture(C.Media.RoleIcons);
			Button.cover:SetTexture(C.Media.RoleIcons);
			
			if ( Button.background ) then
				Button.background:SetTexture(nil);
			end
			
			local Left = Button:CreateTexture(nil, 'OVERLAY');
			Left:SetWidth(1);
			Left:SetTexture(C.Media.Backdrop);
			Left:SetVertexColor(0, 0, 0);
			Left:SetPoint('TOPLEFT', 6, -5);
			Left:SetPoint('BOTTOMLEFT', 6, 7);

			local Right = Button:CreateTexture(nil, 'OVERLAY');
			Right:SetWidth(1);
			Right:SetTexture(C.Media.Backdrop);
			Right:SetVertexColor(0, 0, 0);
			Right:SetPoint('TOPRIGHT', -5, -5);
			Right:SetPoint('BOTTOMRIGHT', -5, 7);

			local Top = Button:CreateTexture(nil, 'OVERLAY');
			Top:SetHeight(1);
			Top:SetTexture(C.Media.Backdrop);
			Top:SetVertexColor(0, 0, 0);
			Top:SetPoint('TOPLEFT', 6, -4);
			Top:SetPoint('TOPRIGHT', -5, -4);

			local Bottom = Button:CreateTexture(nil, 'OVERLAY');
			Bottom:SetHeight(1);
			Bottom:SetTexture(C.Media.Backdrop);
			Bottom:SetVertexColor(0, 0, 0);
			Bottom:SetPoint('BOTTOMLEFT', 6, 7);
			Bottom:SetPoint('BOTTOMRIGHT', -5, 7);
			
			Button.checkButton:SetFrameLevel(Button:GetFrameLevel() + 2);
			F:ReskinCheck(Button.checkButton);
		end
	end
	
	F:ReskinDropDown(LFDQueueFrameTypeDropDown);
	
	do
		local Item, ItemIcon, ItemCount, ItemName
		
		for i = 1, LFD_MAX_REWARDS do
			Item = _G['LFDQueueFrameRandomScrollFrameChildFrameItem'..i];
			ItemIcon = _G['LFDQueueFrameRandomScrollFrameChildFrameItem'..i..'IconTexture'];
			ItemCount = _G['LFDQueueFrameRandomScrollFrameChildFrameItem'..i..'Count'];
			ItemName = _G['LFDQueueFrameRandomScrollFrameChildFrameItem'..i..'NameFrame'];
			
			if ( Item ) then
				F:CreateBG(ItemIcon)
				ItemIcon:SetTexCoord(unpack(TexCoords));
				ItemIcon:SetDrawLayer('OVERLAY');
				
				ItemCount:SetDrawLayer('OVERLAY');
				
				ItemName:SetTexture(0, 0, 0, .25);
				ItemName:SetSize(118, 39);
				
				Item.bg2 = CreateFrame('Frame', nil, Item);
				Item.bg2:SetPoint('TOPLEFT', ItemName, 'TOPLEFT', 10, 0);
				Item.bg2:SetPoint('BOTTOMRIGHT', ItemName, 'BOTTOMRIGHT');
				F:CreateBD(Item.bg2, 0);
			end
		end
	end
	
	LFDQueueFrameRandomScrollFrameScrollBackground:SetTexture(nil);
	LFDQueueFrameRandomScrollFrameScrollBackgroundTopLeft:SetTexture(nil);
	LFDQueueFrameRandomScrollFrameScrollBackgroundBottomRight:SetTexture(nil);
	F:ReskinScroll(LFDQueueFrameRandomScrollFrameScrollBar);
	
	LFDQueueFrameSpecificListScrollFrame:DisableDrawLayer('BACKGROUND');
	F:ReskinScroll(LFDQueueFrameSpecificListScrollFrameScrollBar);
	
	F:Reskin(LFDQueueFrameFindGroupButton);
	F:Reskin(LFDQueueFrameCancelButton);
	
	F:Reskin(LFDQueueFramePartyBackfillBackfillButton);
	F:Reskin(LFDQueueFramePartyBackfillNoBackfillButton);
	
	F:Reskin(LFDQueueFrameNoLFDWhileLFRLeaveQueueButton);
	
	hooksecurefunc('LFDQueueFrameSpecificListButton_SetDungeon', function(button, dungeonID)
		if ( not button.expandOrCollapseButton.Plus ) then
			F:ReskinCheck(button.enableButton);
			F:ReskinExpandOrCollapse(button.expandOrCollapseButton);
		end
		
		if ( LFGCollapseList[dungeonID] ) then
			button.expandOrCollapseButton.Plus:Show();
		else
			button.expandOrCollapseButton.Plus:Hide();
		end
	end);
	-- LFDParentFramePortrait;
	LFDParentFramePortrait:Hide();
end);