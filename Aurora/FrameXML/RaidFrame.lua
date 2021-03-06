local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	F:Reskin(RaidFrameNotInRaidRaidBrowserButton);
	F:Reskin(RaidFrameConvertToRaidButton);
	F:Reskin(RaidFrameRaidInfoButton);
	
	F:CreateBD(RaidInfoFrame);
	
	for i = 1, 4 do
		select(i, RaidInfoFrame:GetRegions()):SetTexture(nil);
	end
	
	do
		local Frame;
		local RaidInfo = {
			'InstanceLabel',
			'IDLabel'
		};
		
		for i = 1, #RaidInfo do
			Frame = _G['RaidInfo'..RaidInfo[i]];
			Frame:DisableDrawLayer('BACKGROUND');
			
			do
				local RaidInfoLBG = CreateFrame('Frame', nil, Frame);
				RaidInfoLBG:SetPoint('TOPLEFT', 2, 0);
				RaidInfoLBG:SetPoint('BOTTOMRIGHT', -1, 0);
				RaidInfoLBG:SetFrameLevel(Frame:GetFrameLevel() - 1);
				F:CreateBD(RaidInfoLBG, .25);
			end
		end
	end
	
	F:ReskinClose(RaidInfoCloseButton);
	
	F:ReskinScroll(RaidInfoScrollFrameScrollBar);
	
	F:Reskin(RaidInfoExtendButton);
	F:Reskin(RaidInfoCancelButton);
end);