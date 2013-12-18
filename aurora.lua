local alpha, useButtonGradientColour



local addon, core = ...

core[1] = {}
core[2] = {}

Aurora = core

AuroraConfig = {}

local F, C = unpack(select(2, ...))

C.classcolours = {
	['HUNTER'] = { r = 0.58, g = 0.86, b = 0.49 },
	['WARLOCK'] = { r = 0.6, g = 0.47, b = 0.85 },
	['PALADIN'] = { r = 1, g = 0.22, b = 0.52 },
	['PRIEST'] = { r = 0.8, g = 0.87, b = .9 },
	['MAGE'] = { r = 0, g = 0.76, b = 1 },
	['ROGUE'] = { r = 1, g = 0.91, b = 0.2 },
	['DRUID'] = { r = 1, g = 0.49, b = 0.04 },
	['SHAMAN'] = { r = 0, g = 0.6, b = 0.6 };
	['WARRIOR'] = { r = 0.9, g = 0.65, b = 0.45 },
	['DEATHKNIGHT'] = { r = 0.77, g = 0.12 , b = 0.23 },
}

C.media = {
	['arrowUp'] = 'Interface\\AddOns\\Aurora\\media\\arrow-up-active',
	['arrowDown'] = 'Interface\\AddOns\\Aurora\\media\\arrow-down-active',
	['arrowLeft'] = 'Interface\\AddOns\\Aurora\\media\\arrow-left-active',
	['arrowRight'] = 'Interface\\AddOns\\Aurora\\media\\arrow-right-active',
	['backdrop'] = 'Interface\\ChatFrame\\ChatFrameBackground',
	['checked'] = 'Interface\\AddOns\\Aurora\\media\\CheckButtonHilight',
	['font'] = 'Interface\\AddOns\\Aurora\\media\\font.ttf',
	['glow'] = 'Interface\\AddOns\\Aurora\\media\\glow',
	['roleIcons'] = 'Interface\\Addons\\Aurora\\media\\UI-LFG-ICON-ROLES',
}

C.defaults = {
	['alpha'] = 0.5,

	["buttonGradientColour"] = {.3, .3, .3, .3},
	["buttonSolidColour"] = {.2, .2, .2, 1},
	["useButtonGradientColour"] = false,
	["useCustomColour"] = false,
		["customColour"] = {r = 1, g = 1, b = 1},
		
	-- [[ AddOns ]]
	['AchievementUI'] = true,														-- Достижения
	['AuctionUI'] = true,															-- Аукцион
	['GlyphUI'] = true,																-- Символы
	['GuildBankUI'] = true,															-- Банк гильдии
	['ItemSocketingUI'] = true,														-- Инкрустирование
	['MacroUI'] = true,																-- Макросы
	['RaidUI'] = true,																-- Рейд
	['TalentUI'] = true,															-- Таланты
	['TimeManager'] = true,															-- Время
	['TradeSkillUI'] = true,														-- Профессии
	['TrainerUI'] = true,															-- Учитель
	
	['enableFont'] = true,
	
	['Bags'] = true,																-- Сумки
	['ChatBubbles'] = true, 														-- Сообщение в облачках
	['Tooltips'] = true,															-- Подсказки
}

C.frames = {}

-- [[ Functions ]]
_, F.Class = UnitClass('player')

if CUSTOM_CLASS_COLORS then
	C.classcolours = CUSTOM_CLASS_COLORS
end

local r, g, b = C.classcolours[F.Class].r, C.classcolours[F.Class].g, C.classcolours[F.Class].b

F.TexCoords = {.08, .92, .08, .92}
F.dummy = function() end

F.StyleButton = function(Button, NoHover, NoPushed, NoChecked)
	if Button.SetHighlightTexture and not Button.Hover and not NoHover then
		local Hover = Button:CreateTexture('frame', nil, self)
		Hover:SetTexture(1, 1, 1, 0.3)
		Hover:SetPoint('TOPLEFT', 1, -1)
		Hover:SetPoint('BOTTOMRIGHT', -1, 1)
		Button.Hover = Hover
		Button:SetHighlightTexture(Hover)
	end
	
	if Button.SetPushedTexture and not Button.Pushed and not NoPushed then
		local Pushed = Button:CreateTexture('frame', nil, self)
		Pushed:SetTexture(0.9, 0.8, 0.1, 0.3)
		Pushed:SetPoint('TOPLEFT', 1, -1)
		Pushed:SetPoint('BOTTOMRIGHT', -1, 1)
		Button.Pushed = Pushed
		Button:SetPushedTexture(Pushed)
	end
	
	if Button.SetCheckedTexture and not Button.Checked and not NoChecked then
		local Checked = Button:CreateTexture('frame', nil, self)
		Checked:SetTexture(r, g, b)
		Checked:SetPoint('TOPLEFT', 1, -1)
		Checked:SetPoint('BOTTOMRIGHT', -1, 1)
		Checked:SetAlpha(0.3)
		Button.Checked = Checked
		Button:SetCheckedTexture(Checked)
	end
	
	local Cooldown = Button:GetName() and _G[Button:GetName()..'Cooldown'] 
	if Cooldown then
		Cooldown:ClearAllPoints()
		Cooldown:SetPoint('TOPLEFT', -1, 1)
		Cooldown:SetPoint('BOTTOMRIGHT', -1, 1)
	end
end

F.CreateBD = function(f, a)
	f:SetBackdrop({
		bgFile = C.media.backdrop,
		edgeFile = C.media.backdrop,
		edgeSize = 1,
	})
	f:SetBackdropColor(0, 0, 0, a or alpha)
	f:SetBackdropBorderColor(0, 0, 0)
	if not a then tinsert(C.frames, f) end
end

F.CreateBG = function(frame)
	local f = frame
	if frame:GetObjectType() == "Texture" then f = frame:GetParent() end

	local bg = f:CreateTexture(nil, "BACKGROUND")
	bg:SetPoint("TOPLEFT", frame, -1, 1)
	bg:SetPoint("BOTTOMRIGHT", frame, 1, -1)
	bg:SetTexture(C.media.backdrop)
	bg:SetVertexColor(0, 0, 0)

	return bg
end

-- we assign these after loading variables for caching
-- otherwise we call an extra unpack() every time
local buttonR, buttonG, buttonB, buttonA

F.CreateGradient = function(f)
	local tex = f:CreateTexture(nil, "BORDER")
	tex:SetPoint("TOPLEFT", 1, -1)
	tex:SetPoint("BOTTOMRIGHT", -1, 1)
	tex:SetTexture(useButtonGradientColour and C.media.gradient or C.media.backdrop)
	tex:SetVertexColor(buttonR, buttonG, buttonB, buttonA)

	return tex
end

local function colourButton(f)
	if not f:IsEnabled() then return end

	if useButtonGradientColour then
		f:SetBackdropColor(r, g, b, .3)
	else
		f.tex:SetVertexColor(r / 4, g / 4, b / 4)
	end

	f:SetBackdropBorderColor(r, g, b)
end

