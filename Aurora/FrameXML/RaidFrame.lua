local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local select = select;
local tinsert = table.insert;

tinsert(C.Modules['Aurora'], function()
	F.Reskin(RaidFrameNotInRaidRaidBrowserButton, nil, true);
	F.Reskin(RaidFrameConvertToRaidButton);
	F.Reskin(RaidFrameRaidInfoButton);
	
	F.CreateBD(RaidInfoFrame);
	
	for i = 1, 4 do
		select(i, RaidInfoFrame:GetRegions()):SetTexture(nil);
	end
	
	do
		local RaidInfo = { 'RaidInfoInstanceLabel', 'RaidInfoIDLabel' };
		
		for i = 1, #RaidInfo do
			_G[RaidInfo[i]]:DisableDrawLayer('BACKGROUND');
			
			do
				local RaidInfoLBG = CreateFrame('Frame', nil, _G[RaidInfo[i]]);
				RaidInfoLBG:SetPoint('TOPLEFT', 2, 0);
				RaidInfoLBG:SetPoint('BOTTOMRIGHT', -1, 0);
				RaidInfoLBG:SetFrameLevel(_G[RaidInfo[i]]:GetFrameLevel() - 1);
				F.CreateBD(RaidInfoLBG, .25);
			end
		end
	end
	
	F.ReskinClose(RaidInfoCloseButton);
	
	F.ReskinScroll(RaidInfoScrollFrameScrollBar);
	
	F.Reskin(RaidInfoExtendButton, nil, true);
	F.Reskin(RaidInfoCancelButton, nil, true);
end);