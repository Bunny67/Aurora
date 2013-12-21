local alpha, useButtonGradientColour

local _G = getfenv(0);

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
	["useButtonGradientColour"] = true,
	["useCustomColour"] = false,
		["customColour"] = {r = 1, g = 1, b = 1},
		
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

F.TexCoords = {.08, .92, .08, .92};
F.dummy = function() end;

F.StyleButton = function(Button, NoHover, NoPushed, NoChecked)
	if Button.SetHighlightTexture and not Button.Hover and not NoHover then
		local Hover = Button:CreateTexture('frame', nil, self);
		Hover:SetTexture(r, g, b, 0.3);
		Hover:SetPoint('TOPLEFT', 1, -1);
		Hover:SetPoint('BOTTOMRIGHT', -1, 1);
		Button.Hover = Hover;
		Button:SetHighlightTexture(Hover);
	end
	
	if Button.SetPushedTexture and not Button.Pushed and not NoPushed then
		local Pushed = Button:CreateTexture('frame', nil, self);
		Pushed:SetTexture(0.9, 0.8, 0.1, 0.3);
		Pushed:SetPoint('TOPLEFT', 1, -1);
		Pushed:SetPoint('BOTTOMRIGHT', -1, 1);
		Button.Pushed = Pushed;
		Button:SetPushedTexture(Pushed);
	end
	
	if Button.SetCheckedTexture and not Button.Checked and not NoChecked then
		local Checked = Button:CreateTexture('frame', nil, self);
		Checked:SetTexture(1, 1, 1);
		Checked:SetPoint('TOPLEFT', 1, -1);
		Checked:SetPoint('BOTTOMRIGHT', -1, 1);
		Checked:SetAlpha(0.3);
		Button.Checked = Checked;
		Button:SetCheckedTexture(Checked);
	end
	
	local Cooldown = Button:GetName() and _G[Button:GetName()..'Cooldown'] 
	if Cooldown then
		Cooldown:ClearAllPoints();
		Cooldown:SetPoint('TOPLEFT', -1, 1);
		Cooldown:SetPoint('BOTTOMRIGHT', -1, 1);
	end
end

F.CreateBD = function(Frame, A)
	Frame:SetBackdrop({ bgFile = C.media.backdrop, edgeFile = C.media.backdrop, edgeSize = 1 });
	Frame:SetBackdropColor(0, 0, 0, A or alpha);
	Frame:SetBackdropBorderColor(0, 0, 0);
	
	if not A then tinsert(C.frames, Frame); end
end

F.CreateBG = function(Frame)
	if Frame:GetObjectType() == 'Texture' then Frame = Frame:GetParent(); end

	local BG = Frame:CreateTexture(nil, 'BACKGROUND');
	BG:SetPoint('TOPLEFT', Frame, -1, 1);
	BG:SetPoint('BOTTOMRIGHT', Frame, 1, -1);
	BG:SetTexture(C.media.backdrop);
	BG:SetVertexColor(0, 0, 0);

	return BG
end

-- we assign these after loading variables for caching
-- otherwise we call an extra unpack() every time
local buttonR, buttonG, buttonB, buttonA

F.CreateGradient = function(Frame)
	local Gradient = Frame:CreateTexture(nil, 'BORDER');
	Gradient:SetPoint('TOPLEFT', 1, -1);
	Gradient:SetPoint('BOTTOMRIGHT', -1, 1);
	Gradient:SetTexture(useButtonGradientColour and C.media.gradient or C.media.backdrop);
	Gradient:SetVertexColor(buttonR, buttonG, buttonB, buttonA);

	return Gradient;
end

local function ColourButton(Frame)
	if not Frame:IsEnabled() then return end

	if useButtonGradientColour then
		Frame:SetBackdropColor(r, g, b, .3);
	else
		Frame.Gradient:SetVertexColor(r / 4, g / 4, b / 4);
	end

	Frame:SetBackdropBorderColor(r, g, b);
end

local function ClearButton(Frame)
	if useButtonGradientColour then
		Frame:SetBackdropColor(0, 0, 0, 0);
	else
		Frame.Gradient:SetVertexColor(buttonR, buttonG, buttonB, buttonA);
	end

	Frame:SetBackdropBorderColor(0, 0, 0);
end

