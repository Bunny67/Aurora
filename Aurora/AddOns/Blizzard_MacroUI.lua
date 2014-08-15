local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local select = select;
local unpack = unpack;

local TexCoords = F.TexCoords;
local Noop = F.dummy;

C.Modules['Blizzard_MacroUI'] = function()
	-- MacroFrame;
	F:SetBD(MacroFrame, 11, -12, -34, 74);
	MacroFramePortrait:Hide();
	
	for i = 2, 5 do
		select(i, MacroFrame:GetRegions()):SetTexture(nil);
	end
	
	MacroHorizontalBarLeft:SetTexture(nil);
	
	select(8, MacroFrame:GetRegions()):SetTexture(nil);
	
	MacroFrameSelectedMacroBackground:SetTexture(nil);
	
	MacroFrameSelectedMacroButton:SetPoint("TOPLEFT", MacroFrameSelectedMacroBackground, "TOPLEFT", 12, -15);
	
	MacroFrameSelectedMacroButton:SetNormalTexture('');
	F:StyleButton(MacroFrameSelectedMacroButton, nil, true);
	F:CreateBG(MacroFrameSelectedMacroButton);
	
	MacroFrameSelectedMacroButton.Hover:SetAllPoints();
	
	select(2, MacroFrameSelectedMacroButton:GetRegions()):SetTexture(nil);
	
	MacroFrameSelectedMacroButtonIcon:SetAllPoints();
	MacroFrameSelectedMacroButtonIcon:SetTexCoord(unpack(TexCoords));
	
	MacroButtonScrollFrame:DisableDrawLayer('ARTWORK');
	F:ReskinScroll(MacroButtonScrollFrameScrollBar);
	
	do
		local MacroButton, MacroIcon;
		
		for i = 1, MAX_ACCOUNT_MACROS do
			MacroButton = _G['MacroButton'..i];
			MacroIcon = _G['MacroButton'..i..'Icon'];
			
			MacroButton:SetNormalTexture('');
			F:StyleButton(MacroButton, nil, true);
			F:CreateBD(MacroButton, .25);
			
			select(2, MacroButton:GetRegions()):SetTexture(nil);
			
			MacroIcon:SetPoint('TOPLEFT', 1, -1);
			MacroIcon:SetPoint('BOTTOMRIGHT', -1, 1);
			MacroIcon:SetTexCoord(unpack(TexCoords));
		end
	end
	
	F:Reskin(MacroEditButton);
	
	F:CreateBD(MacroFrameScrollFrame, .25);
	F:ReskinScroll(MacroFrameScrollFrameScrollBar);
	
	MacroFrameTextBackground:SetBackdrop(nil);
	
	do
		local Tab;
		
		for i = 1, 2 do
			Tab = _G['MacroFrameTab'..i];
			
			for j = 1, 6 do
				select(j, Tab:GetRegions()):Hide();
				select(j, Tab:GetRegions()).Show = Noop;
			end
			
			select(8, Tab:GetRegions()):Hide();
		end
	end
	
	F:Reskin(MacroDeleteButton);
	F:Reskin(MacroNewButton);
	F:Reskin(MacroExitButton);
	
	F:ReskinClose(MacroFrameCloseButton, 'TOPRIGHT', MacroFrame, 'TOPRIGHT', -38, -16);
	-- MacroPopupFrame;
	F:SetBD(MacroPopupFrame, 7, -10, -5, 7);
	
	for i = 1, 4 do
		select(i, MacroPopupFrame:GetRegions()):SetTexture(nil);
	end
	
	F:ReskinInput(MacroPopupEditBox);
	
	MacroPopupNameLeft:SetTexture(nil);
	MacroPopupNameMiddle:SetTexture(nil);
	MacroPopupNameRight:SetTexture(nil);
	
	MacroPopupScrollFrame:DisableDrawLayer('BACKGROUND');
	F:ReskinScroll(MacroPopupScrollFrameScrollBar);
	
	do
		local MacroPopupButton, MacroPopupIcon;
		
		for i = 1, NUM_MACRO_ICONS_SHOWN do
			MacroPopupButton = _G['MacroPopupButton'..i];
			MacroPopupIcon = _G['MacroPopupButton'..i..'Icon'];
			
			MacroPopupButton:SetNormalTexture('');
			F:StyleButton(MacroPopupButton, nil, true);
			F:CreateBD(MacroPopupButton, .25);
			
			select(2, MacroPopupButton:GetRegions()):SetTexture(nil);
			
			MacroPopupIcon:SetPoint('TOPLEFT', 1, -1);
			MacroPopupIcon:SetPoint('BOTTOMRIGHT', -1, 1);
			MacroPopupIcon:SetTexCoord(unpack(TexCoords));
		end
	end
	
	F:Reskin(MacroPopupOkayButton);
	F:Reskin(MacroPopupCancelButton);
end