local function clearButton(f)
	if useButtonGradientColour then
		f:SetBackdropColor(0, 0, 0, 0)
	else
		f.tex:SetVertexColor(buttonR, buttonG, buttonB, buttonA)
	end

	f:SetBackdropBorderColor(0, 0, 0)
end

F.Reskin = function(f, noHighlight, strip)
	f:SetNormalTexture("")
	f:SetHighlightTexture("")
	f:SetPushedTexture("")
	f:SetDisabledTexture("")

	if f.Left then f.Left:SetAlpha(0) end
	if f.Middle then f.Middle:SetAlpha(0) end
	if f.Right then f.Right:SetAlpha(0) end
	if f.LeftSeparator then f.LeftSeparator:Hide() end
	if f.RightSeparator then f.RightSeparator:Hide() end
	
	if strip then F.StripTextures(f, true) end
	
	F.CreateBD(f, .0)

	f.tex = F.CreateGradient(f)

	if not noHighlight then
		f:HookScript("OnEnter", colourButton)
 		f:HookScript("OnLeave", clearButton)
	end
end

F.ReskinTab = function(f)
	f:DisableDrawLayer("BACKGROUND")

	local bg = CreateFrame("Frame", nil, f)
	bg:SetPoint("TOPLEFT", 8, -3)
	bg:SetPoint("BOTTOMRIGHT", -8, 0)
	bg:SetFrameLevel(f:GetFrameLevel()-1)
	F.CreateBD(bg)

	f:SetHighlightTexture(C.media.backdrop)
	local hl = f:GetHighlightTexture()
	hl:SetPoint("TOPLEFT", 9, -4)
	hl:SetPoint("BOTTOMRIGHT", -9, 1)
	hl:SetVertexColor(r, g, b, .25)
end

local function colourScroll(f)
	if f:IsEnabled() then
		f.tex:SetVertexColor(r, g, b)
	end
end

local function clearScroll(f)
	f.tex:SetVertexColor(1, 1, 1)
end

F.ReskinScroll = function(f)
	local frame = f:GetName()

	if _G[frame.."Track"] then _G[frame.."Track"]:Hide() end
	if _G[frame.."BG"] then _G[frame.."BG"]:Hide() end
	if _G[frame.."Top"] then _G[frame.."Top"]:Hide() end
	if _G[frame.."Middle"] then _G[frame.."Middle"]:Hide() end
	if _G[frame.."Bottom"] then _G[frame.."Bottom"]:Hide() end

	local bu = _G[frame.."ThumbTexture"]
	bu:SetAlpha(0)
	bu:SetWidth(17)

	bu.bg = CreateFrame("Frame", nil, f)
	bu.bg:SetPoint("TOPLEFT", bu, 0, -2)
	bu.bg:SetPoint("BOTTOMRIGHT", bu, 0, 4)
	F.CreateBD(bu.bg, 0)

	local tex = F.CreateGradient(f)
	tex:SetPoint("TOPLEFT", bu.bg, 1, -1)
	tex:SetPoint("BOTTOMRIGHT", bu.bg, -1, 1)

	local up = _G[frame.."ScrollUpButton"]
	local down = _G[frame.."ScrollDownButton"]

	up:SetWidth(17)
	down:SetWidth(17)

	F.Reskin(up, true)
	F.Reskin(down, true)

	up:SetDisabledTexture(C.media.backdrop)
	local dis1 = up:GetDisabledTexture()
	dis1:SetVertexColor(0, 0, 0, .4)
	dis1:SetDrawLayer("OVERLAY")

	down:SetDisabledTexture(C.media.backdrop)
	local dis2 = down:GetDisabledTexture()
	dis2:SetVertexColor(0, 0, 0, .4)
	dis2:SetDrawLayer("OVERLAY")

	local uptex = up:CreateTexture(nil, "ARTWORK")
	uptex:SetTexture(C.media.arrowUp)
	uptex:SetSize(8, 8)
	uptex:SetPoint("CENTER")
	uptex:SetVertexColor(1, 1, 1)
	up.tex = uptex

	local downtex = down:CreateTexture(nil, "ARTWORK")
	downtex:SetTexture(C.media.arrowDown)
	downtex:SetSize(8, 8)
	downtex:SetPoint("CENTER")
	downtex:SetVertexColor(1, 1, 1)
	down.tex = downtex

	up:HookScript("OnEnter", colourScroll)
	up:HookScript("OnLeave", clearScroll)
	down:HookScript("OnEnter", colourScroll)
	down:HookScript("OnLeave", clearScroll)
end

local function colourArrow(f)
	if f:IsEnabled() then
		f.tex:SetVertexColor(r, g, b)
	end
end

local function clearArrow(f)
	f.tex:SetVertexColor(1, 1, 1)
end

F.colourArrow = colourArrow
F.clearArrow = clearArrow

F.ReskinDropDown = function(f)
	local frame = f:GetName()

	local left = _G[frame.."Left"]
	local middle = _G[frame.."Middle"]
	local right = _G[frame.."Right"]

	if left then left:SetAlpha(0) end
	if middle then middle:SetAlpha(0) end
	if right then right:SetAlpha(0) end

	local down = _G[frame.."Button"]

	down:SetSize(20, 20)
	down:ClearAllPoints()
	down:SetPoint("RIGHT", -18, 2)

	F.Reskin(down, true)

	down:SetDisabledTexture(C.media.backdrop)
	local dis = down:GetDisabledTexture()
	dis:SetVertexColor(0, 0, 0, .4)
	dis:SetDrawLayer("OVERLAY")
	dis:SetAllPoints()

	local tex = down:CreateTexture(nil, "ARTWORK")
	tex:SetTexture(C.media.arrowDown)
	tex:SetSize(8, 8)
	tex:SetPoint("CENTER")
	tex:SetVertexColor(1, 1, 1)
	down.tex = tex

	down:HookScript("OnEnter", colourArrow)
	down:HookScript("OnLeave", clearArrow)

	local bg = CreateFrame("Frame", nil, f)
	bg:SetPoint("TOPLEFT", 16, -4)
	bg:SetPoint("BOTTOMRIGHT", -18, 8)
	bg:SetFrameLevel(f:GetFrameLevel()-1)
	F.CreateBD(bg, 0)

	local gradient = F.CreateGradient(f)
	gradient:SetPoint("TOPLEFT", bg, 1, -1)
	gradient:SetPoint("BOTTOMRIGHT", bg, -1, 1)
end

local function colourClose(f)
	if f:IsEnabled() then
		for _, pixel in pairs(f.pixels) do
			pixel:SetVertexColor(r, g, b)
		end
	end
end

local function clearClose(f)
	for _, pixel in pairs(f.pixels) do
		pixel:SetVertexColor(1, 1, 1)
	end
end

