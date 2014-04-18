local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;
local pairs = pairs;

local TexCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	local r, g, b = C.r, C.g, C.b

	local function ColourMinimize(Frame)
		if Frame:IsEnabled() then
			Frame.Minimize:SetVertexColor(r, g, b);
		end
	end

	local function ClearMinimize(Frame)
		Frame.Minimize:SetVertexColor(1, 1, 1);
	end

	for i = 1, STATICPOPUP_NUMDIALOGS do
		local Frame = _G['StaticPopup'..i];
		local Item = _G['StaticPopup'..i..'ItemFrame'];
		local ItemIconTexture = _G['StaticPopup'..i..'ItemFrameIconTexture'];
		local ItemName = _G['StaticPopup'..i..'ItemFrameNameFrame'];
		local Close = _G['StaticPopup'..i..'CloseButton'];
		
		local EditBox = _G['StaticPopup'..i..'EditBox'];
		local WideEditBox = _G['StaticPopup'..i..'WideEditBox'];
		local Gold = _G['StaticPopup'..i..'MoneyInputFrameGold'];
		local Silver = _G['StaticPopup'..i..'MoneyInputFrameSilver'];
		local Copper = _G['StaticPopup'..i..'MoneyInputFrameCopper'];
		
		F.CreateBD(Frame);

		for j = 1, 3 do
			F.Reskin(Frame['button'..j]);
		end
		
		Item:SetNormalTexture('');
		F.StyleButton(Item);
		F.CreateBG(Item);
		
		Item.Hover:SetAllPoints();
		Item.Pushed:SetAllPoints();
		
		ItemIconTexture:SetTexCoord(unpack(TexCoords));
		
		ItemName:Hide();

		F.ReskinClose(Close);

		Close.Minimize = Close:CreateTexture(nil, 'OVERLAY');
		Close.Minimize:SetSize(9, 1);
		Close.Minimize:SetPoint('CENTER');
		Close.Minimize:SetTexture(C.Media.Backdrop);
		Close.Minimize:SetVertexColor(1, 1, 1);
		Close:HookScript('OnEnter', ColourMinimize);
		Close:HookScript('OnLeave', ClearMinimize);
		
		select(6, EditBox:GetRegions()):Hide();
		select(7, EditBox:GetRegions()):Hide();
		F.ReskinInput(EditBox, 22);
		
		select(8, WideEditBox:GetRegions()):Hide();
		F.ReskinInput(WideEditBox, 22);
		
		F.ReskinInput(Gold);
		F.ReskinInput(Silver);
		F.ReskinInput(Copper);
	end

	hooksecurefunc('StaticPopup_Show', function(which, text_arg1, text_arg2, data)
		local info = StaticPopupDialogs[which];
		if not info then return; end

		local dialog = nil;
		dialog = StaticPopup_FindVisible(which, data);

		if not dialog then
			local index = 1;
			if info.preferredIndex then
				index = info.preferredIndex;
			end
			for i = index, STATICPOPUP_NUMDIALOGS do
				local Frame = _G["StaticPopup"..i];
				if not Frame:IsShown() then
					dialog = Frame;
					break
				end
			end

			if not dialog and info.preferredIndex then
				for i = 1, info.preferredIndex do
					local Frame = _G['StaticPopup'..i];
					if not Frame:IsShown() then
						dialog = Frame;
						break
					end
				end
			end
		end

		if not dialog then return; end

		if info.closeButton then
			local CloseButton = _G[dialog:GetName()..'CloseButton'];

			CloseButton:SetNormalTexture('');
			CloseButton:SetPushedTexture('');

			if info.closeButtonIsHide then
				for _, pixel in pairs(CloseButton.Pixels) do
					pixel:Hide();
				end
				
				CloseButton.Minimize:Show();
			else
				for _, pixel in pairs(CloseButton.Pixels) do
					pixel:Show();
				end
				
				CloseButton.Minimize.Hide();
			end
		end
	end);
end);