F.Reskin = function(Frame, NoHighlight, Strip)
	if Frame:GetName() then
		local Left = _G[Frame:GetName()..'Left'];
		local Middle = _G[Frame:GetName()..'Middle'];
		local Right = _G[Frame:GetName()..'Right'];


		if Left then Left:SetAlpha(0); end
		if Middle then Middle:SetAlpha(0); end
		if Right then Right:SetAlpha(0); end
	end

	if Frame.Left then Frame.Left:SetAlpha(0); end
	if Frame.Right then Frame.Right:SetAlpha(0); end	
	if Frame.Middle then Frame.Middle:SetAlpha(0); end
	if Frame.SetNormalTexture then Frame:SetNormalTexture(''); end	
	if Frame.SetHighlightTexture then Frame:SetHighlightTexture(''); end
	if Frame.SetPushedTexture then Frame:SetPushedTexture(''); end	
	if Frame.SetDisabledTexture then Frame:SetDisabledTexture(''); end
	
	if Strip then F.StripTextures(Frame, true); end
	
	F.CreateBD(Frame, 0);

	Frame.Gradient = F.CreateGradient(Frame);

	if not NoHighlight then
		Frame:HookScript('OnEnter', ColourButton);
 		Frame:HookScript('OnLeave', ClearButton);
	end
end

F.ReskinTab = function(Frame)
	Frame:DisableDrawLayer('BACKGROUND');

	local BG = CreateFrame('Frame', nil, Frame);
	BG:SetPoint('TOPLEFT', 8, -3);
	BG:SetPoint('BOTTOMRIGHT', -8, 0);
	BG:SetFrameLevel(Frame:GetFrameLevel() - 1);
	F.CreateBD(BG);

	Frame:SetHighlightTexture(C.media.backdrop);
	Frame:GetHighlightTexture():SetPoint('TOPLEFT', 9, -4);
	Frame:GetHighlightTexture():SetPoint('BOTTOMRIGHT', -9, 1);
	Frame:GetHighlightTexture():SetVertexColor(r, g, b, .25);
end

local function ColourScroll(Frame)
	if Frame:IsEnabled() then
		Frame.Texture:SetVertexColor(r, g, b)
	end
end

local function ClearScroll(Frame)
	Frame.Texture:SetVertexColor(1, 1, 1)
end

F.ReskinScroll = function(Frame)
	if _G[Frame:GetName()..'Track'] then _G[Frame:GetName()..'Track']:Hide(); end
	if _G[Frame:GetName()..'BG'] then _G[Frame:GetName()..'BG']:Hide(); end
	if _G[Frame:GetName()..'Top'] then _G[Frame:GetName()..'Top']:Hide(); end
	if _G[Frame:GetName()..'Middle'] then _G[Frame:GetName()..'Middle']:Hide(); end
	if _G[Frame:GetName()..'Bottom'] then _G[Frame:GetName()..'Bottom']:Hide(); end

	_G[Frame:GetName()..'ThumbTexture']:SetAlpha(0);
	_G[Frame:GetName()..'ThumbTexture']:SetWidth(17);

	_G[Frame:GetName()..'ThumbTexture'].DB = CreateFrame('Frame', nil, Frame)
	_G[Frame:GetName()..'ThumbTexture'].DB:SetPoint('TOPLEFT', _G[Frame:GetName()..'ThumbTexture'], 0, -2);
	_G[Frame:GetName()..'ThumbTexture'].DB:SetPoint('BOTTOMRIGHT', _G[Frame:GetName()..'ThumbTexture'], 0, 4);
	F.CreateBD(_G[Frame:GetName()..'ThumbTexture'].DB, 0);

	local Gradient = F.CreateGradient(Frame)
	Gradient:SetPoint('TOPLEFT', _G[Frame:GetName()..'ThumbTexture'].DB, 1, -1);
	Gradient:SetPoint('BOTTOMRIGHT', _G[Frame:GetName()..'ThumbTexture'].DB, -1, 1);

	_G[Frame:GetName()..'ScrollUpButton']:SetWidth(17);
	_G[Frame:GetName()..'ScrollDownButton']:SetWidth(17);

	F.Reskin(_G[Frame:GetName()..'ScrollUpButton'], true);
	F.Reskin(_G[Frame:GetName()..'ScrollDownButton'], true);

	_G[Frame:GetName()..'ScrollUpButton']:SetDisabledTexture(C.media.backdrop);
	_G[Frame:GetName()..'ScrollUpButton']:GetDisabledTexture():SetVertexColor(0, 0, 0, .4);
	_G[Frame:GetName()..'ScrollUpButton']:GetDisabledTexture():SetDrawLayer('OVERLAY');

	_G[Frame:GetName()..'ScrollDownButton']:SetDisabledTexture(C.media.backdrop);
	_G[Frame:GetName()..'ScrollDownButton']:GetDisabledTexture():SetVertexColor(0, 0, 0, .4);
	_G[Frame:GetName()..'ScrollDownButton']:GetDisabledTexture():SetDrawLayer('OVERLAY');

	local UpTexture = _G[Frame:GetName()..'ScrollUpButton']:CreateTexture(nil, 'ARTWORK');
	UpTexture:SetTexture(C.media.arrowUp);
	UpTexture:SetSize(8, 8);
	UpTexture:SetPoint('CENTER');
	UpTexture:SetVertexColor(1, 1, 1);
	_G[Frame:GetName()..'ScrollUpButton'].Texture = UpTexture;

	local DownTexture = _G[Frame:GetName()..'ScrollDownButton']:CreateTexture(nil, 'ARTWORK');
	DownTexture:SetTexture(C.media.arrowDown);
	DownTexture:SetSize(8, 8);
	DownTexture:SetPoint('CENTER');
	DownTexture:SetVertexColor(1, 1, 1);
	_G[Frame:GetName()..'ScrollDownButton'].Texture = DownTexture;

	_G[Frame:GetName()..'ScrollUpButton']:HookScript('OnEnter', ColourScroll);
	_G[Frame:GetName()..'ScrollUpButton']:HookScript('OnLeave', ClearScroll);
	_G[Frame:GetName()..'ScrollDownButton']:HookScript('OnEnter', ColourScroll);
	_G[Frame:GetName()..'ScrollDownButton']:HookScript('OnLeave', ClearScroll);