F.ReskinClose = function(f, a1, p, a2, x, y)
	f:SetSize(17, 17)

	if not a1 then
		f:SetPoint("TOPRIGHT", -6, -6)
	else
		f:ClearAllPoints()
		f:SetPoint(a1, p, a2, x, y)
	end

	f:SetNormalTexture("")
	f:SetHighlightTexture("")
	f:SetPushedTexture("")
	f:SetDisabledTexture("")

	F.CreateBD(f, 0)

	F.CreateGradient(f)

	f:SetDisabledTexture(C.media.backdrop)
	local dis = f:GetDisabledTexture()
	dis:SetVertexColor(0, 0, 0, .4)
	dis:SetDrawLayer("OVERLAY")
	dis:SetAllPoints()

	f.pixels = {}

	for i = 1, 9 do
		local tex = f:CreateTexture()
		tex:SetTexture(1, 1, 1)
		tex:SetSize(1, 1)
		tex:SetPoint("BOTTOMLEFT", 3+i, 3+i)
		tinsert(f.pixels, tex)
	end

	for i = 1, 9 do
		local tex = f:CreateTexture()
		tex:SetTexture(1, 1, 1)
		tex:SetSize(1, 1)
		tex:SetPoint("TOPLEFT", 3+i, -3-i)
		tinsert(f.pixels, tex)
	end

	f:HookScript("OnEnter", colourClose)
 	f:HookScript("OnLeave", clearClose)
end

F.ReskinInput = function(f, height, width)
	local frame = f:GetName()

	if _G[frame.."Left"] then _G[frame.."Left"]:Hide() end
	if _G[frame.."Middle"] then _G[frame.."Middle"]:Hide() end
	if _G[frame.."Mid"] then _G[frame.."Mid"]:Hide() end
	if _G[frame.."Right"] then _G[frame.."Right"]:Hide() end
	
	local bd = CreateFrame("Frame", nil, f)
	bd:SetPoint("TOPLEFT", -2, 0)
	bd:SetPoint("BOTTOMRIGHT")
	bd:SetFrameLevel(f:GetFrameLevel()-1)
	F.CreateBD(bd, 0)

	local gradient = F.CreateGradient(f)
	gradient:SetPoint("TOPLEFT", bd, 1, -1)
	gradient:SetPoint("BOTTOMRIGHT", bd, -1, 1)

	if height then f:SetHeight(height) end
	if width then f:SetWidth(width) end
end

F.ReskinArrow = function(f, direction)
	f:SetSize(18, 18)
	F.Reskin(f, true)

	f:SetDisabledTexture(C.media.backdrop)
	local dis = f:GetDisabledTexture()
	dis:SetVertexColor(0, 0, 0, .3)
	dis:SetDrawLayer("OVERLAY")

	local tex = f:CreateTexture(nil, "ARTWORK")
	tex:SetTexture("Interface\\AddOns\\Aurora\\media\\arrow-"..direction.."-active")
	tex:SetSize(8, 8)
	tex:SetPoint("CENTER")
	f.tex = tex

	f:HookScript("OnEnter", colourArrow)
	f:HookScript("OnLeave", clearArrow)
end

F.ReskinCheck = function(f)
	f:SetNormalTexture("")
	f:SetPushedTexture("")
	f:SetHighlightTexture(C.media.backdrop)
	local hl = f:GetHighlightTexture()
	hl:SetPoint("TOPLEFT", 5, -5)
	hl:SetPoint("BOTTOMRIGHT", -5, 5)
	hl:SetVertexColor(r, g, b, .2)

	local bd = CreateFrame("Frame", nil, f)
	bd:SetPoint("TOPLEFT", 4, -4)
	bd:SetPoint("BOTTOMRIGHT", -4, 4)
	bd:SetFrameLevel(f:GetFrameLevel()-1)
	F.CreateBD(bd, 0)

	local tex = F.CreateGradient(f)
	tex:SetPoint("TOPLEFT", 5, -5)
	tex:SetPoint("BOTTOMRIGHT", -5, 5)

	local ch = f:GetCheckedTexture()
	ch:SetDesaturated(true)
	ch:SetVertexColor(r, g, b)
end

local function colourRadio(f)
	f.bd:SetBackdropBorderColor(r, g, b)
end

local function clearRadio(f)
	f.bd:SetBackdropBorderColor(0, 0, 0)
end

F.ReskinRadio = function(f)
	f:SetNormalTexture("")
	f:SetHighlightTexture("")
	f:SetCheckedTexture(C.media.backdrop)

	local ch = f:GetCheckedTexture()
	ch:SetPoint("TOPLEFT", 4, -4)
	ch:SetPoint("BOTTOMRIGHT", -4, 4)
	ch:SetVertexColor(r, g, b, .6)

	local bd = CreateFrame("Frame", nil, f)
	bd:SetPoint("TOPLEFT", 3, -3)
	bd:SetPoint("BOTTOMRIGHT", -3, 3)
	bd:SetFrameLevel(f:GetFrameLevel()-1)
	F.CreateBD(bd, 0)
	f.bd = bd

	local tex = F.CreateGradient(f)
	tex:SetPoint("TOPLEFT", 4, -4)
	tex:SetPoint("BOTTOMRIGHT", -4, 4)

	f:HookScript("OnEnter", colourRadio)
	f:HookScript("OnLeave", clearRadio)
end

F.ReskinSlider = function(f)
	f:SetBackdrop(nil)
	f.SetBackdrop = F.dummy

	local bd = CreateFrame("Frame", nil, f)
	bd:SetPoint("TOPLEFT", 14, -2)
	bd:SetPoint("BOTTOMRIGHT", -15, 3)
	bd:SetFrameStrata("BACKGROUND")
	bd:SetFrameLevel(f:GetFrameLevel()-1)
	F.CreateBD(bd, 0)

	F.CreateGradient(bd)

	local slider = select(4, f:GetRegions())
	slider:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
	slider:SetBlendMode("ADD")
end

local function colourExpandOrCollapse(f)
	if f:IsEnabled() then
		f.plus:SetVertexColor(r, g, b)
		f.minus:SetVertexColor(r, g, b)
	end
end

local function clearExpandOrCollapse(f)
	f.plus:SetVertexColor(1, 1, 1)
	f.minus:SetVertexColor(1, 1, 1)
end

F.colourExpandOrCollapse = colourExpandOrCollapse
F.clearExpandOrCollapse = clearExpandOrCollapse

F.ReskinExpandOrCollapse = function(f)
	f:SetSize(13, 13)

	F.Reskin(f, true)
	f.SetNormalTexture = F.dummy

	f.minus = f:CreateTexture(nil, "OVERLAY")
	f.minus:SetSize(7, 1)
	f.minus:SetPoint("CENTER")
	f.minus:SetTexture(C.media.backdrop)
	f.minus:SetVertexColor(1, 1, 1)

	f.plus = f:CreateTexture(nil, "OVERLAY")
	f.plus:SetSize(1, 7)
	f.plus:SetPoint("CENTER")
	f.plus:SetTexture(C.media.backdrop)
	f.plus:SetVertexColor(1, 1, 1)

	f:HookScript("OnEnter", colourExpandOrCollapse)
	f:HookScript("OnLeave", clearExpandOrCollapse)
