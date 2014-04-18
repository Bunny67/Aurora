local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;

local TexCoords = F.TexCoords;
local Noop = F.dummy;

C.Modules['Blizzard_MacroUI'] = function()
	-- MacroFrame;
	F.SetBD(MacroFrame, 11, -12, -34, 74);
	MacroFramePortrait:Hide();
	
	for i = 2, 5 do
		select(i, MacroFrame:GetRegions()):Hide();
	end
	
	MacroHorizontalBarLeft:Hide();
	
	select(8, MacroFrame:GetRegions()):Hide();
	
	MacroFrameSelectedMacroBackground:SetAlpha(0);
	
	MacroFrameSelectedMacroButton:SetPoint("TOPLEFT", MacroFrameSelectedMacroBackground, "TOPLEFT", 12, -15);
	
	MacroFrameSelectedMacroButton:SetNormalTexture('');
	F.StyleButton(MacroFrameSelectedMacroButton, nil, true);
	F.CreateBG(MacroFrameSelectedMacroButton);
	
	MacroFrameSelectedMacroButton.Hover:SetAllPoints();
	
	select(2, MacroFrameSelectedMacroButton:GetRegions()):Hide();
	
	MacroFrameSelectedMacroButtonIcon:SetAllPoints();
	MacroFrameSelectedMacroButtonIcon:SetTexCoord(unpack(TexCoords));
	
	MacroButtonScrollFrame:DisableDrawLayer('ARTWORK');
	F.ReskinScroll(MacroButtonScrollFrameScrollBar);
	
	for i = 1, MAX_ACCOUNT_MACROS do
		local MacroButton = _G['MacroButton'..i];
		local MacroIcon = _G['MacroButton'..i..'Icon'];
		
		MacroButton:SetNormalTexture('');
		F.StyleButton(MacroButton, nil, true);
		F.CreateBD(MacroButton, .25);
		
		select(2, MacroButton:GetRegions()):Hide();
		
		MacroIcon:SetPoint('TOPLEFT', 1, -1);
		MacroIcon:SetPoint('BOTTOMRIGHT', -1, 1);
		MacroIcon:SetTexCoord(unpack(TexCoords));
	end
	
	F.Reskin(MacroEditButton);
	
	F.CreateBD(MacroFrameScrollFrame, .25);
	F.ReskinScroll(MacroFrameScrollFrameScrollBar);
	
	MacroFrameTextBackground:SetBackdrop(nil);
	
	for i = 1, 2 do
		local Tab = _G['MacroFrameTab'..i];
		
		for j = 1, 6 do
			select(j, Tab:GetRegions()):Hide();
			select(j, Tab:GetRegions()).Show = Noop;
		end
		
		select(8, Tab:GetRegions()):Hide();
	end
	
	F.Reskin(MacroDeleteButton);
	F.Reskin(MacroNewButton);
	F.Reskin(MacroExitButton);
	
	F.ReskinClose(MacroFrameCloseButton, 'TOPRIGHT', MacroFrame, 'TOPRIGHT', -38, -16);
	-- MacroPopupFrame;
	F.SetBD(MacroPopupFrame, 7, -10, -5, 7);
	
	for i = 1, 4 do
		select(i, MacroPopupFrame:GetRegions()):Hide();
	end
	
	F.ReskinInput(MacroPopupEditBox);
	
	MacroPopupNameLeft:SetTexture(nil);
	MacroPopupNameMiddle:SetTexture(nil);
	MacroPopupNameRight:SetTexture(nil);
	
	MacroPopupScrollFrame:DisableDrawLayer('BACKGROUND');
	F.ReskinScroll(MacroPopupScrollFrameScrollBar);
	
	for i = 1, NUM_MACRO_ICONS_SHOWN do
		local MacroPopupButton = _G['MacroPopupButton'..i];
		local MacroPopupIcon = _G['MacroPopupButton'..i..'Icon'];
		
		MacroPopupButton:SetNormalTexture('');
		F.StyleButton(MacroPopupButton, nil, true);
		F.CreateBD(MacroPopupButton, .25);
		
		select(2, MacroPopupButton:GetRegions()):Hide();
		
		MacroPopupIcon:SetPoint('TOPLEFT', 1, -1);
		MacroPopupIcon:SetPoint('BOTTOMRIGHT', -1, 1);
		MacroPopupIcon:SetTexCoord(unpack(TexCoords));
	end
	
	F.Reskin(MacroPopupOkayButton);
	F.Reskin(MacroPopupCancelButton);
end