end

local function ColourArrow(Frame)
	if Frame:IsEnabled() then
		Frame.Texture:SetVertexColor(r, g, b);
	end
end

local function ClearArrow(Frame)
	Frame.Texture:SetVertexColor(1, 1, 1);
end

F.ColourArrow = ColourArrow;
F.ClearArrow = ClearArrow;

F.ReskinDropDown = function(Frame)
	local Button = _G[Frame:GetName()..'Button']
	
	F.StripTextures(Frame)
	
	Button:SetSize(20, 20);
	Button:ClearAllPoints();
	Button:SetPoint('RIGHT', -18, 2);

	F.Reskin(Button, true);

	Button:SetDisabledTexture(C.media.backdrop);
	Button:GetDisabledTexture():SetVertexColor(0, 0, 0, .4);
	Button:GetDisabledTexture():SetDrawLayer('OVERLAY');
	Button:GetDisabledTexture():SetAllPoints();

	local Texture = Button:CreateTexture(nil, 'ARTWORK');
	Texture:SetTexture(C.media.arrowDown);
	Texture:SetSize(8, 8);
	Texture:SetPoint('CENTER');
	Texture:SetVertexColor(1, 1, 1);
	Button.Texture = Texture;

	Button:HookScript('OnEnter', ColourArrow);
	Button:HookScript('OnLeave', ClearArrow);

	local BD = CreateFrame('Frame', nil, Frame);
	BD:SetPoint('TOPLEFT', 16, -4);
	BD:SetPoint('BOTTOMRIGHT', -18, 8);
	BD:SetFrameLevel(Frame:GetFrameLevel() - 1);
	F.CreateBD(BD, 0);

	local Fradient = F.CreateGradient(Frame);
	Fradient:SetPoint('TOPLEFT', BD, 1, -1);
	Fradient:SetPoint('BOTTOMRIGHT', BD, -1, 1);
end

local function ColourClose(Frame)
	if Frame:IsEnabled() then
		for _, Pixel in pairs(Frame.Pixels) do
			Pixel:SetVertexColor(r, g, b)
		end
	end
end

local function ClearClose(Frame)
	for _, Pixel in pairs(Frame.Pixels) do
		Pixel:SetVertexColor(1, 1, 1)
	end
end

