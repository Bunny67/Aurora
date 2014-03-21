local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	local r, g, b = C.r, C.g, C.b
	
	hooksecurefunc('UIDropDownMenu_CreateFrames', function(level, index)
		for i = 1, UIDROPDOWNMENU_MAXLEVELS do
			local MenuBackdrop = _G['DropDownList'..i..'MenuBackdrop'];
			local Backdrop = _G['DropDownList'..i..'Backdrop'];
			
			if not Backdrop.reskinned then
				F.CreateBD(MenuBackdrop);
				F.CreateBD(Backdrop);
				
				Backdrop.reskinned = true;
			end
		end
	end)

	local CreateBackdrop = function(Parent, Texture)
		local BG = Parent:CreateTexture(nil, 'BACKGROUND');
		BG:SetTexture(0, 0, 0, .5);
		BG:SetPoint('CENTER', Texture);
		BG:SetSize(12, 12);
		Parent.BG = BG;

		local Left = Parent:CreateTexture(nil, 'BACKGROUND');
		Left:SetWidth(1);
		Left:SetTexture(0, 0, 0);
		Left:SetPoint('TOPLEFT', BG);
		Left:SetPoint('BOTTOMLEFT', BG);
		Parent.Left = Left;

		local Right = Parent:CreateTexture(nil, 'BACKGROUND');
		Right:SetWidth(1);
		Right:SetTexture(0, 0, 0);
		Right:SetPoint('TOPRIGHT', BG);
		Right:SetPoint('BOTTOMRIGHT', BG);
		Parent.Right = Right;

		local Top = Parent:CreateTexture(nil, 'BACKGROUND');
		Top:SetHeight(1);
		Top:SetTexture(0, 0, 0);
		Top:SetPoint('TOPLEFT', BG);
		Top:SetPoint('TOPRIGHT', BG);
		Parent.Top = Top;

		local Bottom = Parent:CreateTexture(nil, 'BACKGROUND');
		Bottom:SetHeight(1);
		Bottom:SetTexture(0, 0, 0);
		Bottom:SetPoint('BOTTOMLEFT', BG);
		Bottom:SetPoint('BOTTOMRIGHT', BG);
		Parent.Bottom = Bottom;
	end

	local ToggleBackdrop = function(Button, Show)
		if Show then
			Button.BG:Show(); Button.Left:Show(); Button.Right:Show(); Button.Top:Show(); Button.Bottom:Show();
		else
			Button.BG:Hide(); Button.Left:Hide(); Button.Right:Hide(); Button.Top:Hide(); Button.Bottom:Hide();
		end
	end

	hooksecurefunc('ToggleDropDownMenu', function(level, _, dropDownFrame, anchorName)
		if not level then level = 1; end
		
		local UIScale = UIParent:GetScale();
		local ListFrame = _G['DropDownList'..level];

		if level == 1 then
			if not anchorName then
				local xOffset = dropDownFrame.xOffset and dropDownFrame.xOffset or 16;
				local yOffset = dropDownFrame.yOffset and dropDownFrame.yOffset or 9;
				local point = dropDownFrame.point and dropDownFrame.point or "TOPLEFT";
				local relativeTo = dropDownFrame.relativeTo and dropDownFrame.relativeTo or dropDownFrame;
				local relativePoint = dropDownFrame.relativePoint and dropDownFrame.relativePoint or "BOTTOMLEFT";

				ListFrame:ClearAllPoints();
				ListFrame:SetPoint(point, relativeTo, relativePoint, xOffset, yOffset);
				local offLeft = ListFrame:GetLeft() / UIScale;
				local offRight = (GetScreenWidth() - ListFrame:GetRight()) / UIScale;
				local offTop = (GetScreenHeight() - ListFrame:GetTop()) / UIScale;
				local offBottom = ListFrame:GetBottom() / UIScale;
				local xAddOffset, yAddOffset = 0, 0;
				
				if offLeft < 0 then
					xAddOffset = -offLeft;
				elseif offRight < 0 then
					xAddOffset = offRight;
				end

				if offTop < 0 then
					yAddOffset = offTop;
				elseif offBottom < 0 then
					yAddOffset = -offBottom;
				end
				
				ListFrame:ClearAllPoints();
				ListFrame:SetPoint(point, relativeTo, relativePoint, xOffset + xAddOffset, yOffset + yAddOffset);
			elseif anchorName ~= 'cursor' then
				local _, _, relPoint, xOff, yOff = ListFrame:GetPoint();
				
				if relPoint == 'BOTTOMLEFT' and xOff == 0 and floor(yOff) == 5 then
					ListFrame:SetPoint('TOPLEFT', anchorName, 'BOTTOMLEFT', 16, 9);
				end
			end
		else
			local point, anchor, relPoint, _, y = ListFrame:GetPoint();
			
			if point:find('RIGHT') then
				ListFrame:SetPoint(point, anchor, relPoint, -14, y);
			else
				ListFrame:SetPoint(point, anchor, relPoint, 9, y);
			end
		end

		for j = 1, UIDROPDOWNMENU_MAXBUTTONS do
			local Button = _G['DropDownList'..level..'Button'..j];
			local _, _, _, x = Button:GetPoint();
			
			if Button:IsShown() and x then
				local Highlight = _G['DropDownList'..level..'Button'..j..'Highlight']
				local Check = _G['DropDownList'..level..'Button'..j..'Check'];

				Highlight:SetPoint('TOPLEFT', - x + 1, 0);
				Highlight:SetPoint('BOTTOMRIGHT', ListFrame:GetWidth() - Button:GetWidth() - x - 1, 0);

				if not Button.BG then
					CreateBackdrop(Button, Check);
					Highlight:SetTexture(r, g, b, .2);

					local ExpandArrow = _G['DropDownList'..level..'Button'..j..'ExpandArrow'];
					ExpandArrow:SetNormalTexture(C.Media.ArrowRight);
					ExpandArrow:SetSize(8, 8);
				end

				if not Button.notCheckable then
					ToggleBackdrop(Button, true);
					
					local _, _, _, co = Check:GetTexCoord();

					if co == 0 then
						Check:SetTexture('Interface\\Buttons\\UI-CheckBox-Check');
						Check:SetVertexColor(r, g, b, 1);
						Check:SetSize(20, 20);
					else
						Check:SetTexture(C.Media.Backdrop);
						Check:SetVertexColor(r, g, b, .6);
						Check:SetSize(10, 10);
					end

					Check:SetTexCoord(0, 1, 0, 1);
				else
					ToggleBackdrop(Button, false);
				end
			end
		end
	end)
end)