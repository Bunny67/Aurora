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
	
	F.ReskinCheck(LFDQueueFrameRoleButtonTank.checkButton);
	F.ReskinCheck(LFDQueueFrameRoleButtonHealer.checkButton);
	F.ReskinCheck(LFDQueueFrameRoleButtonDPS.checkButton);
	F.ReskinCheck(LFDQueueFrameRoleButtonLeader.checkButton);

	F.ReskinDropDown(LFDQueueFrameTypeDropDown);
	
	for i=1, LFD_MAX_REWARDS do
		local Item = _G['LFDQueueFrameRandomScrollFrameChildFrameItem'..i];
		local ItemIconTexture = _G['LFDQueueFrameRandomScrollFrameChildFrameItem'..i..'IconTexture'];
		local ItemCount = _G['LFDQueueFrameRandomScrollFrameChildFrameItem'..i..'Count'];
		
		if ( Item ) then
			F.StripTextures(Item);
			F.CreateBD(Item);
			
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
end)