F.ReskinClose = function(Frame, a1, p, a2, x, y)
	Frame:SetSize(17, 17);

	if not a1 then Frame:SetPoint('TOPRIGHT', -6, -6); else Frame:ClearAllPoints(); Frame:SetPoint(a1, p, a2, x, y); end

	Frame:SetNormalTexture('');
	Frame:SetHighlightTexture('');
	Frame:SetPushedTexture('');
	Frame:SetDisabledTexture('');

	F.CreateBD(Frame, 0);

	F.CreateGradient(Frame);

	Frame:SetDisabledTexture(C.media.backdrop);
	Frame:GetDisabledTexture():SetVertexColor(0, 0, 0, .4);
	Frame:GetDisabledTexture():SetDrawLayer('OVERLAY');
	Frame:GetDisabledTexture():SetAllPoints();

	Frame.Pixels = {};

	for i = 1, 9 do
		local Texture = Frame:CreateTexture();
		Texture:SetTexture(1, 1, 1);
		Texture:SetSize(1, 1);
		Texture:SetPoint('BOTTOMLEFT', 3 + i, 3 + i);
		tinsert(Frame.Pixels, Texture);
	end

	for i = 1, 9 do
		local Texture = Frame:CreateTexture();
		Texture:SetTexture(1, 1, 1);
		Texture:SetSize(1, 1);
		Texture:SetPoint('TOPLEFT', 3 + i, -3 - i);
		tinsert(Frame.Pixels, Texture);
	end

	Frame:HookScript("OnEnter", ColourClose);
 	Frame:HookScript("OnLeave", ClearClose);
end

F.ReskinInput = function(Frame, Height, Width)
	if _G[Frame:GetName()..'Left'] then _G[Frame:GetName()..'Left']:Hide(); end
	if _G[Frame:GetName()..'Middle'] then _G[Frame:GetName()..'Middle']:Hide(); end
	if _G[Frame:GetName()..'Mid'] then _G[Frame:GetName()..'Mid']:Hide(); end
	if _G[Frame:GetName()..'Right'] then _G[Frame:GetName()..'Right']:Hide(); end
	
	local BD = CreateFrame('Frame', nil, Frame);
	BD:SetPoint('TOPLEFT', -2, 0);
	BD:SetPoint('BOTTOMRIGHT');
	BD:SetFrameLevel(Frame:GetFrameLevel() - 1);
	F.CreateBD(BD, 0);
	
	if Frame:GetName() and Frame:GetName():find('Silver') or Frame:GetName():find('Copper') then
		BD:SetPoint('BOTTOMRIGHT', -10, 0)
	end

	local Gradient = F.CreateGradient(Frame);
	Gradient:SetPoint('TOPLEFT', BD, 1, -1);
	Gradient:SetPoint('BOTTOMRIGHT', BD, -1, 1);

	if Height then Frame:SetHeight(Height); end
	if Width then Frame:SetWidth(Width); end
end

F.ReskinArrow = function(Frame, Direction)
	Frame:SetSize(18, 18);
	F.Reskin(Frame, true);

	Frame:SetDisabledTexture(C.media.backdrop);
	Frame:GetDisabledTexture():SetVertexColor(0, 0, 0, .3);
	Frame:GetDisabledTexture():SetDrawLayer('OVERLAY');

	local Texture = Frame:CreateTexture(nil, 'ARTWORK');
	Texture:SetTexture('Interface\\AddOns\\Aurora\\media\\arrow-'..Direction..'-active');
	Texture:SetSize(8, 8);
	Texture:SetPoint('CENTER');
	Frame.Texture = Texture;

	Frame:HookScript('OnEnter', ColourArrow);
	Frame:HookScript('OnLeave', ClearArrow);
end

F.ReskinCheck = function(Frame)
	Frame:SetNormalTexture('');
	Frame:SetPushedTexture('');
	Frame:SetHighlightTexture(C.media.backdrop);
	
	Frame:GetHighlightTexture():SetPoint('TOPLEFT', 5, -5);
	Frame:GetHighlightTexture():SetPoint('BOTTOMRIGHT', -5, 5);
	Frame:GetHighlightTexture():SetVertexColor(r, g, b, .2);

	local BD = CreateFrame('Frame', nil, Frame);
	BD:SetPoint('TOPLEFT', 4, -4);
	BD:SetPoint('BOTTOMRIGHT', -4, 4);
	BD:SetFrameLevel(Frame:GetFrameLevel() - 1);
	F.CreateBD(BD, 0);

	local Gradient = F.CreateGradient(Frame);
	Gradient:SetPoint('TOPLEFT', 5, -5);
	Gradient:SetPoint('BOTTOMRIGHT', -5, 5);

	Frame:GetCheckedTexture():SetVertexColor(r, g, b)
end

local function ColourRadio(Frame)
	Frame.BD:SetBackdropBorderColor(r, g, b)
end

local function ClearRadio(Frame)
	Frame.BD:SetBackdropBorderColor(0, 0, 0)
