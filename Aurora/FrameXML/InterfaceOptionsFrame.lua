local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local select = select;
local tinsert = table.insert;

local Noop = F.dummy;

tinsert(C.Modules['Aurora'], function()
	F:CreateBD(InterfaceOptionsFrame);
	InterfaceOptionsFrameHeader:SetTexture(nil);
	
	F:Reskin(InterfaceOptionsFrameCancel);
	F:Reskin(InterfaceOptionsFrameOkay);
	InterfaceOptionsFrameOkay:SetPoint('BOTTOMRIGHT', InterfaceOptionsFrameCancel, 'BOTTOMLEFT', -1, 0);
	F:Reskin(InterfaceOptionsFrameDefaults);
	
	F:CreateBD(InterfaceOptionsFrameCategories, .25);
	
	for i = 1, 8 do
		select(i, InterfaceOptionsFrameCategories:GetRegions()):SetTexture(nil);
	end
	
	F:ReskinScroll(InterfaceOptionsFrameCategoriesListScrollBar);
	
	F:CreateBD(InterfaceOptionsFrameAddOns, .25);
	
	for i = 1, 8 do
		select(i, InterfaceOptionsFrameAddOns:GetRegions()):SetTexture(nil);
	end
	
	F:ReskinScroll(InterfaceOptionsFrameAddOnsListScrollBar);
	
	F:CreateBD(InterfaceOptionsFramePanelContainer, .25);
	
	do
		local Tab;
		
		for i = 1, 2 do
			Tab = _G['InterfaceOptionsFrameTab'..i];
			
			Tab:DisableDrawLayer('BACKGROUND');
			Tab:DisableDrawLayer('BORDER');
			
			Tab:SetHighlightTexture('');
		end
	end
	
	hooksecurefunc('InterfaceOptions_AddCategory', function()
		local Num = #INTERFACEOPTIONS_ADDONCATEGORIES;
		
		for i = 1, Num do
			local Button = _G['InterfaceOptionsFrameAddOnsButton'..i..'Toggle'];
			
			if Button and not Button.Skinned then
				F:ReskinExpandOrCollapse(Button);
				
				Button:SetPushedTexture(nil);
				Button.SetPushedTexture = Noop;
				
				Button.Skinned = true;
			end
		end
	end);

	hooksecurefunc('OptionsListButtonToggle_OnClick', function(self)
		if (self:GetParent().element.collapsed) then
			self.Plus:Show();
		else
			self.Plus:Hide();
		end
	end);
end);