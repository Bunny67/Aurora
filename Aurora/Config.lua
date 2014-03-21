local F, C = unpack(Aurora);

local Old = {};
local CheckBoxes = {};

local function CopyTable(Source, Target)
	for Key, Value in pairs(Source) do
		if type(Value) == 'table' then
			Target[Key] = {};
			for k, v in pairs(Value) do
				Target[Key][k] = Value[k];
			end
		else
			Target[Key] = Value;
		end
	end
end

local function Toggle(Frame)
	if Frame:GetChecked() then
		AuroraConfig[Frame.Value] = true;
	else
		AuroraConfig[Frame.Value] = false;
	end
end

local function CreateToggleBox(Parent, Value, Text)
	local Check = CreateFrame('CheckButton', 'AuroraConfigCheck'..Value, Parent, 'InterfaceOptionsCheckButtonTemplate');
	Check.Value = Value;
	
	_G[Check:GetName()..'Text']:SetText(Text);
	
	Check:SetScript('OnClick', Toggle);
	
	tinsert(CheckBoxes, Check);
	
	return Check;
end

local function UpdateFrames()
	for i = 1, #C.Frames do
		F.CreateBD(C.Frames[i], AuroraConfig.alpha);
	end
end

local function SetColour()
	local r, g, b = ColorPickerFrame:GetColorRGB()
	AuroraConfig.customColour.r, AuroraConfig.customColour.g, AuroraConfig.customColour.b = r, g, b;
end

local function ResetColour(restore)
	AuroraConfig.customColour.r, AuroraConfig.customColour.g, AuroraConfig.customColour.b = restore.r, restore.g, restore.b;
end

local Config = CreateFrame('Frame', 'AuroraConfigs', UIParent);
Config:EnableMouse(true);
Config:SetMovable(true);
Config:SetResizable(true);
Config:SetClampedToScreen(true);
Config:SetToplevel(true);
Config:SetSize(450, 450);
Config:SetMinResize(300, 300);
Config:SetMaxResize(600, 600);
Config:SetPoint('CENTER');
Config:SetFrameStrata('FULLSCREEN_DIALOG');
Config:SetScript('OnMouseDown', function(self) self:StartMoving(); end);
Config:SetScript('OnMouseUp', function(self) self:StopMovingOrSizing(); end);
Config:SetScript('OnSizeChanged', function(self) Config.ScrollChild:SetWidth(Config.Scroll:GetWidth());
Config.ScrollChild:SetHeight(Config.Scroll:GetHeight()); end);
Config:Hide();

tinsert(UISpecialFrames, 'AuroraConfigs');

Config.Size = CreateFrame('Button', 'AuroraConfigsSize', Config);
Config.Size:SetSize(13, 13);
Config.Size:SetPoint('BOTTOMRIGHT', Config, 'BOTTOMRIGHT', -4, 4);
Config.Size:SetNormalTexture('Interface\\CHATFRAME\\UI-ChatIM-SizeGrabber-Up');
Config.Size:SetHighlightTexture('Interface\\CHATFRAME\\UI-ChatIM-SizeGrabber-Highlight');
Config.Size:SetPushedTexture('Interface\\CHATFRAME\\UI-ChatIM-SizeGrabber-Down');
Config.Size:SetScript('OnMouseDown', function(self) Config:StartSizing(); end);
Config.Size:SetScript('OnMouseUp', function(self) Config:StopMovingOrSizing(); end);

Config.Header = CreateFrame('Button', 'AuroraConfigHeader', Config);
Config.Header:SetWidth(140); Config.Header:SetHeight(24);
Config.Header:SetPoint('CENTER', Config, 'TOP');
Config.Header:SetFrameLevel(Config.Header:GetFrameLevel() + 2);
Config.Header:EnableMouse(true);
Config.Header:RegisterForClicks('AnyUp', 'AnyDown');
Config.Header:SetScript('OnMouseDown', function() Config:StartMoving(); end);
Config.Header:SetScript('OnMouseUp', function() Config:StopMovingOrSizing(); end);

Config.Header.Gradient = Config.Header:CreateTexture(nil, 'BORDER');
Config.Header.Gradient:SetPoint('TOPLEFT', 1, -1);
Config.Header.Gradient:SetPoint('BOTTOMRIGHT', -1, 1);
Config.Header.Gradient:SetTexture(C.Media.Backdrop);
Config.Header.Gradient:SetVertexColor(.2, .2, .2, 1);

Config.Header.Title = Config.Header:CreateFontString(nil, 'ARTWORK', 'GameFontNormalLarge');
Config.Header.Title:SetPoint('CENTER');
Config.Header.Title:SetText('|cffffffffAurora v'..GetAddOnMetadata('Aurora', 'Version')..'|r');

Config.Close = CreateFrame('Button', 'AuroraConfigClose', Config);
Config.Close:SetScript('OnClick', function() Config:Hide(); end);

Config.Scroll = CreateFrame('ScrollFrame', 'AuroraConfigScrollFrame', Config, 'UIPanelScrollFrameTemplate');
Config.Scroll:SetPoint('TOPLEFT', Config, 'TOPLEFT', 4, -24);
Config.Scroll:SetPoint('BOTTOMRIGHT', Config, 'BOTTOMRIGHT', -27, 60);

Config.ScrollChild = CreateFrame('Frame', 'AuroraConfigScrollFrameChild', Config.Scroll);
Config.ScrollChild:SetPoint('TOPLEFT');
Config.ScrollChild:SetPoint('BOTTOMRIGHT');
Config.ScrollChild:SetWidth(Config.Scroll:GetWidth());
Config.ScrollChild:SetHeight(Config.Scroll:GetHeight());