end

F.ReskinRadio = function(Frame)
	Frame:SetNormalTexture('');
	Frame:SetHighlightTexture('');
	Frame:SetCheckedTexture(C.media.backdrop);
	
	Frame:GetCheckedTexture():SetPoint('TOPLEFT', 4, -4);
	Frame:GetCheckedTexture():SetPoint('BOTTOMRIGHT', -4, 4);
	Frame:GetCheckedTexture():SetVertexColor(r, g, b, .6);

	local BD = CreateFrame('Frame', nil, Frame);
	BD:SetPoint('TOPLEFT', 3, -3);
	BD:SetPoint('BOTTOMRIGHT', -3, 3);
	BD:SetFrameLevel(Frame:GetFrameLevel() - 1);
	F.CreateBD(BD, 0);
	Frame.BD = BD;

	local Gradient = F.CreateGradient(Frame);
	Gradient:SetPoint('TOPLEFT', 4, -4);
	Gradient:SetPoint('BOTTOMRIGHT', -4, 4);

	Frame:HookScript('OnEnter', ColourRadio);
	Frame:HookScript('OnLeave', ClearRadio);
end

F.ReskinSlider = function(Frame)
	Frame:SetBackdrop(nil);
	Frame.SetBackdrop = F.dummy;

	local BD = CreateFrame('Frame', nil, Frame);
	BD:SetPoint('TOPLEFT', 14, -2);
	BD:SetPoint('BOTTOMRIGHT', -15, 3);
	BD:SetFrameStrata('BACKGROUND');
	BD:SetFrameLevel(Frame:GetFrameLevel() - 1);
	F.CreateBD(BD, 0);

	F.CreateGradient(BD);

	local Slider = select(4, Frame:GetRegions());
	Slider:SetTexture('Interface\\CastingBar\\UI-CastingBar-Spark');
	Slider:SetBlendMode('ADD');
end

local function ColourExpandOrCollapse(Frame)
	if Frame:IsEnabled() then
		Frame.Plus:SetVertexColor(r, g, b)
		Frame.Minus:SetVertexColor(r, g, b)
	end
end

local function ClearExpandOrCollapse(Frame)
	Frame.Plus:SetVertexColor(1, 1, 1)
	Frame.Minus:SetVertexColor(1, 1, 1)
end

F.ColourExpandOrCollapse = ColourExpandOrCollapse
F.ClearExpandOrCollapse = ClearExpandOrCollapse

F.ReskinExpandOrCollapse = function(Frame)
	Frame:SetSize(13, 13);

	F.Reskin(Frame, true, true);
	Frame.SetNormalTexture = F.dummy;

	Frame.Minus = Frame:CreateTexture(nil, 'OVERLAY');
	Frame.Minus:SetSize(7, 1);
	Frame.Minus:SetPoint('CENTER');
	Frame.Minus:SetTexture(C.media.backdrop);
	Frame.Minus:SetVertexColor(1, 1, 1);

	Frame.Plus = Frame:CreateTexture(nil, 'OVERLAY');
	Frame.Plus:SetSize(1, 7);
	Frame.Plus:SetPoint('CENTER');
	Frame.Plus:SetTexture(C.media.backdrop);
	Frame.Plus:SetVertexColor(1, 1, 1);

	Frame:HookScript('OnEnter', ColourExpandOrCollapse);
	Frame:HookScript('OnLeave', ClearExpandOrCollapse);
end