end

F.SetBD = function(f, x, y, x2, y2)
	local bg = CreateFrame("Frame", nil, f)
	if not x then
		bg:SetPoint("TOPLEFT")
		bg:SetPoint("BOTTOMRIGHT")
	else
		bg:SetPoint("TOPLEFT", x, y)
		bg:SetPoint("BOTTOMRIGHT", x2, y2)
	end
	bg:SetFrameLevel(0)
	F.CreateBD(bg)
end

F.ReskinPortraitFrame = function(f, isButtonFrame)
	local name = f:GetName()

	_G[name.."Bg"]:Hide()
	_G[name.."TitleBg"]:Hide()
	_G[name.."Portrait"]:Hide()
	_G[name.."PortraitFrame"]:Hide()
	_G[name.."TopRightCorner"]:Hide()
	_G[name.."TopLeftCorner"]:Hide()
	_G[name.."TopBorder"]:Hide()
	_G[name.."TopTileStreaks"]:SetTexture("")
	_G[name.."BotLeftCorner"]:Hide()
	_G[name.."BotRightCorner"]:Hide()
	_G[name.."BottomBorder"]:Hide()
	_G[name.."LeftBorder"]:Hide()
	_G[name.."RightBorder"]:Hide()

	if isButtonFrame then
		_G[name.."BtnCornerLeft"]:SetTexture("")
		_G[name.."BtnCornerRight"]:SetTexture("")
		_G[name.."ButtonBottomBorder"]:SetTexture("")

		f.Inset.Bg:Hide()
		f.Inset:DisableDrawLayer("BORDER")
	end

	F.CreateBD(f)
	F.ReskinClose(_G[name.."CloseButton"])
end

F.CreateBDFrame = function(f, a)
	local frame
	if f:GetObjectType() == "Texture" then
		frame = f:GetParent()
	else
		frame = f
	end

	local lvl = frame:GetFrameLevel()

	local bg = CreateFrame("Frame", nil, frame)
	bg:SetPoint("TOPLEFT", f, -1, 1)
	bg:SetPoint("BOTTOMRIGHT", f, 1, -1)
	bg:SetFrameLevel(lvl == 0 and 1 or lvl - 1)

	F.CreateBD(bg, a or .5)

	return bg
end

F.ReskinColourSwatch = function(f)
	local name = f:GetName()

	local bg = _G[name.."SwatchBg"]

	f:SetNormalTexture(C.media.backdrop)
	local nt = f:GetNormalTexture()

	nt:SetPoint("TOPLEFT", 3, -3)
	nt:SetPoint("BOTTOMRIGHT", -3, 3)

	bg:SetTexture(0, 0, 0)
	bg:SetPoint("TOPLEFT", 2, -2)
	bg:SetPoint("BOTTOMRIGHT", -2, 2)
end

F.ColourQuality = function(button, id)
	local quality, texture, _
	local quest = _G[button:GetName().."IconQuestTexture"]

	if id then
		quality, _, _, _, _, _, _, texture = select(3, GetItemInfo(id))
	end

	local glow = button.AuroraGlow
	if not glow then
		glow = button:CreateTexture(nil, "BACKGROUND")
		glow:SetPoint("TOPLEFT", -1, 1)
		glow:SetPoint("BOTTOMRIGHT", 1, -1)
		glow:SetTexture(C.media.backdrop)

		button.AuroraGlow = glow
	end

	if texture then
		local r, g, b

		if quest and quest:IsShown() then
			r, g, b = 1, 0, 0
		else
			r, g, b = GetItemQualityColor(quality)
			if r == 1 and g == 1 then r, g, b = 0, 0, 0 end
		end

		glow:SetVertexColor(r, g, b)
		glow:Show()
	else
		glow:Hide()
	end
end

F.Kill = function(object)
	if object.UnregisterAllEvents then
		object:UnregisterAllEvents()
	else
		object.Show = object.Hide
	end
	
	object:Hide()
end

F.StripTextures = function(object, kill)
	for i=1, object:GetNumRegions() do
		local region = select(i, object:GetRegions())
		if region and region:GetObjectType() == 'Texture' then
			if kill and type(kill) == 'boolean' then
				F.Kill(region)
			elseif region:GetDrawLayer() == kill then
				region:SetTexture(nil)
			elseif kill and type(kill) == 'string' and region:GetTexture() ~= kill then
				region:SetTexture(nil)
			else
				region:SetTexture(nil)
			end
		end
	end
end

-- [[ Module handling ]]

C.modules = {}
C.modules['Aurora'] = {}

