local F, C = unpack(select(2, ...))

tinsert(C.modules['Aurora'], function()
	local AllArenaRegistrarFrameStripTextures = {'ArenaRegistrarFrame', 'ArenaRegistrarGreetingFrame'}
	for i = 1, #AllArenaRegistrarFrameStripTextures do
		F.StripTextures(_G[AllArenaRegistrarFrameStripTextures[i]], true)
	end

	local AllArenaRegistrarFrameButtons = {'ArenaRegistrarFramePurchaseButton', 'ArenaRegistrarFrameCancelButton', 'ArenaRegistrarFrameGoodbyeButton'}
	for i = 1, #AllArenaRegistrarFrameButtons do
		F.Reskin(_G[AllArenaRegistrarFrameButtons[i]])
	end

	select(1, ArenaRegistrarGreetingFrame:GetRegions()):SetTextColor(1, 1, 0)
	RegistrationText:SetTextColor(1, 1, 0)
	ArenaRegistrarPurchaseText:SetTextColor(1, 1, 1)
	for i = 1, MAX_TEAM_BORDERS do
		local text = select(3, _G['ArenaRegistrarButton'..i]:GetRegions())
		text:SetTextColor(1, 1, 1)
	end
	
	F.SetBD(ArenaRegistrarFrame, 10, -12, -31, 67)
	F.ReskinClose(ArenaRegistrarFrameCloseButton, 'TOPRIGHT', ArenaRegistrarFrame, 'TOPRIGHT', -35, -16)
end)