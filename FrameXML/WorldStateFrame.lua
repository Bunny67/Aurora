local F, C = unpack(select(2, ...))

tinsert(C.modules['Aurora'], function()
	local AllWorldStateFrameStripTextures = {'WorldStateScoreFrame', 'WorldStateScoreScrollFrame'}
	for i = 1, #AllWorldStateFrameStripTextures do
		F.StripTextures(_G[AllWorldStateFrameStripTextures[i]], true)
	end

	local AllWorldStateFrameScrollbars = {'WorldStateScoreScrollFrameScrollBar'}
	for i = 1, #AllWorldStateFrameScrollbars do
		F.ReskinScroll(_G[AllWorldStateFrameScrollbars[i]])
	end

	for i = 1, 3 do
		F.ReskinTab(_G['WorldStateScoreFrameTab'..i])
	end

	local AllWorldStateFrameButtons = {'WorldStateScoreFrameLeaveButton'}
	for i = 1, #AllWorldStateFrameButtons do
		F.Reskin(_G[AllWorldStateFrameButtons[i]])
	end
	
	F.SetBD(WorldStateScoreFrame, 10, -15, -113, 68)
	F.ReskinClose(WorldStateScoreFrameCloseButton, 'TOPRIGHT', WorldStateScoreFrame, 'TOPRIGHT', -117, -19)
end)