F.SetBD = function(Frame, x, y, x2, y2)
	local BD = CreateFrame('Frame', nil, Frame)
	BD:SetFrameLevel(0);
	
	if not x then BD:SetPoint('TOPLEFT'); BD:SetPoint('BOTTOMRIGHT'); else BD:SetPoint('TOPLEFT', x, y); BD:SetPoint('BOTTOMRIGHT', x2, y2); end
	
	F.CreateBD(BD);
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
	end
	
	object.Show = F.dummy
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
	
		
		local AllUIStripTextures = {'GameMenuFrame', 'VideoOptionsFrame', 'VideoOptionsFrameCategoryFrame', 'VideoOptionsEffectsPanelQuality', 'VideoOptionsEffectsPanelShaders', 'VideoOptionsFramePanelContainer', 'VideoOptionsResolutionPanelBrightness', 'AudioOptionsFrame', 'AudioOptionsFrameCategoryFrame', 'AudioOptionsSoundPanelPlayback', 'AudioOptionsSoundPanelHardware', 'AudioOptionsSoundPanelVolume', 'AudioOptionsFramePanelContainer', 'InterfaceOptionsFrame', 'InterfaceOptionsFrameCategories', 'InterfaceOptionsFramePanelContainer', 'InterfaceOptionsFrameAddOns'}
		for i = 1, #AllUIStripTextures do
			F.StripTextures(_G[AllUIStripTextures[i]], true)
		end
		
		local AllUIDropDowns = {'VideoOptionsResolutionPanelResolutionDropDown', 'VideoOptionsResolutionPanelMultiSampleDropDown', 'VideoOptionsResolutionPanelRefreshDropDown', 'AudioOptionsSoundPanelHardwareDropDown', 'InterfaceOptionsControlsPanelAutoLootKeyDropDown', 'InterfaceOptionsCombatPanelTOTDropDown', 'InterfaceOptionsCombatPanelSelfCastKeyDropDown', 'InterfaceOptionsCombatPanelFocusCastKeyDropDown', 'InterfaceOptionsDisplayPanelWorldPVPObjectiveDisplay', 'InterfaceOptionsDisplayPanelAggroWarningDisplay', 'InterfaceOptionsSocialPanelChatStyle', 'InterfaceOptionsSocialPanelTimestamps', 'InterfaceOptionsCombatTextPanelFCTDropDown', 'InterfaceOptionsCameraPanelStyleDropDown', 'InterfaceOptionsMousePanelClickMoveStyleDropDown'}
		for i = 1, #AllUIDropDowns do
			F.ReskinDropDown(_G[AllUIDropDowns[i]])
		end
		
		local AllUISlider = {'VideoOptionsResolutionPanelUIScaleSlider', 'VideoOptionsEffectsPanelQualitySlider', 'VideoOptionsEffectsPanelViewDistance', 'VideoOptionsEffectsPanelEnvironmentDetail', 'VideoOptionsEffectsPanelTextureResolution', 'VideoOptionsEffectsPanelTerrainDetail', 'VideoOptionsEffectsPanelClutterDensity', 'VideoOptionsEffectsPanelTextureFiltering', 'VideoOptionsEffectsPanelParticleDensity', 'VideoOptionsEffectsPanelShadowQuality', 'VideoOptionsEffectsPanelClutterRadius', 'VideoOptionsEffectsPanelWeatherIntensity', 'VideoOptionsEffectsPanelPlayerTexture', 'VideoOptionsResolutionPanelGammaSlider', 'AudioOptionsSoundPanelSoundQuality', 'AudioOptionsSoundPanelSoundChannels', 'AudioOptionsSoundPanelMasterVolume', 'AudioOptionsSoundPanelSoundVolume', 'AudioOptionsSoundPanelMusicVolume', 'AudioOptionsSoundPanelAmbienceVolume', 'InterfaceOptionsCameraPanelMaxDistanceSlider', 'InterfaceOptionsCameraPanelFollowSpeedSlider', 'InterfaceOptionsMousePanelMouseLookSpeedSlider','InterfaceOptionsMousePanelMouseSensitivitySlider'}
		for i = 1, #AllUISlider do
			F.ReskinSlider(_G[AllUISlider[i]])
		end
		
		local AllUICheckBoxes = {'VideoOptionsResolutionPanelVSync', 'VideoOptionsResolutionPanelTripleBuffer', 'VideoOptionsResolutionPanelHardwareCursor', 'VideoOptionsResolutionPanelFixInputLag', 'VideoOptionsResolutionPanelUseUIScale', 'VideoOptionsResolutionPanelWindowed', 'VideoOptionsResolutionPanelMaximized', 'VideoOptionsResolutionPanelDisableResize', 'VideoOptionsResolutionPanelDesktopGamma', 'VideoOptionsEffectsPanelSpecularLighting', 'VideoOptionsEffectsPanelFullScreenGlow', 'VideoOptionsEffectsPanelDeathEffect', 'VideoOptionsEffectsPanelProjectedTextures', 'AudioOptionsSoundPanelEnableSound', 'AudioOptionsSoundPanelSoundEffects', 'AudioOptionsSoundPanelErrorSpeech', 'AudioOptionsSoundPanelEmoteSounds', 'AudioOptionsSoundPanelPetSounds', 'AudioOptionsSoundPanelMusic', 'AudioOptionsSoundPanelLoopMusic', 'AudioOptionsSoundPanelAmbientSounds', 'AudioOptionsSoundPanelSoundInBG', 'AudioOptionsSoundPanelReverb', 'AudioOptionsSoundPanelHRTF', 'AudioOptionsSoundPanelEnableDSPs', 'AudioOptionsSoundPanelUseHardware', 'InterfaceOptionsControlsPanelStickyTargeting', 'InterfaceOptionsControlsPanelAutoDismount', 'InterfaceOptionsControlsPanelAutoClearAFK', 'InterfaceOptionsControlsPanelBlockTrades', 'InterfaceOptionsControlsPanelLootAtMouse', 'InterfaceOptionsControlsPanelAutoLootCorpse', 'InterfaceOptionsCombatPanelAttackOnAssist', 'InterfaceOptionsCombatPanelAutoRange', 'InterfaceOptionsCombatPanelStopAutoAttack', 'InterfaceOptionsCombatPanelNameplateClassColors', 'InterfaceOptionsCombatPanelAutoSelfCast', 'InterfaceOptionsCombatPanelTargetOfTarget', 'InterfaceOptionsCombatPanelEnemyCastBarsOnPortrait', 'InterfaceOptionsCombatPanelEnemyCastBarsOnNameplates', 'InterfaceOptionsDisplayPanelShowCloak', 'InterfaceOptionsDisplayPanelShowHelm', 'InterfaceOptionsDisplayPanelShowAggroPercentage', 'InterfaceOptionsDisplayPanelPlayAggroSounds', 'InterfaceOptionsDisplayPanelDetailedLootInfo', 'InterfaceOptionsDisplayPanelShowFreeBagSpace', 'InterfaceOptionsDisplayPanelCinematicSubtitles', 'InterfaceOptionsDisplayPanelRotateMinimap', 'InterfaceOptionsDisplayPanelScreenEdgeFlash', 'InterfaceOptionsDisplayPanelShowClock', 'InterfaceOptionsDisplayPanelColorblindMode', 'InterfaceOptionsDisplayPanelShowItemLevel', 'InterfaceOptionsObjectivesPanelInstantQuestText', 'InterfaceOptionsObjectivesPanelAutoQuestTracking', 'InterfaceOptionsObjectivesPanelAutoQuestProgress', 'InterfaceOptionsObjectivesPanelMapQuestDifficulty', 'InterfaceOptionsObjectivesPanelAdvancedWorldMap', 'InterfaceOptionsObjectivesPanelWatchFrameWidth', 'InterfaceOptionsSocialPanelProfanityFilter', 'InterfaceOptionsSocialPanelSpamFilter', 'InterfaceOptionsSocialPanelChatBubbles', 'InterfaceOptionsSocialPanelPartyChat', 'InterfaceOptionsSocialPanelChatHoverDelay', 'InterfaceOptionsSocialPanelGuildMemberAlert', 'InterfaceOptionsSocialPanelGuildRecruitment', 'InterfaceOptionsSocialPanelChatMouseScroll', 'InterfaceOptionsSocialPanelWholeChatWindowClickable', 'InterfaceOptionsActionBarsPanelLockActionBars', 'InterfaceOptionsActionBarsPanelSecureAbilityToggle', 'InterfaceOptionsActionBarsPanelAlwaysShowActionBars', 'InterfaceOptionsActionBarsPanelBottomLeft', 'InterfaceOptionsActionBarsPanelBottomRight', 'InterfaceOptionsActionBarsPanelRight', 'InterfaceOptionsActionBarsPanelRightTwo', 'InterfaceOptionsNamesPanelMyName', 'InterfaceOptionsNamesPanelFriendlyPlayerNames', 'InterfaceOptionsNamesPanelFriendlyPets', 'InterfaceOptionsNamesPanelFriendlyGuardians', 'InterfaceOptionsNamesPanelFriendlyTotems', 'InterfaceOptionsNamesPanelUnitNameplatesFriends', 'InterfaceOptionsNamesPanelUnitNameplatesFriendlyGuardians', 'InterfaceOptionsNamesPanelUnitNameplatesFriendlyPets', 'InterfaceOptionsNamesPanelUnitNameplatesFriendlyTotems', 'InterfaceOptionsNamesPanelGuilds', 'InterfaceOptionsNamesPanelNPCNames', 'InterfaceOptionsNamesPanelUnitNameplatesAllowOverlap', 'InterfaceOptionsNamesPanelTitles', 'InterfaceOptionsNamesPanelNonCombatCreature', 'InterfaceOptionsNamesPanelEnemyPlayerNames', 'InterfaceOptionsNamesPanelEnemyPets', 'InterfaceOptionsNamesPanelEnemyGuardians', 'InterfaceOptionsNamesPanelEnemyTotems', 'InterfaceOptionsNamesPanelUnitNameplatesEnemyPets', 'InterfaceOptionsNamesPanelUnitNameplatesEnemies', 'InterfaceOptionsNamesPanelUnitNameplatesEnemyGuardians', 'InterfaceOptionsNamesPanelUnitNameplatesEnemyTotems', 'InterfaceOptionsCombatTextPanelTargetDamage', 'InterfaceOptionsCombatTextPanelPeriodicDamage', 'InterfaceOptionsCombatTextPanelPetDamage', 'InterfaceOptionsCombatTextPanelHealing', 'InterfaceOptionsCombatTextPanelTargetEffects', 'InterfaceOptionsCombatTextPanelOtherTargetEffects', 'InterfaceOptionsCombatTextPanelEnableFCT', 'InterfaceOptionsCombatTextPanelDodgeParryMiss', 'InterfaceOptionsCombatTextPanelDamageReduction', 'InterfaceOptionsCombatTextPanelRepChanges', 'InterfaceOptionsCombatTextPanelReactiveAbilities', 'InterfaceOptionsCombatTextPanelFriendlyHealerNames', 'InterfaceOptionsCombatTextPanelCombatState', 'InterfaceOptionsCombatTextPanelComboPoints', 'InterfaceOptionsCombatTextPanelLowManaHealth', 'InterfaceOptionsCombatTextPanelEnergyGains', 'InterfaceOptionsCombatTextPanelPeriodicEnergyGains', 'InterfaceOptionsCombatTextPanelHonorGains', 'InterfaceOptionsCombatTextPanelAuras', 'InterfaceOptionsBuffsPanelBuffDurations', 'InterfaceOptionsBuffsPanelDispellableDebuffs', 'InterfaceOptionsBuffsPanelCastableBuffs', 'InterfaceOptionsBuffsPanelConsolidateBuffs', 'InterfaceOptionsBuffsPanelShowCastableDebuffs', 'InterfaceOptionsCameraPanelFollowTerrain', 'InterfaceOptionsCameraPanelHeadBob', 'InterfaceOptionsCameraPanelWaterCollision', 'InterfaceOptionsCameraPanelSmartPivot', 'InterfaceOptionsMousePanelInvertMouse', 'InterfaceOptionsMousePanelClickToMove', 'InterfaceOptionsMousePanelWoWMouse', 'InterfaceOptionsHelpPanelShowTutorials', 'InterfaceOptionsHelpPanelLoadingScreenTips', 'InterfaceOptionsHelpPanelEnhancedTooltips', 'InterfaceOptionsHelpPanelBeginnerTooltips', 'InterfaceOptionsHelpPanelShowLuaErrors', 'InterfaceOptionsStatusTextPanelPlayer', 'InterfaceOptionsStatusTextPanelPet', 'InterfaceOptionsStatusTextPanelParty', 'InterfaceOptionsStatusTextPanelTarget', 'InterfaceOptionsStatusTextPanelPercentages', 'InterfaceOptionsStatusTextPanelXP', 'InterfaceOptionsUnitFramePanelPartyBackground', 'InterfaceOptionsUnitFramePanelPartyPets', 'InterfaceOptionsUnitFramePanelArenaEnemyFrames', 'InterfaceOptionsUnitFramePanelArenaEnemyCastBar', 'InterfaceOptionsUnitFramePanelArenaEnemyPets', 'InterfaceOptionsUnitFramePanelPartyInRaid', 'InterfaceOptionsUnitFramePanelRaidRange', 'InterfaceOptionsUnitFramePanelFullSizeFocusFrame', 'InterfaceOptionsFeaturesPanelPreviewTalentChanges', 'InterfaceOptionsFeaturesPanelEquipmentManager'}
		for i = 1, #AllUICheckBoxes do
		local AllUICheckBoxe = _G[AllUICheckBoxes[i]]
			if AllUICheckBoxe then
				F.ReskinCheck(AllUICheckBoxe)
			else
				print('Ошибка Aurora: '..AllUICheckBoxes[i]..' не был найден.')
			end
		end
		
		for i = 1, 2 do
			F.StripTextures(_G['InterfaceOptionsFrameTab'..i])
		end
		
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
