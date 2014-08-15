local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local select = select;
local tinsert = table.insert;

tinsert(C.Modules['Aurora'], function()
	F:SetBD(LFRParentFrame, 15, -12, -1, 3);
	LFRParentFrameIcon:Hide();
	
	do
		local Child;
		
		for i = 1, LFRParentFrame:GetNumChildren() do
			local Child = select(i, LFRParentFrame:GetChildren());
			
			if Child.GetPushedTexture and Child:GetPushedTexture() and not Child:GetName() then
				F:ReskinClose(Child, 'TOPRIGHT', LFRParentFrame, 'TOPRIGHT', -5, -16);
			end
		end
	end
	
	LFRQueueFrameLayout:SetTexture(nil);
	
	do
		local RoleButton = { 'Tank', 'Healer', 'DPS' };
		local Button;
		
		for i = 1, #RoleButton do
			Button = _G['LFRQueueFrameRoleButton'..RoleButton[i]];
			
			Button:SetNormalTexture(C.Media.RoleIcons);
			Button.cover:SetTexture(C.Media.RoleIcons);
			
			if ( Button.background ) then
				Button.background:SetTexture(nil);
			end
			
			local Left = Button:CreateTexture(nil, 'OVERLAY');
			Left:SetWidth(1);
			Left:SetTexture(C.Media.Backdrop);
			Left:SetVertexColor(0, 0, 0);
			Left:SetPoint('TOPLEFT', 6, -5);
			Left:SetPoint('BOTTOMLEFT', 6, 7);

			local Right = Button:CreateTexture(nil, 'OVERLAY');
			Right:SetWidth(1);
			Right:SetTexture(C.Media.Backdrop);
			Right:SetVertexColor(0, 0, 0);
			Right:SetPoint('TOPRIGHT', -5, -5);
			Right:SetPoint('BOTTOMRIGHT', -5, 7);

			local Top = Button:CreateTexture(nil, 'OVERLAY');
			Top:SetHeight(1);
			Top:SetTexture(C.Media.Backdrop);
			Top:SetVertexColor(0, 0, 0);
			Top:SetPoint('TOPLEFT', 6, -4);
			Top:SetPoint('TOPRIGHT', -5, -4);

			local Bottom = Button:CreateTexture(nil, 'OVERLAY');
			Bottom:SetHeight(1);
			Bottom:SetTexture(C.Media.Backdrop);
			Bottom:SetVertexColor(0, 0, 0);
			Bottom:SetPoint('BOTTOMLEFT', 6, 7);
			Bottom:SetPoint('BOTTOMRIGHT', -5, 7);
			
			Button.checkButton:SetFrameLevel(Button:GetFrameLevel() + 2);
			F:ReskinCheck(Button.checkButton);
		end
	end
	
	do
		local Button;
		
		for i = 1, NUM_LFR_CHOICE_BUTTONS do
			Button = _G['LFRQueueFrameSpecificListButton'..i];
			
			-- F:ReskinCheck(Button.enableButton);
			
			F:ReskinExpandOrCollapse(Button.expandOrCollapseButton);
		end
	end
	
	LFRQueueFrameSpecificListScrollFrame:DisableDrawLayer('BACKGROUND');
	F:ReskinScroll(LFRQueueFrameSpecificListScrollFrameScrollBar);
	
	F:Reskin(LFRQueueFrameFindGroupButton);
	F:Reskin(LFRQueueFrameAcceptCommentButton);
	
	F:Reskin(LFRQueueFrameNoLFRWhileLFDLeaveQueueButton);
	
	LFRBrowseFrameLayout:SetTexture(nil);
	
	F:ReskinDropDown(LFRBrowseFrameRaidDropDown);
	
	do
		local Header;
		
		for i = 1, 7 do
			Header = _G['LFRBrowseFrameColumnHeader'..i];
			
			F:ReskinHeader(Header);
		end
	end
	
	F:ReskinScroll(LFRBrowseFrameListScrollFrameScrollBar);
	
	F:Reskin(LFRBrowseFrameSendMessageButton);
	F:Reskin(LFRBrowseFrameInviteButton);
	F:Reskin(LFRBrowseFrameRefreshButton);
	
	do
		local Tab;
		
		for i = 1, 2 do
			Tab = _G['LFRParentFrameTab'..i];
			
			F:ReskinTab(Tab);
		end
	end
	
	hooksecurefunc('LFRQueueFrameSpecificListButton_SetDungeon', function(button, dungeonID)
		if ( LFGCollapseList[dungeonID] ) then
			button.expandOrCollapseButton.Plus:Show();
		else
			button.expandOrCollapseButton.Plus:Hide();
		end
	end);
end);