local Skin = CreateFrame('Frame', nil, UIParent)
Skin:RegisterEvent('ADDON_LOADED')
Skin:SetScript('OnEvent', function(self, event, addon)
	if addon == "Aurora" then
		-- [[ Load Variables ]]

		-- remove deprecated or corrupt variables
		for key, value in pairs(AuroraConfig) do
			if C.defaults[key] == nil then
				AuroraConfig[key] = nil
			end
		end

		-- load or init variables
		for key, value in pairs(C.defaults) do
			if AuroraConfig[key] == nil then
				if type(value) == "table" then
					AuroraConfig[key] = {}
					for k, v in pairs(value) do
						AuroraConfig[key][k] = value[k]
					end
				else
					AuroraConfig[key] = value
				end
			end
		end

		alpha = AuroraConfig.alpha
		useButtonGradientColour = AuroraConfig.useButtonGradientColour

		if useButtonGradientColour then
			buttonR, buttonG, buttonB, buttonA = unpack(AuroraConfig.buttonGradientColour)
		else
			buttonR, buttonG, buttonB, buttonA = unpack(AuroraConfig.buttonSolidColour)
		end

		if AuroraConfig.useCustomColour then
			r, g, b = AuroraConfig.customColour.r, AuroraConfig.customColour.g, AuroraConfig.customColour.b
		end
		-- for modules
		C.r, C.g, C.b = r, g, b
	end

	for module, moduleFunc in pairs(C.modules) do
		if type(moduleFunc) == "function" then
			if module == addon then
				moduleFunc()
			end
		elseif type(moduleFunc) == "table" then
			if module == addon then
				for _, moduleFunc in pairs(C.modules[module]) do
					moduleFunc()
				end
			end
		end
	end

	if addon == 'Aurora' then
	
	
	local AllTabardFrameStripTextures = {'TabardFrame'}
	for i = 1, #AllTabardFrameStripTextures do
		F.StripTextures(_G[AllTabardFrameStripTextures[i]])
	end
	F.Kill(TabardFramePortrait)
	
	local AllTabardFrameButtons = {'TabardFrameAcceptButton', 'TabardFrameCancelButton'}
	for i = 1, #AllTabardFrameButtons do
		F.Reskin(_G[AllTabardFrameButtons[i]])
	end
			
	F.SetBD(TabardFrame, 10, -12, -34, 74)
	F.ReskinClose(TabardFrameCloseButton, "TOPRIGHT", TabardFrame, "TOPRIGHT", -38, -16)
	
	for i = 1, 5 do
		F.ReskinArrow(_G["TabardFrameCustomization"..i.."LeftButton"], "left")
		F.ReskinArrow(_G["TabardFrameCustomization"..i.."RightButton"], "right")
	end
	
	
	
	C.modules['Blizzard_GuildBankUI'] = function()
		if AuroraConfig.GuildBankUI then
		-- [[ Чистка текстур ]]
			F.StripTextures(GuildBankFrame)
			local AllGuildBankUIStripTextures = {'GuildBankEmblemFrame', 'GuildBankInfoScrollFrame', 'GuildBankTransactionsScrollFrame', 'GuildBankPopupFrame', 'GuildBankPopupScrollFrame'}
			for i = 1, #AllGuildBankUIStripTextures do
				F.StripTextures(_G[AllGuildBankUIStripTextures[i]], true)
			end
		-- [[ Полоса прокрутки ]]
			local AllGuildBankUIScrollbars = {'GuildBankTransactionsScrollFrameScrollBar', 'GuildBankInfoScrollFrameScrollBar'}
			for i = 1, #AllGuildBankUIScrollbars do
				F.ReskinScroll(_G[AllGuildBankUIScrollbars[i]])
			end
		-- [[ Вкладки ]]
			for i = 1, 4 do
				F.ReskinTab(_G['GuildBankFrameTab'..i])
			end
		-- [[ Кнопки ]]
			local AllGuildBankUIButtons = {'GuildBankFrameDepositButton', 'GuildBankFrameWithdrawButton', 'GuildBankInfoSaveButton', 'GuildBankFramePurchaseButton', 'GuildBankPopupOkayButton', 'GuildBankPopupCancelButton'}
			for i = 1, #AllGuildBankUIButtons do
				F.Reskin(_G[AllGuildBankUIButtons[i]])
			end
			
			
			F.SetBD(GuildBankFrame, 12, -11, 0, 6)
			for i=1, GuildBankFrame:GetNumChildren() do
				local child = select(i, GuildBankFrame:GetChildren())
				if child.GetPushedTexture and child:GetPushedTexture() and not child:GetName() then
					F.ReskinClose(child, 'TOPRIGHT', GuildBankFrame, 'TOPRIGHT', -4, -15)
				end
			end
		end
	end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	-- [[ Чистка текстур ]]
		local AllLFGFrameStripTextures = {'LFDParentFrame', 'LFDParentFramePortrait', 'LFDQueueFrame'}
		for i = 1, #AllLFGFrameStripTextures do
			F.StripTextures(_G[AllLFGFrameStripTextures[i]], true)
		end
	-- [[ Выпадающая кнопка ]]
		local AllLFGFrameDropDowns = {'LFDQueueFrameTypeDropDown'}
		for i = 1, #AllLFGFrameDropDowns do
			F.ReskinDropDown(_G[AllLFGFrameDropDowns[i]])
		end
	-- [[ Флажки ]]
		local AllLFGFrameCheckBoxes = {'LFDQueueFrameRoleButtonTank', 'LFDQueueFrameRoleButtonHealer', 'LFDQueueFrameRoleButtonDPS', 'LFDQueueFrameRoleButtonLeader'}
		for _, object in pairs(AllLFGFrameCheckBoxes) do
			_G[object].checkButton:SetFrameLevel(_G[object].checkButton:GetFrameLevel() + 2)
			F.ReskinCheck(_G[object].checkButton)
		end
	-- [[ Кнопки ]]
		local AllLFGFrameButtons = {'LFDQueueFrameFindGroupButton', 'LFDQueueFrameCancelButton', 'LFDQueueFramePartyBackfillBackfillButton', 'LFDQueueFramePartyBackfillNoBackfillButton'}
		for i = 1, #AllLFGFrameButtons do
			F.Reskin(_G[AllLFGFrameButtons[i]])
		end
		
		F.SetBD(LFDParentFrame, 10, -12, -2, 0)

	
	-- [[ Чистка текстур ]]
		local AllUIStripTextures = {'GameMenuFrame', 'VideoOptionsFrame', 'VideoOptionsFrameCategoryFrame', 'VideoOptionsEffectsPanelQuality', 'VideoOptionsEffectsPanelShaders', 'VideoOptionsFramePanelContainer', 'VideoOptionsResolutionPanelBrightness', 'AudioOptionsFrame', 'AudioOptionsFrameCategoryFrame', 'AudioOptionsSoundPanelPlayback', 'AudioOptionsSoundPanelHardware', 'AudioOptionsSoundPanelVolume', 'AudioOptionsFramePanelContainer', 'InterfaceOptionsFrame', 'InterfaceOptionsFrameCategories', 'InterfaceOptionsFramePanelContainer', 'InterfaceOptionsFrameAddOns'}
		for i = 1, #AllUIStripTextures do
			F.StripTextures(_G[AllUIStripTextures[i]], true)
		end
	-- [[ Выпадающая кнопка ]]
		local AllUIDropDowns = {'VideoOptionsResolutionPanelResolutionDropDown', 'VideoOptionsResolutionPanelMultiSampleDropDown', 'VideoOptionsResolutionPanelRefreshDropDown', 'AudioOptionsSoundPanelHardwareDropDown', 'InterfaceOptionsControlsPanelAutoLootKeyDropDown', 'InterfaceOptionsCombatPanelTOTDropDown', 'InterfaceOptionsCombatPanelSelfCastKeyDropDown', 'InterfaceOptionsCombatPanelFocusCastKeyDropDown', 'InterfaceOptionsDisplayPanelWorldPVPObjectiveDisplay', 'InterfaceOptionsDisplayPanelAggroWarningDisplay', 'InterfaceOptionsSocialPanelChatStyle', 'InterfaceOptionsSocialPanelTimestamps', 'InterfaceOptionsCombatTextPanelFCTDropDown', 'InterfaceOptionsCameraPanelStyleDropDown', 'InterfaceOptionsMousePanelClickMoveStyleDropDown'}
		for i = 1, #AllUIDropDowns do
			F.ReskinDropDown(_G[AllUIDropDowns[i]])
		end
	-- [[ Ползунок]]
		local AllUISlider = {'VideoOptionsResolutionPanelUIScaleSlider', 'VideoOptionsEffectsPanelQualitySlider', 'VideoOptionsEffectsPanelViewDistance', 'VideoOptionsEffectsPanelEnvironmentDetail', 'VideoOptionsEffectsPanelTextureResolution', 'VideoOptionsEffectsPanelTerrainDetail', 'VideoOptionsEffectsPanelClutterDensity', 'VideoOptionsEffectsPanelTextureFiltering', 'VideoOptionsEffectsPanelParticleDensity', 'VideoOptionsEffectsPanelShadowQuality', 'VideoOptionsEffectsPanelClutterRadius', 'VideoOptionsEffectsPanelWeatherIntensity', 'VideoOptionsEffectsPanelPlayerTexture', 'VideoOptionsResolutionPanelGammaSlider', 'AudioOptionsSoundPanelSoundQuality', 'AudioOptionsSoundPanelSoundChannels', 'AudioOptionsSoundPanelMasterVolume', 'AudioOptionsSoundPanelSoundVolume', 'AudioOptionsSoundPanelMusicVolume', 'AudioOptionsSoundPanelAmbienceVolume', 'InterfaceOptionsCameraPanelMaxDistanceSlider', 'InterfaceOptionsCameraPanelFollowSpeedSlider', 'InterfaceOptionsMousePanelMouseLookSpeedSlider','InterfaceOptionsMousePanelMouseSensitivitySlider'}
		for i = 1, #AllUISlider do
			F.ReskinSlider(_G[AllUISlider[i]])
		end
	-- [[ Флажки ]]
		local AllUICheckBoxes = {'VideoOptionsResolutionPanelVSync', 'VideoOptionsResolutionPanelTripleBuffer', 'VideoOptionsResolutionPanelHardwareCursor', 'VideoOptionsResolutionPanelFixInputLag', 'VideoOptionsResolutionPanelUseUIScale', 'VideoOptionsResolutionPanelWindowed', 'VideoOptionsResolutionPanelMaximized', 'VideoOptionsResolutionPanelDisableResize', 'VideoOptionsResolutionPanelDesktopGamma', 'VideoOptionsEffectsPanelSpecularLighting', 'VideoOptionsEffectsPanelFullScreenGlow', 'VideoOptionsEffectsPanelDeathEffect', 'VideoOptionsEffectsPanelProjectedTextures', 'AudioOptionsSoundPanelEnableSound', 'AudioOptionsSoundPanelSoundEffects', 'AudioOptionsSoundPanelErrorSpeech', 'AudioOptionsSoundPanelEmoteSounds', 'AudioOptionsSoundPanelPetSounds', 'AudioOptionsSoundPanelMusic', 'AudioOptionsSoundPanelLoopMusic', 'AudioOptionsSoundPanelAmbientSounds', 'AudioOptionsSoundPanelSoundInBG', 'AudioOptionsSoundPanelReverb', 'AudioOptionsSoundPanelHRTF', 'AudioOptionsSoundPanelEnableDSPs', 'AudioOptionsSoundPanelUseHardware', 'InterfaceOptionsControlsPanelStickyTargeting', 'InterfaceOptionsControlsPanelAutoDismount', 'InterfaceOptionsControlsPanelAutoClearAFK', 'InterfaceOptionsControlsPanelBlockTrades', 'InterfaceOptionsControlsPanelLootAtMouse', 'InterfaceOptionsControlsPanelAutoLootCorpse', 'InterfaceOptionsCombatPanelAttackOnAssist', 'InterfaceOptionsCombatPanelAutoRange', 'InterfaceOptionsCombatPanelStopAutoAttack', 'InterfaceOptionsCombatPanelNameplateClassColors', 'InterfaceOptionsCombatPanelAutoSelfCast', 'InterfaceOptionsCombatPanelTargetOfTarget', 'InterfaceOptionsCombatPanelEnemyCastBarsOnPortrait', 'InterfaceOptionsCombatPanelEnemyCastBarsOnNameplates', 'InterfaceOptionsDisplayPanelShowCloak', 'InterfaceOptionsDisplayPanelShowHelm', 'InterfaceOptionsDisplayPanelShowAggroPercentage', 'InterfaceOptionsDisplayPanelPlayAggroSounds', 'InterfaceOptionsDisplayPanelDetailedLootInfo', 'InterfaceOptionsDisplayPanelShowFreeBagSpace', 'InterfaceOptionsDisplayPanelCinematicSubtitles', 'InterfaceOptionsDisplayPanelRotateMinimap', 'InterfaceOptionsDisplayPanelScreenEdgeFlash', 'InterfaceOptionsDisplayPanelShowClock', 'InterfaceOptionsDisplayPanelColorblindMode', 'InterfaceOptionsDisplayPanelShowItemLevel', 'InterfaceOptionsObjectivesPanelInstantQuestText', 'InterfaceOptionsObjectivesPanelAutoQuestTracking', 'InterfaceOptionsObjectivesPanelAutoQuestProgress', 'InterfaceOptionsObjectivesPanelMapQuestDifficulty', 'InterfaceOptionsObjectivesPanelAdvancedWorldMap', 'InterfaceOptionsObjectivesPanelWatchFrameWidth', 'InterfaceOptionsSocialPanelProfanityFilter', 'InterfaceOptionsSocialPanelSpamFilter', 'InterfaceOptionsSocialPanelChatBubbles', 'InterfaceOptionsSocialPanelPartyChat', 'InterfaceOptionsSocialPanelChatHoverDelay', 'InterfaceOptionsSocialPanelGuildMemberAlert', 'InterfaceOptionsSocialPanelGuildRecruitment', 'InterfaceOptionsSocialPanelChatMouseScroll', 'InterfaceOptionsSocialPanelWholeChatWindowClickable', 'InterfaceOptionsActionBarsPanelLockActionBars', 'InterfaceOptionsActionBarsPanelSecureAbilityToggle', 'InterfaceOptionsActionBarsPanelAlwaysShowActionBars', 'InterfaceOptionsActionBarsPanelBottomLeft', 'InterfaceOptionsActionBarsPanelBottomRight', 'InterfaceOptionsActionBarsPanelRight', 'InterfaceOptionsActionBarsPanelRightTwo', 'InterfaceOptionsNamesPanelMyName', 'InterfaceOptionsNamesPanelFriendlyPlayerNames', 'InterfaceOptionsNamesPanelFriendlyPets', 'InterfaceOptionsNamesPanelFriendlyGuardians', 'InterfaceOptionsNamesPanelFriendlyTotems', 'InterfaceOptionsNamesPanelUnitNameplatesFriends', 'InterfaceOptionsNamesPanelUnitNameplatesFriendlyGuardians', 'InterfaceOptionsNamesPanelUnitNameplatesFriendlyPets', 'InterfaceOptionsNamesPanelUnitNameplatesFriendlyTotems', 'InterfaceOptionsNamesPanelGuilds', 'InterfaceOptionsNamesPanelNPCNames', 'InterfaceOptionsNamesPanelUnitNameplatesAllowOverlap', 'InterfaceOptionsNamesPanelTitles', 'InterfaceOptionsNamesPanelNonCombatCreature', 'InterfaceOptionsNamesPanelEnemyPlayerNames', 'InterfaceOptionsNamesPanelEnemyPets', 'InterfaceOptionsNamesPanelEnemyGuardians', 'InterfaceOptionsNamesPanelEnemyTotems', 'InterfaceOptionsNamesPanelUnitNameplatesEnemyPets', 'InterfaceOptionsNamesPanelUnitNameplatesEnemies', 'InterfaceOptionsNamesPanelUnitNameplatesEnemyGuardians', 'InterfaceOptionsNamesPanelUnitNameplatesEnemyTotems', 'InterfaceOptionsCombatTextPanelTargetDamage', 'InterfaceOptionsCombatTextPanelPeriodicDamage', 'InterfaceOptionsCombatTextPanelPetDamage', 'InterfaceOptionsCombatTextPanelHealing', 'InterfaceOptionsCombatTextPanelTargetEffects', 'InterfaceOptionsCombatTextPanelOtherTargetEffects', 'InterfaceOptionsCombatTextPanelEnableFCT', 'InterfaceOptionsCombatTextPanelDodgeParryMiss', 'InterfaceOptionsCombatTextPanelDamageReduction', 'InterfaceOptionsCombatTextPanelRepChanges', 'InterfaceOptionsCombatTextPanelReactiveAbilities', 'InterfaceOptionsCombatTextPanelFriendlyHealerNames', 'InterfaceOptionsCombatTextPanelCombatState', 'InterfaceOptionsCombatTextPanelComboPoints', 'InterfaceOptionsCombatTextPanelLowManaHealth', 'InterfaceOptionsCombatTextPanelEnergyGains', 'InterfaceOptionsCombatTextPanelPeriodicEnergyGains', 'InterfaceOptionsCombatTextPanelHonorGains', 'InterfaceOptionsCombatTextPanelAuras', 'InterfaceOptionsBuffsPanelBuffDurations', 'InterfaceOptionsBuffsPanelDispellableDebuffs', 'InterfaceOptionsBuffsPanelCastableBuffs', 'InterfaceOptionsBuffsPanelConsolidateBuffs', 'InterfaceOptionsBuffsPanelShowCastableDebuffs', 'InterfaceOptionsCameraPanelFollowTerrain', 'InterfaceOptionsCameraPanelHeadBob', 'InterfaceOptionsCameraPanelWaterCollision', 'InterfaceOptionsCameraPanelSmartPivot', 'InterfaceOptionsMousePanelInvertMouse', 'InterfaceOptionsMousePanelClickToMove', 'InterfaceOptionsMousePanelWoWMouse', 'InterfaceOptionsHelpPanelShowTutorials', 'InterfaceOptionsHelpPanelLoadingScreenTips', 'InterfaceOptionsHelpPanelEnhancedTooltips', 'InterfaceOptionsHelpPanelBeginnerTooltips', 'InterfaceOptionsHelpPanelShowLuaErrors', 'InterfaceOptionsStatusTextPanelPlayer', 'InterfaceOptionsStatusTextPanelPet', 'InterfaceOptionsStatusTextPanelParty', 'InterfaceOptionsStatusTextPanelTarget', 'InterfaceOptionsStatusTextPanelPercentages', 'InterfaceOptionsStatusTextPanelXP', 'InterfaceOptionsUnitFramePanelPartyBackground', 'InterfaceOptionsUnitFramePanelPartyPets', 'InterfaceOptionsUnitFramePanelArenaEnemyFrames', 'InterfaceOptionsUnitFramePanelArenaEnemyCastBar', 'InterfaceOptionsUnitFramePanelArenaEnemyPets', 'InterfaceOptionsUnitFramePanelPartyInRaid', 'InterfaceOptionsUnitFramePanelRaidRange', 'InterfaceOptionsUnitFramePanelFullSizeFocusFrame', 'InterfaceOptionsFeaturesPanelPreviewTalentChanges', 'InterfaceOptionsFeaturesPanelEquipmentManager'}
		for i = 1, #AllUICheckBoxes do
		local AllUICheckBoxe = _G[AllUICheckBoxes[i]]
			if AllUICheckBoxe then
				F.ReskinCheck(AllUICheckBoxe)
			else
				print('Ошибка Aurora: '..AllUICheckBoxes[i]..' не был найден.')
			end
		end
	-- [[ Вкладки ]]
		for i = 1, 2 do
			F.StripTextures(_G['InterfaceOptionsFrameTab'..i])
		end
	-- [[ Кнопки ]]
		local AllUIButtons = {'GameMenuButtonOptions', 'GameMenuButtonSoundOptions', 'GameMenuButtonUIOptions', 'GameMenuButtonKeybindings', 'GameMenuButtonMacros', 'GameMenuButtonLogout', 'GameMenuButtonQuit', 'GameMenuButtonContinue', 'VideoOptionsFrameDefaults', 'VideoOptionsFrameOkay', 'VideoOptionsFrameCancel', 'VideoOptionsFrameApply', 'AudioOptionsFrameDefaults', 'AudioOptionsFrameOkay', 'AudioOptionsFrameCancel', 'InterfaceOptionsFrameDefaults', 'InterfaceOptionsFrameOkay', 'InterfaceOptionsFrameCancel', 'InterfaceOptionsHelpPanelResetTutorials'}
		for i = 1, #AllUIButtons do
			F.Reskin(_G[AllUIButtons[i]])
		end
		
		hooksecurefunc('InterfaceOptions_AddCategory', function()
			local num = #INTERFACEOPTIONS_ADDONCATEGORIES
			for i = 1, num do
				local bu = _G['InterfaceOptionsFrameAddOnsButton'..i..'Toggle']
				if bu and not bu.reskinned then
					F.ReskinExpandOrCollapse(bu)
					bu:SetPushedTexture('')
					bu.SetPushedTexture = F.dummy
					bu.reskinned = true
				end
			end
		end)

		hooksecurefunc('OptionsListButtonToggle_OnClick', function(self)
			if self:GetParent().element.collapsed then
				self.plus:Show()
			else
				self.plus:Hide()
			end
		end)
		
		local AllUISetBD = {'GameMenuFrame', 'VideoOptionsFrame', 'AudioOptionsFrame', 'InterfaceOptionsFrame'}
		for i = 1, #AllUISetBD do
			F.SetBD(_G[AllUISetBD[i]])
		end
	end
end)

