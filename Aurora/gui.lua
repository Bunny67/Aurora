local F, C = unpack(Aurora)

local old = {}
local checkboxes = {}

local function copyTable(source, target)
	for key, value in pairs(source) do
		if type(value) == "table" then
			target[key] = {}
			for k, v in pairs(value) do
				target[key][k] = value[k]
			end
		else
			target[key] = value
		end
	end
end

local function toggle(f)
	if f:GetChecked() then
		AuroraConfig[f.value] = true
	else
		AuroraConfig[f.value] = false
	end
end

local function createToggleBox(parent, name, value, text)
	local f = CreateFrame("CheckButton", name, parent, "InterfaceOptionsCheckButtonTemplate")
	f.value = value
	
	local label = f:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	label:SetPoint("LEFT", f, "RIGHT", 1, 1)
	label:SetText(text)
	
	f:SetScript("OnClick", toggle)
	
	tinsert(checkboxes, f)
	
	return f
end

local gui = CreateFrame("Frame", "AuroraOptions", UIParent)
gui.name = "Aurora"
InterfaceOptions_AddCategory(gui)

local title = gui:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOP", 0, -26)
title:SetText("Aurora v"..GetAddOnMetadata("Aurora", "Version"))

local credits = gui:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
credits:SetText("Aurora by "..GetAddOnMetadata("Aurora", "Author"))
credits:SetPoint("TOP", 0, -380)

local AlphaSlider = CreateFrame("Slider", "AuroraOptionsAlpha", gui, "OptionsSliderTemplate")
AlphaSlider:SetPoint("TOP", 0, -80)
BlizzardOptionsPanel_Slider_Enable(AlphaSlider)
AlphaSlider:SetMinMaxValues(0, 1)
AlphaSlider:SetValueStep(0.1)
AuroraOptionsAlphaText:SetText("Прозрачность")

local fontBox = createToggleBox(gui, "AuroraOptionsEnableFont", "enableFont", "Replace default game fonts")
fontBox:SetPoint("TOPLEFT", 16, -140)

local colourBox = createToggleBox(gui, "AuroraOptionsUseClassColours", "useCustomColour", "Изменить цвет")
colourBox:SetPoint("TOPLEFT", fontBox, "BOTTOMLEFT", 0, -8)

local useButtonGradientColourBox = createToggleBox(gui, "AuroraOptionsButtonGradient", "useButtonGradientColour", "Gradient button style")
useButtonGradientColourBox:SetPoint("TOPLEFT", colourBox, "BOTTOMLEFT", 0, -8)

local colourButton = CreateFrame("Button", "AuroraOptionsCustomColour", gui, "UIPanelButtonTemplate")
colourButton:SetPoint("LEFT", colourBox, "RIGHT", 128, 0)
colourButton:SetSize(128, 25)
colourButton:SetText("Change...")

local BagsBox = createToggleBox(gui, "AuroraOptionsBags", "Bags", "Сумки")
BagsBox:SetPoint("TOPLEFT", useButtonGradientColourBox, "BOTTOMLEFT", 0, -8)

local TooltipsBox = createToggleBox(gui, "AuroraOptionsTooltips", "Tooltips", "Подсказки")
TooltipsBox:SetPoint("LEFT", BagsBox, "RIGHT", 90, 0)

local ChatBubblesBox = createToggleBox(gui, "AuroraOptionsChatBubbles", "ChatBubbles", "Сообщения в облачках")
ChatBubblesBox:SetPoint("LEFT", TooltipsBox, "RIGHT", 90, 0)

local reloadText = gui:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
reloadText:SetPoint("TOPLEFT", BagsBox, "BOTTOMLEFT", 0, -60)
reloadText:SetText([=[Требуется перезагрузить пользовательский 
интерфейс для применения настроек!]=])

local reloadButton = CreateFrame("Button", "AuroraOptionsReloadUI", gui, "UIPanelButtonTemplate")
reloadButton:SetPoint("LEFT", reloadText, "RIGHT", 20, 0)
reloadButton:SetSize(128, 25)
reloadButton:SetText("Перезагрузить!")

gui.refresh = function()
	AlphaSlider:SetValue(AuroraConfig.alpha)
	
	for i = 1, #checkboxes do
		checkboxes[i]:SetChecked(AuroraConfig[checkboxes[i].value] == true)
	end
	
	if not colourBox:GetChecked() then
		colourButton:Disable()
	end
end

gui:RegisterEvent("ADDON_LOADED")
gui:SetScript("OnEvent", function(self, _, addon)
	if addon ~= "Aurora" then return end

	copyTable(AuroraConfig, old)
	
	gui.refresh()
	
	F.Reskin(reloadButton)
	F.Reskin(colourButton)
	F.ReskinSlider(AlphaSlider)
	
	for i = 1, #checkboxes do
		F.ReskinCheck(checkboxes[i])
	end
	
	self:UnregisterEvent("ADDON_LOADED")
end)

local function updateFrames()
	for i = 1, #C.frames do
		F.CreateBD(C.frames[i], AuroraConfig.alpha)
	end
end

gui.okay = function()
	copyTable(AuroraConfig, old)
end

gui.cancel = function()
	copyTable(old, AuroraConfig)
	
	updateFrames()
	gui.refresh()
end

gui.default = function()
	copyTable(C.defaults, AuroraConfig)
	
	updateFrames()
	gui.refresh()
end

reloadButton:SetScript("OnClick", ReloadUI)

AlphaSlider:SetScript("OnValueChanged", function(_, value)
	AuroraConfig.alpha = value
	updateFrames()
end)

colourBox:SetScript("OnClick", function(self)
	if self:GetChecked() then
		AuroraConfig.useCustomColour = true
		colourButton:Enable()
	else
		AuroraConfig.useCustomColour = false
		colourButton:Disable()
	end
end)

local function setColour()
	local r, g, b = ColorPickerFrame:GetColorRGB()
	AuroraConfig.customColour.r, AuroraConfig.customColour.g, AuroraConfig.customColour.b = r, g, b
end

local function resetColour(restore)
	AuroraConfig.customColour.r, AuroraConfig.customColour.g, AuroraConfig.customColour.b = restore.r, restore.g, restore.b
end

colourButton:SetScript("OnClick", function()
	local r, g, b = AuroraConfig.customColour.r, AuroraConfig.customColour.g, AuroraConfig.customColour.b
	ColorPickerFrame:SetColorRGB(r, g, b)
	ColorPickerFrame.previousValues = {r = r, g = g, b = b}
	ColorPickerFrame.func = setColour
	ColorPickerFrame.cancelFunc = resetColour
	ColorPickerFrame:Hide()
	ColorPickerFrame:Show()
end)

SlashCmdList.AURORA = function()
	InterfaceOptionsFrame_OpenToCategory(gui)
end
SLASH_AURORA1 = "/aurora"