Config.Scroll:SetScrollChild(Config.ScrollChild);

Config.Alpha = CreateFrame('Slider', 'AuroraConfigAlpha', Config.ScrollChild, 'OptionsSliderTemplate');
Config.Alpha:SetPoint('TOP', 0, -15);
Config.Alpha:SetMinMaxValues(0, 1);
Config.Alpha:SetValueStep(0.01);
AuroraConfigAlphaText:SetText('Прозрачность');

Config.Alpha:SetScript('OnValueChanged', function(_, value)
	AuroraConfig.alpha = value
	value = value * 100;
	value = math.floor(value + .05);
	AuroraConfigAlphaText:SetText('Прозрачность: '..string.format('%d', value));
	UpdateFrames()
end)

Config.Font = CreateToggleBox(Config.ScrollChild, 'Font', 'Заменить шрифты игры по умолчанию');
Config.Font:SetPoint('TOPLEFT', 16, -76);

Config.Colour = CreateToggleBox(Config.ScrollChild, 'useCustomColour', 'Изменить цвет');
Config.Colour:SetPoint('TOPLEFT', Config.Font, 'BOTTOMLEFT', 0, -8);
Config.Colour:SetScript('OnClick', function(self)
	if self:GetChecked() then
		AuroraConfig.useCustomColour = true;
		Config.ColourButton:Enable();
	else
		AuroraConfig.useCustomColour = false;
		Config.ColourButton:Disable();
	end
end)

Config.ColourButton = CreateFrame('Button', 'AuroraConfigColourButton', Config.ScrollChild, 'UIPanelButtonTemplate');
Config.ColourButton:SetPoint('LEFT', Config.Colour, 'RIGHT', 128, 0);
Config.ColourButton:SetSize(128, 25);
Config.ColourButton:SetText('Изменить...');
Config.ColourButton:SetScript('OnClick', function()
	local r, g, b = AuroraConfig.customColour.r, AuroraConfig.customColour.g, AuroraConfig.customColour.b;
	ColorPickerFrame:SetColorRGB(r, g, b);
	ColorPickerFrame.previousValues = {r = r, g = g, b = b};
	ColorPickerFrame.func = SetColour;
	ColorPickerFrame.cancelFunc = ResetColour;
	ColorPickerFrame:Hide();
	ColorPickerFrame:Show();
end)

Config.Gradient = CreateToggleBox(Config.ScrollChild, 'useButtonGradientColour', 'Gradient button style');
Config.Gradient:SetPoint('TOPLEFT', Config.Colour, 'BOTTOMLEFT', 0, -8);

Config.Bags = CreateToggleBox(Config.ScrollChild, 'Bags', 'Сумки');
Config.Bags:SetPoint('TOPLEFT', Config.Gradient, 'BOTTOMLEFT', 0, -8);

Config.Tooltips = CreateToggleBox(Config.ScrollChild, 'Tooltips', 'Подсказки');
Config.Tooltips:SetPoint('LEFT', Config.Bags, 'RIGHT', 100, 0);

Config.ChatBubbles = CreateToggleBox(Config.ScrollChild, 'ChatBubbles', 'Сообщения в облачках');
Config.ChatBubbles:SetPoint('LEFT', Config.Tooltips, 'RIGHT', 100, 0);

Config.Maps = CreateToggleBox(Config.ScrollChild, 'Maps', 'Карта мира');
Config.Maps:SetPoint('TOPLEFT', Config.Bags, 'BOTTOMLEFT', 0, -8);

Config.Loot = CreateToggleBox(Config.ScrollChild, 'Loot', 'Добыча');
Config.Loot:SetPoint('LEFT', Config.Maps, 'RIGHT', 100, 0);

Config.ReloadText = Config:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight');
Config.ReloadText:SetPoint('BOTTOM', 0, 33)
Config.ReloadText:SetText([=[Требуется перезагрузить пользовательский 
интерфейс для применения настроек!]=])

Config.Reload = CreateFrame('Button', nil, Config, 'UIPanelButtonTemplate')
Config.Reload:SetSize(128, 25);
Config.Reload:SetPoint('BOTTOM', 0, 4);
Config.Reload:SetText('Перезагрузить!');
Config.Reload:SetScript('OnClick', ReloadUI);

Config.Refresh = function()
	Config.Alpha:SetValue(AuroraConfig.alpha);
	
	for i = 1, #CheckBoxes do
		CheckBoxes[i]:SetChecked(AuroraConfig[CheckBoxes[i].Value] == true);
	end
	
	if not Config.Colour:GetChecked() then
		Config.ColourButton:Disable();
	end
end

Config:RegisterEvent('ADDON_LOADED');
Config:SetScript('OnEvent', function(self, _, addon)
	if addon ~= 'Aurora' then return end
	
	CopyTable(AuroraConfig, Old);
	
	Config.Refresh();
	
	F.CreateBD(Config);
	
	F.CreateBD(Config.Header);
	F.StyleButton(Config.Header);
	
	F.ReskinClose(Config.Close, 'TOPRIGHT', Config, 'TOPRIGHT', -4, -4);
	
	F.ReskinScroll(AuroraConfigScrollFrameScrollBar);
	
	F.ReskinSlider(Config.Alpha);
	
	F.Reskin(Config.ColourButton);
	F.Reskin(Config.Reload);
	
	for i = 1, #CheckBoxes do
		F.ReskinCheck(CheckBoxes[i]);
	end
	
	self:UnregisterEvent('ADDON_LOADED');
end);

SlashCmdList.AURORA = function()
	Config:Show()
end
SLASH_AURORA1 = '/aurora';