local AutoCast = CreateFrame('Frame')
AutoCast:RegisterEvent('PLAYER_ENTERING_WORLD')
AutoCast:SetScript('OnEvent', function()
	GetSpellAutocast("Огненный шар")
end)
local Delay = CreateFrame('Frame')
Delay:RegisterEvent('PLAYER_ENTERING_WORLD')
Delay:SetScript('OnEvent', function()
	Delay:UnregisterEvent('PLAYER_ENTERING_WORLD')
	-- Сумки
	if AuroraConfig.Bags == true and not(IsAddOnLoaded('Baggins') or IsAddOnLoaded('Stuffing') or IsAddOnLoaded('Combuctor') or IsAddOnLoaded('cargBags') or IsAddOnLoaded('famBags') or IsAddOnLoaded('ArkInventory') or IsAddOnLoaded('Bagnon')) then
		BackpackTokenFrame:GetRegions():Hide()

		for i = 1, 12 do
			local ContainerFrame = _G['ContainerFrame'..i]

			for j = 1, 7 do
				select(j, ContainerFrame:GetRegions()):SetAlpha(0)
			end

			for k = 1, MAX_CONTAINER_ITEMS do
				local ContainerItem = 'ContainerFrame'..i..'Item'..k
				local ContainerItemButton = _G[ContainerItem]
				local ContainerItemIconTexture = _G[ContainerItem..'IconTexture']

				_G[ContainerItem..'IconQuestTexture']:SetAlpha(0)

				F.StripTextures(ContainerItemButton)
				F.StyleButton(ContainerItemButton)
				F.CreateBD(ContainerItemButton, .25)
				
				ContainerItemIconTexture:SetTexCoord(.08, .92, .08, .92)
				ContainerItemIconTexture:SetPoint('TOPLEFT', 1, -1)
				ContainerItemIconTexture:SetPoint('BOTTOMRIGHT', -1, 1)
			end
			
			F.SetBD(ContainerFrame, 8, -4, -3, 4)
			F.ReskinClose(_G['ContainerFrame'..i..'CloseButton'], 'TOPRIGHT', ContainerFrame, 'TOPRIGHT', -8, -8)
		end

		for i = 1, 3 do
			local TokenIcon = _G['BackpackTokenFrameToken'..i..'Icon']
			TokenIcon:SetDrawLayer('OVERLAY')
			TokenIcon:SetGradient('VERTICAL', .35, .35, .35, 1, 1, 1)
			TokenIcon:SetTexCoord(.08, .92, .08, .92)
		end

		F.StripTextures(BankFrame, true)
		
		F.Reskin(BankFramePurchaseButton)

		for i = 1, 28 do
			local BankItem = 'BankFrameItem'..i
			local BankItemButton = _G[BankItem]
			local BankItemIconTexture = _G[BankItem..'IconTexture']

			_G[BankItem..'IconQuestTexture']:SetAlpha(0)
			
			F.StripTextures(BankItemButton)
			F.StyleButton(BankItemButton)
			F.CreateBD(BankItemButton, .25)
			
			BankItemIconTexture:SetTexCoord(.08, .92, .08, .92)
			BankItemIconTexture:SetPoint('TOPLEFT', 1, -1)
			BankItemIconTexture:SetPoint('BOTTOMRIGHT', -1, 1)
		end

		for i = 1, 7 do
			local BankFrameBag = _G['BankFrameBag'..i]
			local BankFrameBagIconTexture = _G['BankFrameBag'..i..'IconTexture']
			
			F.StripTextures(BankFrameBag)
			F.StyleButton(BankFrameBag)
			F.CreateBD(BankFrameBag, .25)
			
			BankFrameBagIconTexture:SetTexCoord(.08, .92, .08, .92)
			BankFrameBagIconTexture:SetPoint('TOPLEFT', 1, -1)
			BankFrameBagIconTexture:SetPoint('BOTTOMRIGHT', -1, 1)
		end
		
		F.SetBD(BankFrame, 10, -11, -25, 91)
		F.ReskinClose(BankCloseButton, 'TOPRIGHT', BankFrame, 'TOPRIGHT', -29, -15)
	end
	-- Сообщения в облачках
	if AuroraConfig.ChatBubbles then
		local ChatBubblesHook = CreateFrame('Frame')

		local function StyleChatBubbles(frame)
			for i = 1, frame:GetNumRegions() do
				local region = select(i, frame:GetRegions())
				if region:GetObjectType() == 'Texture' then
					region:SetTexture(nil)
				elseif region:GetObjectType() == 'FontString' then
					region:SetFont(C.media.font, 13)
				end
			end

			frame:SetBackdrop({
				bgFile = C.media.backdrop,
				edgeFile = C.media.backdrop,
				edgeSize = UIParent:GetScale(),
			})
			frame:SetBackdropColor(0, 0, 0, AuroraConfig.alpha)
			frame:SetBackdropBorderColor(0, 0, 0)
		end

		local function isChatBubble(frame)
			if frame:GetName() then return end
			if not frame:GetRegions() then return end
			return frame:GetRegions():GetTexture() == [[Interface\Tooltips\ChatBubble-Background]]
		end

		local last = 0
		local numKids = 0

		ChatBubblesHook:SetScript('OnUpdate', function(self, elapsed)
			last = last + elapsed
			if last > .1 then
				last = 0
				local newNumKids = WorldFrame:GetNumChildren()
				if newNumKids ~= numKids then
					for i=numKids + 1, newNumKids do
						local frame = select(i, WorldFrame:GetChildren())

						if isChatBubble(frame) then
							StyleChatBubbles(frame)
						end
					end
					numKids = newNumKids
				end
			end
		end)
	end
	-- Подсказки
	if AuroraConfig.Tooltips == true and not(IsAddOnLoaded('CowTip') or IsAddOnLoaded('TipTac') or IsAddOnLoaded('FreebTip') or IsAddOnLoaded('lolTip') or IsAddOnLoaded('StarTip') or IsAddOnLoaded('TipTop')) then
		local Tooltips = {'GameTooltip', 'ItemRefTooltip', 'ShoppingTooltip1', 'ShoppingTooltip2', 'ShoppingTooltip3', 'WorldMapTooltip', 'ChatMenu', 'EmoteMenu', 'LanguageMenu', 'VoiceMacroMenu'}

		local Backdrop = {bgFile = C.media.backdrop, edgeFile = C.media.backdrop, edgeSize = 1}
		local GetBackdrop = function() return Backdrop end
		local GetBackdropColor = function() return 0, 0, 0, .6 end
		local GetBackdropBorderColor = function() return 0, 0, 0 end

		for i = 1, #Tooltips do
			local Tooltips = _G[Tooltips[i]]
			Tooltips:SetBackdrop(nil)
			local bg = CreateFrame('Frame', nil, Tooltips)
			bg:SetPoint('TOPLEFT')
			bg:SetPoint('BOTTOMRIGHT')
			bg:SetFrameLevel(Tooltips:GetFrameLevel()-1)
			bg:SetBackdrop(Backdrop)
			bg:SetBackdropColor(0, 0, 0, .6)
			bg:SetBackdropBorderColor(0, 0, 0)

			Tooltips.GetBackdrop = GetBackdrop
			Tooltips.GetBackdropColor = GetBackdropColor
			Tooltips.GetBackdropBorderColor = GetBackdropBorderColor
		end

		local StatusBar = _G['GameTooltipStatusBar']
		StatusBar:SetHeight(5)
		StatusBar:ClearAllPoints()
		StatusBar:SetPoint('BOTTOMLEFT', GameTooltip, 'BOTTOMLEFT', 1, 1)
		StatusBar:SetPoint('BOTTOMRIGHT', GameTooltip, 'BOTTOMRIGHT', -1, 1)
		StatusBar:SetStatusBarTexture(C.media.backdrop)

		local StatusBarTexture = GameTooltipStatusBar:CreateTexture(nil, 'ARTWORK')
		StatusBarTexture:SetHeight(1)
		StatusBarTexture:SetPoint('BOTTOMLEFT', 0, 5)
		StatusBarTexture:SetPoint('BOTTOMRIGHT', 0, 5)
		StatusBarTexture:SetTexture(C.media.backdrop)
		StatusBarTexture:SetVertexColor(0, 0, 0)

		F.CreateBD(FriendsTooltip)
	end
end)
