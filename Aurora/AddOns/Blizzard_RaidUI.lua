local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local select = select;
local pairs = pairs;

C.Modules['Blizzard_RaidUI'] = function()
	F:Reskin(RaidFrameRaidBrowserButton);
	F:Reskin(RaidFrameReadyCheckButton);
	
	do
		local Group, GroupSlot;
		
		for i = 1, MAX_RAID_GROUPS do
			Group = _G['RaidGroup'..i];
			
			Group:GetRegions():Hide();
			
			for j = 1, 5 do
				GroupSlot = _G['RaidGroup'..i..'Slot'..j];
				
				GroupSlot:SetHighlightTexture('');
			end
		end
	end
	
	do 
		local GroupButton;
		
		for i = 1, MAX_RAID_GROUPS * 5 do
			GroupButton = _G['RaidGroupButton'..i];
			
			F:StyleButton(GroupButton);
			F:Reskin(GroupButton);
			
			GroupButton.Gradient = GroupButton:CreateTexture(nil, 'BORDER');
			GroupButton.Gradient:SetPoint('TOPLEFT', 1, -1);
			GroupButton.Gradient:SetPoint('BOTTOMRIGHT', -1, 1);
			GroupButton.Gradient:SetTexture(C.Media.Backdrop)
			GroupButton.Gradient:SetVertexColor(.2, .2, .2, 1)
		end
	end
	
	hooksecurefunc('RaidClassButton_Update', function()
		local Button, Icon, Count;
		
		for index, value in pairs(RAID_CLASS_BUTTONS) do
			Button  = _G['RaidClassButton'..value.button];
			Count = _G['RaidClassButton'..value.button..'Count'];
			Icon = _G['RaidClassButton'..value.button..'IconTexture'];
			
			select(1, Button:GetRegions()):Hide();
			
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
	end);
end