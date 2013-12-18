local F, C = unpack(select(2, ...))

tinsert(C.modules['Aurora'], function()
	local AllCharacterFrameStripTextures = {'CharacterFrame', 'PaperDollFrame', 'PlayerTitleFrame', 'CharacterAttributesFrame', 'GearManagerDialog', 'PetPaperDollFrame', 'PetPaperDollFrameCompanionFrame', 'ReputationFrame', 'ReputationListScrollFrame', 'ReputationDetailFrame', 'SkillFrame', 'SkillDetailScrollFrame','SkillListScrollFrame', 'TokenFrame'}
	for i = 1, #AllCharacterFrameStripTextures do
		F.StripTextures(_G[AllCharacterFrameStripTextures[i]], true)
	end

	local AllCharacterFrameDropDowns = {'PlayerStatFrameLeftDropDown', 'PlayerStatFrameRightDropDown'}
	for i = 1, #AllCharacterFrameDropDowns do
		F.ReskinDropDown(_G[AllCharacterFrameDropDowns[i]])
	end

	local AllCharacterFrameScrollbars = {'ReputationListScrollFrameScrollBar', 'TokenFrameContainerScrollBar', 'SkillListScrollFrameScrollBar'}
	for i = 1, #AllCharacterFrameScrollbars do
		F.ReskinScroll(_G[AllCharacterFrameScrollbars[i]])
	end

	local AllCharacterFrameCheckBoxes = {'ReputationDetailAtWarCheckBox', 'ReputationDetailInactiveCheckBox', 'ReputationDetailMainScreenCheckBox', 'TokenFramePopupInactiveCheckBox', 'TokenFramePopupBackpackCheckBox'}
	for i = 1, #AllCharacterFrameCheckBoxes do
		F.ReskinCheck(_G[AllCharacterFrameCheckBoxes[i]])
	end

	for i = 1, 5 do
		F.ReskinTab(_G['CharacterFrameTab'..i])
	end
	
	for i = 1, 3 do
		F.StripTextures(_G['PetPaperDollFrameTab'..i])
		_G['PetPaperDollFrameTab'..i]:SetHighlightTexture(C.media.backdrop)
		local ght = _G['PetPaperDollFrameTab'..i]:GetHighlightTexture()
		ght:SetVertexColor(r, g, b, .25)
	end

	local AllCharacterFrameButtons = {'PlayerTitleFrameButton', 'GearManagerDialogDeleteSet', 'GearManagerDialogEquipSet', 'GearManagerDialogSaveSet', 'CompanionSummonButton', 'SkillFrameCancelButton', 'TokenFrameCancelButton'}
	for i = 1, #AllCharacterFrameButtons do
		F.Reskin(_G[AllCharacterFrameButtons[i]])
	end
	
	local PTFB = PlayerTitleFrameButton:CreateTexture(nil, 'ARTWORK')
	PTFB:SetTexture(C.media.arrowDown)
	PTFB:SetSize(10, 10)
	PTFB:SetPoint('CENTER')
	PTFB:SetVertexColor(1, 1, 1)
	
	local PTF = CreateFrame('Frame', nil, PlayerTitleFrame)
	PTF:SetPoint('TOPLEFT', 20, 5)
	PTF:SetPoint('BOTTOMRIGHT', -16, 13)
	PTF:SetFrameLevel(PlayerTitleFrame:GetFrameLevel()-1)
	F.CreateBD(PTF, 0)
	F.CreateGradient(PTF)

	local slots = { 'HeadSlot', 'NeckSlot', 'ShoulderSlot', 'BackSlot', 'ChestSlot', 'ShirtSlot', 'TabardSlot', 'WristSlot', 'HandsSlot', 'WaistSlot', 'LegsSlot', 'FeetSlot', 'Finger0Slot', 'Finger1Slot', 'Trinket0Slot', 'Trinket1Slot', 'MainHandSlot', 'SecondaryHandSlot', 'RangedSlot', 'AmmoSlot'}
	for _, slot in pairs(slots) do
		local icon = _G['Character'..slot..'IconTexture']
		local slot = _G['Character'..slot]
		F.StripTextures(slot)
		F.StyleButton(slot)
		F.CreateBD(slot, .25)
		icon:SetTexCoord(.08, .92, .08, .92)
		icon:ClearAllPoints()
		icon:SetPoint('TOPLEFT', 1, -1)
		icon:SetPoint('BOTTOMRIGHT', -1, 1)
	end	

	local function ColorItemBorder()
		for _, slot in pairs(slots) do
			local target = _G['Character'..slot]
			local slotId, _, _ = GetInventorySlotInfo(slot)
			local itemId = GetInventoryItemID('player', slotId)

			if itemId then
				local _, _, rarity, _, _, _, _, _, _, _, _ = GetItemInfo(itemId)
				if rarity and rarity > 1 then
					target:SetBackdropBorderColor(GetItemQualityColor(rarity))
				else
					target:SetBackdropBorderColor(0, 0, 0)
				end
			else
				target:SetBackdropBorderColor(0, 0, 0)
			end
		end
	end
	
	local CheckItemBorderColor = CreateFrame('Frame')
	CheckItemBorderColor:RegisterEvent('PLAYER_EQUIPMENT_CHANGED')
	CheckItemBorderColor:SetScript('OnEvent', ColorItemBorder)	
	CharacterFrame:HookScript('OnShow', ColorItemBorder)
	ColorItemBorder()
	
	for i = 1, 10 do
		F.StripTextures(_G['GearSetButton'..i])
		F.StyleButton(_G['GearSetButton'..i])
		F.CreateBD(_G['GearSetButton'..i], .25)
		_G['GearSetButton'..i..'Icon']:SetTexCoord(.08, .92, .08, .92)
		_G['GearSetButton'..i..'Icon']:SetPoint('TOPLEFT', 1, -1)
		_G['GearSetButton'..i..'Icon']:SetPoint('BOTTOMRIGHT', -1, 1)
	end
	
	local function SkinItemFlyouts()
		F.StripTextures(PaperDollFrameItemFlyoutButtons)
		
		for i=1, PDFITEMFLYOUT_MAXITEMS do
			local button = _G['PaperDollFrameItemFlyoutButtons'..i]
			local icon = _G['PaperDollFrameItemFlyoutButtons'..i..'IconTexture']
			if button then
				F.StyleButton(button)
				F.CreateBD(button, .25)
				button:GetNormalTexture():SetTexture(nil)
				button:SetFrameLevel(button:GetFrameLevel() + 2)
				
				icon:SetTexCoord(.08, .92, .08, .92)
				icon:ClearAllPoints()
				icon:SetPoint('TOPLEFT', 1, -1)
				icon:SetPoint('BOTTOMRIGHT', -1, 1)
			end
		end	
	end
	
	PaperDollFrameItemFlyout:HookScript('OnShow', SkinItemFlyouts)
	hooksecurefunc('PaperDollItemSlotButton_UpdateFlyout', SkinItemFlyouts)
	
	for i = 1, NUM_COMPANIONS_PER_PAGE do
		local CB = _G['CompanionButton'..i]
		
		F.StripTextures(CB)
		F.StyleButton(CB)
		F.CreateBD(CB, .25)
	end
	
	F.SetBD(CharacterFrame, 10, -12, -31, 76)
	F.ReskinClose(CharacterFrameCloseButton, 'TOPRIGHT', CharacterFrame, 'TOPRIGHT', -35, -16)
	
	F.CreateBD(GearManagerDialog)
	GearManagerDialog:SetPoint('TOPLEFT', PaperDollFrame, 'TOPRIGHT', -30, -12)
	F.ReskinClose(GearManagerDialogClose, 'TOPRIGHT', GearManagerDialog, 'TOPRIGHT', -4, -4)
	
	F.ReskinArrow(CompanionPrevPageButton, 'left', 30)
	F.ReskinArrow(CompanionNextPageButton, 'right', 30)
	
	local function UpdateFactionSkins()
		for i = 1, GetNumFactions() do
			local RRB = _G['ReputationBar'..i..'ReputationBar']

			if RRB then
				RRB:SetStatusBarTexture(C.media.backdrop)

				if not RRB.reskinned then
					F.CreateBD(RRB, .25)
					RRB.reskinned = true
				end

				_G['ReputationBar'..i..'Background']:SetTexture(nil)
				_G['ReputationBar'..i..'ReputationBarHighlight1']:SetTexture(nil)
				_G['ReputationBar'..i..'ReputationBarHighlight2']:SetTexture(nil)
				_G['ReputationBar'..i..'ReputationBarAtWarHighlight1']:SetTexture(nil)
				_G['ReputationBar'..i..'ReputationBarAtWarHighlight2']:SetTexture(nil)
				_G['ReputationBar'..i..'ReputationBarLeftTexture']:SetTexture(nil)
				_G['ReputationBar'..i..'ReputationBarRightTexture']:SetTexture(nil)
			end
		end
	end

	ReputationFrame:HookScript('OnShow', UpdateFactionSkins)
	ReputationFrame:HookScript('OnEvent', UpdateFactionSkins)
	
	F.CreateBD(ReputationDetailFrame)
	ReputationDetailFrame:SetPoint('TOPLEFT', ReputationFrame, 'TOPRIGHT', -30, -12)
	F.ReskinClose(ReputationDetailCloseButton, 'TOPRIGHT', ReputationDetailFrame, 'TOPRIGHT', -4, -4)
	
	
	F.CreateBD(TokenFramePopup)
	TokenFramePopup:SetPoint('TOPLEFT', TokenFrame, 'TOPRIGHT', -30, -12)
	F.ReskinClose(TokenFramePopupCloseButton, 'TOPRIGHT', TokenFramePopup, 'TOPRIGHT', -4, -4)
end)