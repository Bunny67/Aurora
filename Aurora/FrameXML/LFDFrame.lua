local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;
local pairs = pairs;
local tinsert = table.insert;

tinsert(C.Modules['Aurora'], function()
	local function ColourMinimize(Frame)
		if Frame:IsEnabled() then
			Frame.Minimize:SetVertexColor(r, g, b);
		end
	end

	local function ClearMinimize(Frame)
		Frame.Minimize:SetVertexColor(1, 1, 1);
	end
	
	-- LFDDungeonReadyPopup
	F.CreateBD(LFDDungeonReadyStatus);
	
	F.ReskinClose(LFDDungeonReadyStatusCloseButton);
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
	
	F.CreateBD(LFDDungeonReadyDialog);
	
	LFDDungeonReadyDialogBackground:Hide();
	LFDDungeonReadyDialogFiligree:Hide();
	LFDDungeonReadyDialogBottomArt:Hide();
	
	F.ReskinClose(LFDDungeonReadyDialogCloseButton);
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
	
	F.Reskin(LFDDungeonReadyDialogEnterDungeonButton);
	F.Reskin(LFDDungeonReadyDialogLeaveQueueButton);
	
	local LFDDungeonReadyDialogRoleIconBG = CreateFrame('Frame', nil, LFDDungeonReadyDialogRoleIcon);
	LFDDungeonReadyDialogRoleIconBG:SetPoint('TOPLEFT', 8, -7);
	LFDDungeonReadyDialogRoleIconBG:SetPoint('BOTTOMRIGHT', -9, 10);
	F.CreateBD(LFDDungeonReadyDialogRoleIconBG, 0);
	
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
	F.CreateBD(LFDRoleCheckPopup);
	
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

		F.ReskinCheck(RoleButton.checkButton);
	end
	
	F.Reskin(LFDRoleCheckPopupAcceptButton);
	F.Reskin(LFDRoleCheckPopupDeclineButton);
	-- LFDSearchStatus
	F.CreateBD(LFDSearchStatus);
	
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
	
	for _, RoleButton in pairs({ LFDSearchStatusTank1, LFDSearchStatusHealer1, LFDSearchStatusDamage1, LFDSearchStatusDamage2, LFDSearchStatusDamage3 }) do
		RoleButton.texture:SetTexture(C.Media.RoleIcons);
		
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

	-- LFDParentFrame
	F.StripTextures(LFDQueueFrame, true);
	F.SetBD(LFDQueueFrame, 10, -12, -2, 1);
	
	for i = 1, _G['LFDParentFrame']:GetNumChildren() do
		local Child = select(i, _G['LFDParentFrame']:GetChildren());
		
		if Child.GetPushedTexture and Child:GetPushedTexture() and not Child:GetName() then
			F.ReskinClose(Child, 'TOPRIGHT', LFDParentFrame, 'TOPRIGHT', -6, -16);
		end
	end
	
	for _, RoleButton in pairs({LFDQueueFrameRoleButtonTank, LFDQueueFrameRoleButtonHealer, LFDQueueFrameRoleButtonDPS, LFDQueueFrameRoleButtonLeader}) do
		if RoleButton.background then
			RoleButton.background:SetTexture('');
		end

		RoleButton.cover:SetTexture(C.Media.RoleIcons);
		RoleButton:SetNormalTexture(C.Media.RoleIcons);

		RoleButton.checkButton:SetFrameLevel(RoleButton:GetFrameLevel() + 2);

		for i = 1, 2 do
			local Left = RoleButton:CreateTexture();
			Left:SetDrawLayer('OVERLAY', i);
			Left:SetWidth(1);
			Left:SetTexture(C.Media.Backdrop);
			Left:SetVertexColor(0, 0, 0);
			Left:SetPoint('TOPLEFT', RoleButton, 6, -5);
			Left:SetPoint('BOTTOMLEFT', RoleButton, 6, 7);
			RoleButton['LeftLine'..i] = Left;

			local Right = RoleButton:CreateTexture();
			Right:SetDrawLayer('OVERLAY', i);
			Right:SetWidth(1);
			Right:SetTexture(C.Media.Backdrop);
			Right:SetVertexColor(0, 0, 0);
			Right:SetPoint('TOPRIGHT', RoleButton, -6, -5);
			Right:SetPoint('BOTTOMRIGHT', RoleButton, -6, 7);
			RoleButton['RightLine'..i] = Right;

			local Top = RoleButton:CreateTexture();
			Top:SetDrawLayer('OVERLAY', i);
			Top:SetHeight(1);
			Top:SetTexture(C.Media.Backdrop);
			Top:SetVertexColor(0, 0, 0);
			Top:SetPoint('TOPLEFT', RoleButton, 6, -5);
			Top:SetPoint('TOPRIGHT', RoleButton, -6, -5);
			RoleButton['TopLine'..i] = Top;

			local Bottom = RoleButton:CreateTexture();
			Bottom:SetDrawLayer('OVERLAY', i);
			Bottom:SetHeight(1);
			Bottom:SetTexture(C.Media.Backdrop);
			Bottom:SetVertexColor(0, 0, 0);
			Bottom:SetPoint('BOTTOMLEFT', RoleButton, 6, 7);
			Bottom:SetPoint('BOTTOMRIGHT', RoleButton, -6, 7);
			RoleButton['BottomLine'..i] = Bottom;
		end

		RoleButton.LeftLine2:Hide();
		RoleButton.RightLine2:Hide();
		RoleButton.TopLine2:Hide();
		RoleButton.BottomLine2:Hide();

		local shortageBorder = RoleButton.shortageBorder;
		if shortageBorder then
			local icon = RoleButton.incentiveIcon;

			shortageBorder:SetTexture('')

			icon.border:SetTexture(0, 0, 0);
			icon.border:SetDrawLayer('BACKGROUND');
			icon.border:SetPoint('TOPLEFT', icon.texture, -1, 1);
			icon.border:SetPoint('BOTTOMRIGHT', icon.texture, 1, -1);

			icon:SetPoint('BOTTOMRIGHT', 3, -3);
			icon:SetSize(14, 14);
			icon.texture:SetSize(14, 14);
			icon.texture:SetTexCoord(unpack(F.TexCoords));
		end

		F.ReskinCheck(RoleButton.checkButton)
	end
	
	F.ReskinDropDown(LFDQueueFrameTypeDropDown);
	
	for i=1, LFD_MAX_REWARDS do
		local Item = _G['LFDQueueFrameRandomScrollFrameChildFrameItem'..i];
		local ItemIconTexture = _G['LFDQueueFrameRandomScrollFrameChildFrameItem'..i..'IconTexture'];
		local ItemCount = _G['LFDQueueFrameRandomScrollFrameChildFrameItem'..i..'Count'];
		
		if ( Item ) then
			F.StripTextures(Item);
			F.CreateBD(Item, .25);
			
			ItemIconTexture:SetPoint('TOPLEFT', 1, -1);
			ItemIconTexture:SetTexCoord(unpack(F.TexCoords));
			ItemIconTexture:SetDrawLayer('OVERLAY');
			
			ItemCount:SetDrawLayer('OVERLAY');
		end
	end
	
	hooksecurefunc('LFDQueueFrameSpecificListButton_SetDungeon', function(button, dungeonID)
		if ( not button.expandOrCollapseButton.Plus ) then
			F.ReskinCheck(button.enableButton);
			F.ReskinExpandOrCollapse(button.expandOrCollapseButton);
		end
		
		if ( LFGCollapseList[dungeonID] ) then
			button.expandOrCollapseButton.Plus:Show();
		else
			button.expandOrCollapseButton.Plus:Hide();
		end

		button.enableButton:GetCheckedTexture():SetDesaturated(true);
	end);
	
	F.StripTextures(LFDQueueFrameSpecificListScrollFrame);
	F.ReskinScroll(LFDQueueFrameSpecificListScrollFrameScrollBar);
	
	F.Reskin(LFDQueueFrameFindGroupButton, nil, true);
	F.Reskin(LFDQueueFrameCancelButton, nil, true);
	
	F.Reskin(LFDQueueFramePartyBackfillBackfillButton);
	F.Reskin(LFDQueueFramePartyBackfillNoBackfillButton);
	-- LFDParentFramePortrait
	F.Kill(LFDParentFramePortrait);
end);