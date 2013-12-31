local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	local r, g, b = C.r, C.g, C.b
	
	local function ColourMinimize(Frame)
		if Frame:IsEnabled() then
			Frame.Minimize:SetVertexColor(r, g, b);
		end
	end

	local function ClearMinimize(Frame)
		Frame.Minimize:SetVertexColor(1, 1, 1);
	end
	
	F.StripTextures(LFDQueueFrame, true)
	F.SetBD(LFDQueueFrame, 10, -12, -2, 1);
	
	F.Kill(LFDParentFramePortrait);
	
	for _, roleButton in pairs({LFDQueueFrameRoleButtonTank, LFDQueueFrameRoleButtonHealer, LFDQueueFrameRoleButtonDPS, LFDQueueFrameRoleButtonLeader}) do
		if roleButton.background then
			roleButton.background:SetTexture('');
		end

		roleButton.cover:SetTexture(C.media.roleIcons);
		roleButton:SetNormalTexture(C.media.roleIcons);

		roleButton.checkButton:SetFrameLevel(roleButton:GetFrameLevel() + 2);

		for i = 1, 2 do
			local left = roleButton:CreateTexture();
			left:SetDrawLayer('OVERLAY', i);
			left:SetWidth(1);
			left:SetTexture(C.media.backdrop);
			left:SetVertexColor(0, 0, 0);
			left:SetPoint('TOPLEFT', roleButton, 6, -5);
			left:SetPoint('BOTTOMLEFT', roleButton, 6, 7);
			roleButton['leftLine'..i] = left;

			local right = roleButton:CreateTexture();
			right:SetDrawLayer('OVERLAY', i);
			right:SetWidth(1);
			right:SetTexture(C.media.backdrop);
			right:SetVertexColor(0, 0, 0);
			right:SetPoint('TOPRIGHT', roleButton, -6, -5);
			right:SetPoint('BOTTOMRIGHT', roleButton, -6, 7);
			roleButton['rightLine'..i] = right;

			local top = roleButton:CreateTexture();
			top:SetDrawLayer('OVERLAY', i);
			top:SetHeight(1);
			top:SetTexture(C.media.backdrop);
			top:SetVertexColor(0, 0, 0);
			top:SetPoint('TOPLEFT', roleButton, 6, -5);
			top:SetPoint('TOPRIGHT', roleButton, -6, -5);
			roleButton['topLine'..i] = top;

			local bottom = roleButton:CreateTexture();
			bottom:SetDrawLayer('OVERLAY', i);
			bottom:SetHeight(1);
			bottom:SetTexture(C.media.backdrop);
			bottom:SetVertexColor(0, 0, 0);
			bottom:SetPoint('BOTTOMLEFT', roleButton, 6, 7);
			bottom:SetPoint('BOTTOMRIGHT', roleButton, -6, 7);
			roleButton['bottomLine'..i] = bottom;
		end

		roleButton.leftLine2:Hide();
		roleButton.rightLine2:Hide();
		roleButton.topLine2:Hide();
		roleButton.bottomLine2:Hide();

		local shortageBorder = roleButton.shortageBorder;
		if shortageBorder then
			local icon = roleButton.incentiveIcon;

			shortageBorder:SetTexture('')

			icon.border:SetTexture(0, 0, 0);
			icon.border:SetDrawLayer('BACKGROUND');
			icon.border:SetPoint('TOPLEFT', icon.texture, -1, 1);
			icon.border:SetPoint('BOTTOMRIGHT', icon.texture, 1, -1);

			icon:SetPoint('BOTTOMRIGHT', 3, -3);
			icon:SetSize(14, 14);
			icon.texture:SetSize(14, 14);
			icon.texture:SetTexCoord(.12, .88, .12, .88);
		end

		F.ReskinCheck(roleButton.checkButton)
	end
	F.ReskinDropDown(LFDQueueFrameTypeDropDown);
	
	for i=1, LFD_MAX_REWARDS do
		local Item = _G['LFDQueueFrameRandomScrollFrameChildFrameItem'..i];
		local ItemIconTexture = _G['LFDQueueFrameRandomScrollFrameChildFrameItem'..i..'IconTexture'];
		local ItemCount = _G['LFDQueueFrameRandomScrollFrameChildFrameItem'..i..'Count'];
		
		if ( Item ) then
			F.StripTextures(Item);
			F.CreateBD(Item, .25);
			
			ItemIconTexture:SetTexCoord(unpack(F.TexCoords));
			ItemIconTexture:SetDrawLayer('OVERLAY');
			
			ItemCount:SetDrawLayer('OVERLAY');
		end
	end
	
	F.StripTextures(LFDQueueFrameSpecificListScrollFrame);
	F.ReskinScroll(LFDQueueFrameSpecificListScrollFrameScrollBar);

	F.Reskin(LFDQueueFrameFindGroupButton, nil, true);
	F.Reskin(LFDQueueFrameCancelButton, nil, true);
	
	for i = 1, NUM_LFD_CHOICE_BUTTONS do
		local Button = _G['LFDQueueFrameSpecificListButton'..i..'EnableButton'];
		
		F.ReskinCheck(Button);
	end
	
	F.Reskin(LFDQueueFramePartyBackfillBackfillButton);
	F.Reskin(LFDQueueFramePartyBackfillNoBackfillButton);
	
	F.CreateBD(LFDSearchStatus); -- LFDSearchStatus
	
	F.CreateBD(LFDRoleCheckPopup); -- LFDRoleCheckPopup
	
	F.ReskinCheck(LFDRoleCheckPopupRoleButtonTank.checkButton);
	F.ReskinCheck(LFDRoleCheckPopupRoleButtonHealer.checkButton);
	F.ReskinCheck(LFDRoleCheckPopupRoleButtonDPS.checkButton);
	
	F.Reskin(LFDRoleCheckPopupAcceptButton);
	F.Reskin(LFDRoleCheckPopupDeclineButton);
	
	F.CreateBD(LFDDungeonReadyDialog); -- LFDDungeonReadyDialog
	
	F.ReskinClose(LFDDungeonReadyDialogCloseButton);
	LFDDungeonReadyDialogCloseButton.Minimize = LFDDungeonReadyDialogCloseButton:CreateTexture(nil, 'OVERLAY');
	LFDDungeonReadyDialogCloseButton.Minimize:SetSize(9, 1);
	LFDDungeonReadyDialogCloseButton.Minimize:SetPoint('CENTER');
	LFDDungeonReadyDialogCloseButton.Minimize:SetTexture(C.media.backdrop);
	LFDDungeonReadyDialogCloseButton.Minimize:SetVertexColor(1, 1, 1);
	LFDDungeonReadyDialogCloseButton:HookScript('OnEnter', ColourMinimize);
	LFDDungeonReadyDialogCloseButton:HookScript('OnLeave', ClearMinimize);
	for _, pixel in pairs(LFDDungeonReadyDialogCloseButton.Pixels) do
		pixel:Hide();
	end
	
	F.Reskin(LFDDungeonReadyDialogEnterDungeonButton);
	F.Reskin(LFDDungeonReadyDialogLeaveQueueButton);
	
	F.CreateBD(LFDDungeonReadyStatus); -- LFDDungeonReadyStatus
	
	F.ReskinClose(LFDDungeonReadyStatusCloseButton);
	LFDDungeonReadyStatusCloseButton.Minimize = LFDDungeonReadyStatusCloseButton:CreateTexture(nil, 'OVERLAY');
	LFDDungeonReadyStatusCloseButton.Minimize:SetSize(9, 1);
	LFDDungeonReadyStatusCloseButton.Minimize:SetPoint('CENTER');
	LFDDungeonReadyStatusCloseButton.Minimize:SetTexture(C.media.backdrop);
	LFDDungeonReadyStatusCloseButton.Minimize:SetVertexColor(1, 1, 1);
	LFDDungeonReadyStatusCloseButton:HookScript('OnEnter', ColourMinimize);
	LFDDungeonReadyStatusCloseButton:HookScript('OnLeave', ClearMinimize);
	for _, pixel in pairs(LFDDungeonReadyStatusCloseButton.Pixels) do
		pixel:Hide();
	end
	
	do
		local roleButtons = {LFGDungeonReadyStatusGroupedTank, LFGDungeonReadyStatusGroupedHealer, LFGDungeonReadyStatusGroupedDamager}

		for i = 1, 5 do
			tinsert(roleButtons, _G["LFGDungeonReadyStatusIndividualPlayer"..i])
		end

		for _, roleButton in pairs(roleButtons) do
			roleButton.texture:SetTexture(C.media.roleIcons)
			roleButton.statusIcon:SetDrawLayer("OVERLAY", 2)

			local left = roleButton:CreateTexture(nil, "OVERLAY")
			left:SetWidth(1)
			left:SetTexture(C.media.backdrop)
			left:SetVertexColor(0, 0, 0)
			left:SetPoint("TOPLEFT", 7, -6)
			left:SetPoint("BOTTOMLEFT", 7, 8)

			local right = roleButton:CreateTexture(nil, "OVERLAY")
			right:SetWidth(1)
			right:SetTexture(C.media.backdrop)
			right:SetVertexColor(0, 0, 0)
			right:SetPoint("TOPRIGHT", -7, -6)
			right:SetPoint("BOTTOMRIGHT", -7, 8)

			local top = roleButton:CreateTexture(nil, "OVERLAY")
			top:SetHeight(1)
			top:SetTexture(C.media.backdrop)
			top:SetVertexColor(0, 0, 0)
			top:SetPoint("TOPLEFT", 7, -6)
			top:SetPoint("TOPRIGHT", -7, -6)

			local bottom = roleButton:CreateTexture(nil, "OVERLAY")
			bottom:SetHeight(1)
			bottom:SetTexture(C.media.backdrop)
			bottom:SetVertexColor(0, 0, 0)
			bottom:SetPoint("BOTTOMLEFT", 7, 8)
			bottom:SetPoint("BOTTOMRIGHT", -7, 8)
		end
	end
end)