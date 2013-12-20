local F, C = unpack(select(2, ...))

tinsert(C.modules['Aurora'], function()
	local AllArenaFrameStripTextures = {'ArenaFrame'}
	for i = 1, #AllArenaFrameStripTextures do
		F.StripTextures(_G[AllArenaFrameStripTextures[i]], true)
	end

	local AllArenaFrameButtons = {'ArenaFrameGroupJoinButton', 'ArenaFrameJoinButton', 'ArenaFrameCancelButton'}
	for i = 1, #AllArenaFrameButtons do
		F.Reskin(_G[AllArenaFrameButtons[i]])
	end

	ArenaFrameZoneDescription:SetTextColor(1, 1, 1)
	
	F.SetBD(ArenaFrame, 10, -12, -31, 74)
	F.ReskinClose(ArenaFrameCloseButton, 'TOPRIGHT', ArenaFrame, 'TOPRIGHT', -35, -16)
end)