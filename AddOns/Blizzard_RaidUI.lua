local F, C = unpack(select(2, ...))
-- ����
C.modules["Blizzard_RaidUI"] = function()
	if AuroraConfig.RaidUI then
	-- [[ ������ ]]
		local AllRaidUIButtons = {'RaidFrameRaidBrowserButton', 'RaidFrameReadyCheckButton'}
		for i = 1, #AllRaidUIButtons do
		local AllRaidUIButton = _G[AllRaidUIButtons[i]]
			if AllRaidUIButton then
				F.Reskin(AllRaidUIButton)
			else
				print("������ Aurora: "..AllRaidUIButtons[i].." �� ��� ������.")
			end
		end
		for i = 1, MAX_RAID_GROUPS do
			local rGrp = _G["RaidGroup"..i]
			F.StripTextures(rGrp)
		end
		for i = 1, MAX_RAID_GROUPS * 5 do
			local bu = _G["RaidGroupButton"..i]
			F.StripTextures(bu)
			F.CreateBD(bu, 1)
			F.StyleButton(bu)
		end
	end
end