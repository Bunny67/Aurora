local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local pairs = pairs;

C.modules["Blizzard_RaidUI"] = function()
	F.Reskin(RaidFrameRaidBrowserButton);
	F.Reskin(RaidFrameReadyCheckButton);
	F.Reskin(RaidFrameRaidInfoButton);
	
	for i = 1, MAX_RAID_GROUPS do
		local Group = _G['RaidGroup'..i];
		
		F.StripTextures(Group);
	end
	
	for i = 1, MAX_RAID_GROUPS * 5 do
		local GroupButton = _G['RaidGroupButton'..i];
		
		F.StripTextures(GroupButton);
		F.StyleButton(GroupButton);
		F.Reskin(GroupButton);
		
		GroupButton.Gradient = GroupButton:CreateTexture(nil, 'BORDER');
		GroupButton.Gradient:SetPoint('TOPLEFT', 1, -1);
		GroupButton.Gradient:SetPoint('BOTTOMRIGHT', -1, 1);
		GroupButton.Gradient:SetTexture(C.Media.Backdrop)
		GroupButton.Gradient:SetVertexColor(.2, .2, .2, 1)
	end
	
	for i = 1, 8 do
		for j = 1, 5 do
			F.StripTextures(_G['RaidGroup'..i..'Slot'..j]);
		end
	end
	
	hooksecurefunc('RaidClassButton_Update', function()
		local Button, Icon, Count;
		for index, value in pairs(RAID_CLASS_BUTTONS) do
			Button  = _G['RaidClassButton'..value.button];
			Count = _G['RaidClassButton'..value.button..'Count'];
			Icon = _G['RaidClassButton'..value.button..'IconTexture'];
			
			F.StripTextures(Button);
			
			if ( Button:GetID() ==  value.button ) then
				Button.class = index;
				if ( index == 'PETS' ) then
					Icon:SetTexture('Interface\\RaidFrame\\UI-RaidFrame-Pets');
				elseif ( index == 'MAINTANK' ) then
					Icon:SetTexture('Interface\\RaidFrame\\UI-RaidFrame-MainTank');
				elseif ( index == 'MAINASSIST' ) then
					Icon:SetTexture('Interface\\RaidFrame\\UI-RaidFrame-MainAssist');
				else
					Icon:SetTexture('Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes');
				end
				
				Icon:SetTexCoord(value.coords[1] + 0.015, value.coords[2] - 0.02, value.coords[3] + 0.018, value.coords[4] - 0.02);
			end
		end
	end)
end