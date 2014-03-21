local F, C = unpack(select(2, ...))

tinsert(C.modules['Aurora'], function()
	local AllPVPFrameStripTextures = {'PVPFrame', 'PVPTeamDetails', 'PVPBattlegroundFrame', 'PVPBattlegroundFrameTypeScrollFrame'}
	for i = 1, #AllPVPFrameStripTextures do
		F.StripTextures(_G[AllPVPFrameStripTextures[i]], true)
	end

	local AllPVPFrameScrollbars = {'PVPBattlegroundFrameTypeScrollFrameScrollBar'}
	for i = 1, #AllPVPFrameScrollbars do
		F.ReskinScroll(_G[AllPVPFrameScrollbars[i]])
	end

	for i = 1, 2 do
		F.ReskinTab(_G['PVPParentFrameTab'..i])
	end
	
	for i = 1, 5 do
		F.StripTextures(_G['PVPTeamDetailsFrameColumnHeader'..i])
	end

	local AllPVPFrameButtons = {'PVPTeamDetailsAddTeamMember', 'PVPBattlegroundFrameGroupJoinButton', 'PVPBattlegroundFrameJoinButton', 'PVPBattlegroundFrameCancelButton'}
	for i = 1, #AllPVPFrameButtons do
		F.Reskin(_G[AllPVPFrameButtons[i]])
	end

	PVPBattlegroundFrameInfoScrollFrameChildFrameDescription:SetTextColor(1, 1, 1)
	PVPBattlegroundFrameInfoScrollFrameChildFrameRewardsInfo.description:SetTextColor(1, 1, 1)
	
	F.SetBD(PVPFrame, 10, -12, -31, 76)
	F.ReskinClose(PVPParentFrameCloseButton, 'TOPRIGHT', PVPFrame, 'TOPRIGHT', -35, -16)
	
	F.CreateBD(PVPTeamDetails)
	PVPTeamDetails:SetPoint('TOPLEFT', PVPFrame, 'TOPRIGHT', -30, -14)
	F.ReskinClose(PVPTeamDetailsCloseButton, 'TOPRIGHT', PVPTeamDetails, 'TOPRIGHT', -4, -4)
	F.ReskinArrow(PVPTeamDetailsToggleButton, 'Right')
	
	F.SetBD(PVPBattlegroundFrame, 8, -11, -33, 77)
end)