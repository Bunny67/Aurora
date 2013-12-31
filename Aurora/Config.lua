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
	local Check = CreateFrame('CheckButton', nil, Parent, 'InterfaceOptionsCheckButtonTemplate');
	Check.Value = Value;
	
	local Font = Check:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	Font:SetPoint('LEFT', Check, 'RIGHT', 1, 1);
	Font:SetText(Text);
	
	Check:SetScript('OnClick', Toggle);
	
	tinsert(CheckBoxes, Check);
	
	return Check;
end

local function UpdateFrames()
	for i = 1, #C.frames do
		F.CreateBD(C.frames[i], AuroraConfig.alpha);
	end
end

local function SetColour()
	local r, g, b = ColorPickerFrame:GetColorRGB()
	AuroraConfig.customColour.r, AuroraConfig.customColour.g, AuroraConfig.customColour.b = r, g, b;
end

local function ResetColour(restore)
	AuroraConfig.customColour.r, AuroraConfig.customColour.g, AuroraConfig.customColour.b = restore.r, restore.g, restore.b;
end

local Config = CreateFrame('Frame', 'AuroraConfig', UIParent);
Config:SetSize(400, 496);
Config:SetPoint('CENTER');
Config:SetFrameStrata('HIGH');
Config:Hide();

Config.Title = Config:CreateFontString(nil, 'ARTWORK', 'GameFontNormalLarge');
Config.Title:SetPoint('TOP', 0, -12);
Config.Title:SetText('Aurora v'..GetAddOnMetadata('Aurora', 'Version'));

Config.Close = CreateFrame('Button', 'AuroraConfigClose', Config);
Config.Close:SetScript('OnClick', function() Config:Hide(); end);

Config.Alpha = CreateFrame('Slider', 'AuroraConfigAlpha', Config, 'OptionsSliderTemplate');
Config.Alpha:SetPoint('TOP', 0, -80);
Config.Alpha:SetMinMaxValues(0, 1);
Config.Alpha:SetValueStep(0.1);
AuroraConfigAlphaText:SetText('Прозрачность');

Config.Alpha:SetScript('OnValueChanged', function(_, value)
	AuroraConfig.alpha = value
	UpdateFrames()
end)

Config.Font = CreateToggleBox(Config, 'enableFont', 'Replace default game fonts');
Config.Font:SetPoint('TOPLEFT', 16, -140);

Config.Colour = CreateToggleBox(Config, 'useCustomColour', 'Изменить цвет');
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

Config.ColourButton = CreateFrame('Button', 'AuroraConfigColourButton', Config, 'UIPanelButtonTemplate');
Config.ColourButton:SetPoint('LEFT', Config.Colour, 'RIGHT', 128, 0);
Config.ColourButton:SetSize(128, 25);
Config.ColourButton:SetText('Change...');
Config.ColourButton:SetScript('OnClick', function()
	local r, g, b = AuroraConfig.customColour.r, AuroraConfig.customColour.g, AuroraConfig.customColour.b;
	ColorPickerFrame:SetColorRGB(r, g, b);
	ColorPickerFrame.previousValues = {r = r, g = g, b = b};
	ColorPickerFrame.func = SetColour;
	ColorPickerFrame.cancelFunc = ResetColour;
	ColorPickerFrame:Hide();
	ColorPickerFrame:Show();
end)

Config.Gradient = CreateToggleBox(Config, 'useButtonGradientColour', 'Gradient button style');
Config.Gradient:SetPoint('TOPLEFT', Config.Colour, 'BOTTOMLEFT', 0, -8);

Config.Bags = CreateToggleBox(Config, 'Bags', 'Сумки');
Config.Bags:SetPoint('TOPLEFT', Config.Gradient, 'BOTTOMLEFT', 0, -8);

Config.Tooltips = CreateToggleBox(Config, 'Tooltips', 'Подсказки');
Config.Tooltips:SetPoint('LEFT', Config.Bags, 'RIGHT', 90, 0);

Config.ChatBubbles = CreateToggleBox(Config, 'ChatBubbles', 'Сообщения в облачках');
Config.ChatBubbles:SetPoint('LEFT', Config.Tooltips, 'RIGHT', 90, 0);

Config.Maps = CreateToggleBox(Config, 'Maps', 'Карта мира');
Config.Maps:SetPoint('TOPLEFT', Config.Bags, 'BOTTOMLEFT', 0, -8);

Config.ReloadText = Config:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight');
Config.ReloadText:SetPoint('BOTTOM', 0, 70)
Config.ReloadText:SetText([=[Требуется перезагрузить пользовательский 
интерфейс для применения настроек!]=])

Config.Reload = CreateFrame('Button', nil, Config, 'UIPanelButtonTemplate')
Config.Reload:SetSize(128, 25);
Config.Reload:SetPoint('BOTTOM', 0, 30);
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
	
	F.ReskinClose(Config.Close, 'TOPRIGHT', Config, 'TOPRIGHT', -4, -4);
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