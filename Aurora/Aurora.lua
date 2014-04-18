--   _  _   _ ___  ___  ___   _   --
--  /,\| | | | , |/ _ \| , | /,\  --
-- / _ | |_| |   \ (_) |   \/ _ \ --
--/_/ \_\__,_|_|\_\___/|_|\_\/ \_\--
local alpha, useButtonGradientColour
local addon, core = ...

core[1] = {}
core[2] = {}

Aurora = core

AuroraConfig = {}

local F, C = unpack(select(2, ...))

local _G = getfenv(0);
local select = select;
local pairs = pairs;
local pcall = pcall;
local type = type;

C.ClassColors = {
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

C.Media = {
	['ArrowUp'] = [[Interface\AddOns\Aurora\Media\Arrow-Up-Active]],
	['ArrowDown'] = [[Interface\AddOns\Aurora\Media\Arrow-Down-Active]],
	['ArrowLeft'] = [[Interface\AddOns\Aurora\Media\Arrow-Left-Active]],
	['ArrowRight'] = [[Interface\AddOns\Aurora\Media\Arrow-Right-Active]],
	['Backdrop'] = [[Interface\BUTTONS\WHITE8X8]],
	['Checked'] = [[Interface\AddOns\Aurora\Media\CheckButtonHilight]],
	['Font'] = [[Interface\AddOns\Aurora\Media\Font.ttf]],						-- Шрифт
	['Glow'] = [[Interface\AddOns\Aurora\Media\Glow]],
	['Gradient'] = [[Interface\AddOns\Aurora\Media\Gradient]],
	['RoleIcons'] = [[Interface\Addons\Aurora\Media\UI-LFG-ICON-ROLES]]
}

C.Defaults = {
	['alpha'] = 0.5,

	["buttonGradientColour"] = {.3, .3, .3, .3},
	["buttonSolidColour"] = {.2, .2, .2, 1},
	["useButtonGradientColour"] = true,
	["useCustomColour"] = false,
		["customColour"] = {r = 1, g = 1, b = 1},
		
	['enableFont'] = true,
	['QualityColour'] = true,
	
	['Font'] = true,																-- Шрифт
	['Bags'] = true,																-- Сумки
	['ChatBubbles'] = true, 														-- Сообщение в облачках
	['Tooltips'] = true,															-- Подсказки
	['Maps'] = true,																-- Карта мира
	['Loot'] = true,																-- Добыча
}

C.Frames = {}

-- [[ Functions ]]
_, F.Class = UnitClass('player')

if CUSTOM_CLASS_COLORS then
	C.ClassColors = CUSTOM_CLASS_COLORS
end

local r, g, b = C.ClassColors[F.Class].r, C.ClassColors[F.Class].g, C.ClassColors[F.Class].b

F.TexCoords = {.08, .92, .08, .92};
F.dummy = function() end;

F.StyleButton = function(Button, NoHover, NoPushed, NoChecked)
	if Button.SetHighlightTexture and not Button.Hover and not NoHover then
		local Hover = Button:CreateTexture('Frame', nil, self);
		Hover:SetTexture(r, g, b, .25);
		Hover:SetPoint('TOPLEFT', 1, -1);
		Hover:SetPoint('BOTTOMRIGHT', -1, 1);
		Button.Hover = Hover;
		Button:SetHighlightTexture(Hover);
	end
	
	if Button.SetPushedTexture and not Button.Pushed and not NoPushed then
		local Pushed = Button:CreateTexture('Frame', nil, self);
		Pushed:SetTexture(0.9, 0.8, 0.1, .25);
		Pushed:SetPoint('TOPLEFT', 1, -1);
		Pushed:SetPoint('BOTTOMRIGHT', -1, 1);
		Button.Pushed = Pushed;
		Button:SetPushedTexture(Pushed);
	end
	
	if Button.SetCheckedTexture and not Button.Checked and not NoChecked then
		local Checked = Button:CreateTexture('Frame', nil, self);
		Checked:SetTexture(1, 1, 1);
		Checked:SetPoint('TOPLEFT', 1, -1);
		Checked:SetPoint('BOTTOMRIGHT', -1, 1);
		Checked:SetAlpha(.25);
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
	Frame:SetBackdrop({ bgFile = C.Media.Backdrop, edgeFile = C.Media.Backdrop, edgeSize = 1 });
	Frame:SetBackdropColor(0, 0, 0, A or alpha);
	Frame:SetBackdropBorderColor(0, 0, 0);
	
	if ( not A ) then tinsert(C.Frames, Frame); end
end

F.CreateBG = function(Frame)
	local f = Frame;
	if ( Frame:GetObjectType() == 'Texture' ) then f = Frame:GetParent(); end

	local BG = f:CreateTexture(nil, 'BACKGROUND');
	BG:SetPoint('TOPLEFT', Frame, -1, 1);
	BG:SetPoint('BOTTOMRIGHT', Frame, 1, -1);
	BG:SetTexture(C.Media.Backdrop)
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
	Gradient:SetTexture(useButtonGradientColour and C.Media.Gradient or C.Media.Backdrop);
	Gradient:SetVertexColor(buttonR, buttonG, buttonB, buttonA);

	return Gradient;
end

local function ColourButton(Frame)
	if ( not Frame:IsEnabled() ) then return; end

	if ( useButtonGradientColour ) then
		Frame:SetBackdropColor(r, g, b, .3);
	else
		Frame.Gradient:SetVertexColor(r / 4, g / 4, b / 4);
	end

	Frame:SetBackdropBorderColor(r, g, b);
end

local function ClearButton(Frame)
	if ( useButtonGradientColour ) then
		Frame:SetBackdropColor(0, 0, 0, 0);
	else
		Frame.Gradient:SetVertexColor(buttonR, buttonG, buttonB, buttonA);
	end

	Frame:SetBackdropBorderColor(0, 0, 0);
end

F.Reskin = function(Frame, NoHighlight, Strip)
	if ( Frame:GetName() ) then
		local Left = _G[Frame:GetName()..'Left'];
		local Middle = _G[Frame:GetName()..'Middle'];
		local Right = _G[Frame:GetName()..'Right'];


		if ( Left ) then Left:SetAlpha(0); end
		if ( Middle ) then Middle:SetAlpha(0); end
		if ( Right ) then Right:SetAlpha(0); end
	end

	if ( Frame.Left ) then Frame.Left:SetAlpha(0); end
	if ( Frame.Right ) then Frame.Right:SetAlpha(0); end	
	if ( Frame.Middle ) then Frame.Middle:SetAlpha(0); end
	if ( Frame.SetNormalTexture ) then Frame:SetNormalTexture(''); end	
	if ( Frame.SetHighlightTexture ) then Frame:SetHighlightTexture(''); end
	if ( Frame.SetPushedTexture ) then Frame:SetPushedTexture(''); end	
	if ( Frame.SetDisabledTexture ) then Frame:SetDisabledTexture(''); end
	
	if ( Strip ) then F.StripTextures(Frame, true); end
	
	F.CreateBD(Frame, 0);

	Frame.Gradient = F.CreateGradient(Frame);

	if ( not NoHighlight ) then
		Frame:HookScript('OnEnter', ColourButton);
 		Frame:HookScript('OnLeave', ClearButton);
	end
end

F.ReskinTab = function(Frame)
	Frame:DisableDrawLayer('BACKGROUND');

	local BG = CreateFrame('Frame', nil, Frame);
	BG:SetPoint('TOPLEFT', 8, -3);
	BG:SetPoint('BOTTOMRIGHT', -8, 3);
	BG:SetFrameLevel(Frame:GetFrameLevel() - 1);
	F.CreateBD(BG);

	Frame:SetHighlightTexture(C.Media.Backdrop);
	Frame:GetHighlightTexture():ClearAllPoints();
	Frame:GetHighlightTexture():SetPoint('TOPLEFT', 9, -4);
	Frame:GetHighlightTexture():SetPoint('BOTTOMRIGHT', -9, 4);
	Frame:GetHighlightTexture():SetVertexColor(r, g, b, .25);
end

local function ColourScroll(Frame)
	if ( Frame:IsEnabled() ) then
		Frame.Texture:SetVertexColor(r, g, b)
	end
end

local function ClearScroll(Frame)
	Frame.Texture:SetVertexColor(1, 1, 1)
end

F.ReskinScroll = function(Frame)
	local Scroll = Frame:GetName();
	
	if ( _G[Scroll..'Track'] ) then _G[Scroll..'Track']:Hide(); end
	if ( _G[Scroll..'BG'] ) then _G[Scroll..'BG']:Hide(); end
	if ( _G[Scroll..'Top'] ) then _G[Scroll..'Top']:Hide(); end
	if ( _G[Scroll..'Middle'] ) then _G[Scroll..'Middle']:Hide(); end
	if ( _G[Scroll..'Bottom'] ) then _G[Scroll..'Bottom']:Hide(); end

	_G[Scroll..'ThumbTexture']:SetAlpha(0);
	_G[Scroll..'ThumbTexture']:SetWidth(17);

	_G[Scroll..'ThumbTexture'].DB = CreateFrame('Frame', nil, Frame)
	_G[Scroll..'ThumbTexture'].DB:SetPoint('TOPLEFT', _G[Scroll..'ThumbTexture'], 0, -2);
	_G[Scroll..'ThumbTexture'].DB:SetPoint('BOTTOMRIGHT', _G[Scroll..'ThumbTexture'], 0, 4);
	F.CreateBD(_G[Scroll..'ThumbTexture'].DB, 0);

	local Gradient = F.CreateGradient(Frame)
	Gradient:SetPoint('TOPLEFT', _G[Scroll..'ThumbTexture'].DB, 1, -1);
	Gradient:SetPoint('BOTTOMRIGHT', _G[Scroll..'ThumbTexture'].DB, -1, 1);

	_G[Scroll..'ScrollUpButton']:SetWidth(17);
	_G[Scroll..'ScrollDownButton']:SetWidth(17);

	F.Reskin(_G[Scroll..'ScrollUpButton'], true);
	F.Reskin(_G[Scroll..'ScrollDownButton'], true);

	_G[Scroll..'ScrollUpButton']:SetDisabledTexture(C.Media.Backdrop);
	_G[Scroll..'ScrollUpButton']:GetDisabledTexture():SetVertexColor(0, 0, 0, .4);
	_G[Scroll..'ScrollUpButton']:GetDisabledTexture():SetDrawLayer('OVERLAY');

	_G[Scroll..'ScrollDownButton']:SetDisabledTexture(C.Media.Backdrop);
	_G[Scroll..'ScrollDownButton']:GetDisabledTexture():SetVertexColor(0, 0, 0, .4);
	_G[Scroll..'ScrollDownButton']:GetDisabledTexture():SetDrawLayer('OVERLAY');

	local UpTexture = _G[Scroll..'ScrollUpButton']:CreateTexture(nil, 'ARTWORK');
	UpTexture:SetTexture(C.Media.ArrowUp);
	UpTexture:SetSize(8, 8);
	UpTexture:SetPoint('CENTER');
	UpTexture:SetVertexColor(1, 1, 1);
	_G[Scroll..'ScrollUpButton'].Texture = UpTexture;

	local DownTexture = _G[Scroll..'ScrollDownButton']:CreateTexture(nil, 'ARTWORK');
	DownTexture:SetTexture(C.Media.ArrowDown);
	DownTexture:SetSize(8, 8);
	DownTexture:SetPoint('CENTER');
	DownTexture:SetVertexColor(1, 1, 1);
	_G[Scroll..'ScrollDownButton'].Texture = DownTexture;

	_G[Scroll..'ScrollUpButton']:HookScript('OnEnter', ColourScroll);
	_G[Scroll..'ScrollUpButton']:HookScript('OnLeave', ClearScroll);
	_G[Scroll..'ScrollDownButton']:HookScript('OnEnter', ColourScroll);
	_G[Scroll..'ScrollDownButton']:HookScript('OnLeave', ClearScroll);
end

local function ColourArrow(Frame)
	if ( Frame:IsEnabled() ) then
		Frame.Texture:SetVertexColor(r, g, b);
	end
end

local function ClearArrow(Frame)
	Frame.Texture:SetVertexColor(1, 1, 1);
end

F.ColourArrow = ColourArrow;
F.ClearArrow = ClearArrow;

F.ReskinDropDown = function(Frame)
	local Button = _G[Frame:GetName()..'Button'];
	
	F.StripTextures(Frame);
	
	Button:SetSize(20, 20);
	Button:ClearAllPoints();
	Button:SetPoint('RIGHT', -18, 2);

	F.Reskin(Button, true);

	Button:SetDisabledTexture(C.Media.Backdrop);
	Button:GetDisabledTexture():SetVertexColor(0, 0, 0, .4);
	Button:GetDisabledTexture():SetDrawLayer('OVERLAY');
	Button:GetDisabledTexture():SetAllPoints();

	local Texture = Button:CreateTexture(nil, 'ARTWORK');
	Texture:SetTexture(C.Media.ArrowDown);
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
	if ( Frame:IsEnabled() ) then
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

	if ( not a1 ) then Frame:SetPoint('TOPRIGHT', -6, -6); else Frame:ClearAllPoints(); Frame:SetPoint(a1, p, a2, x, y); end

	Frame:SetNormalTexture('');
	Frame:SetHighlightTexture('');
	Frame:SetPushedTexture('');
	Frame:SetDisabledTexture('');

	F.CreateBD(Frame, 0);

	F.CreateGradient(Frame);

	Frame:SetDisabledTexture(C.Media.Backdrop);
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
	local Input = Frame:GetName();
	
	if ( _G[Input..'Left'] ) then _G[Input..'Left']:Hide(); end
	if ( _G[Input..'Middle'] ) then _G[Input..'Middle']:Hide(); end
	if ( _G[Input..'Mid'] ) then _G[Input..'Mid']:Hide(); end
	if ( _G[Input..'Right'] ) then _G[Input..'Right']:Hide(); end
	
	local BD = CreateFrame('Frame', nil, Frame);
	BD:SetPoint('TOPLEFT', -2, 0);
	BD:SetPoint('BOTTOMRIGHT');
	BD:SetFrameLevel(Frame:GetFrameLevel() - 1);
	F.CreateBD(BD, 0);
	
	if Input and Input:find('Silver') or Input:find('Copper') then
		BD:SetPoint('BOTTOMRIGHT', -10, 0);
	end

	local Gradient = F.CreateGradient(Frame);
	Gradient:SetPoint('TOPLEFT', BD, 1, -1);
	Gradient:SetPoint('BOTTOMRIGHT', BD, -1, 1);

	if ( Height ) then Frame:SetHeight(Height); end
	if ( Width ) then Frame:SetWidth(Width); end
end

F.ReskinArrow = function(Frame, Direction)
	Frame:SetSize(18, 18);
	F.Reskin(Frame, true);

	Frame:SetDisabledTexture(C.Media.Backdrop);
	Frame:GetDisabledTexture():SetVertexColor(0, 0, 0, .3);
	Frame:GetDisabledTexture():SetDrawLayer('OVERLAY');

	local Texture = Frame:CreateTexture(nil, 'ARTWORK');
	Texture:SetTexture([[Interface\AddOns\Aurora\Media\Arrow-]]..Direction..[[-Active]]);
	Texture:SetSize(8, 8);
	Texture:SetPoint('CENTER');
	Frame.Texture = Texture;

	Frame:HookScript('OnEnter', ColourArrow);
	Frame:HookScript('OnLeave', ClearArrow);
end

F.ReskinCheck = function(Frame)
	Frame:SetNormalTexture('');
	Frame:SetPushedTexture('');
	Frame:SetHighlightTexture(C.Media.Backdrop);
	
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
	Frame:SetCheckedTexture(C.Media.Backdrop);
	
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
	BD:SetFrameLevel(Frame:GetFrameLevel() - 1);
	F.CreateBD(BD, 0);

	F.CreateGradient(BD);

	local Slider = select(4, Frame:GetRegions());
	Slider:SetTexture([[Interface\CastingBar\UI-CastingBar-Spark]]);
	Slider:SetBlendMode('ADD');
end

F.ReskinHeader = function(Frame)
	if ( Frame:GetName() ) then
		local Left = _G[Frame:GetName()..'Left'];
		local Middle = _G[Frame:GetName()..'Middle'];
		local Right = _G[Frame:GetName()..'Right'];


		if ( Left ) then Left:SetAlpha(0); end
		if ( Middle ) then Middle:SetAlpha(0); end
		if ( Right ) then Right:SetAlpha(0); end
	end
	
	Frame:SetHighlightTexture(C.Media.Backdrop);
	local Highlight = Frame:GetHighlightTexture();
	Highlight:ClearAllPoints();
	Highlight:SetPoint('TOPLEFT', 3, -4);
	Highlight:SetPoint('BOTTOMRIGHT', -2, 4);
	Highlight:SetVertexColor(r, g, b, .25);
	
	local HeaderBG = CreateFrame('Frame', nil, Frame);
	HeaderBG:SetPoint('TOPLEFT', 2, -3);
	HeaderBG:SetPoint('BOTTOMRIGHT', -1, 3);
	HeaderBG:SetFrameLevel(Frame:GetFrameLevel() - 1);
	F.CreateBD(HeaderBG, 0);
	F.CreateGradient(HeaderBG);
	
	return Frame;
end

local function ColourExpandOrCollapse(Frame)
	if ( Frame:IsEnabled() ) then
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

	F.Reskin(Frame, true);
	Frame.SetNormalTexture = F.dummy;

	Frame.Minus = Frame:CreateTexture(nil, 'OVERLAY');
	Frame.Minus:SetSize(7, 1);
	Frame.Minus:SetPoint('CENTER');
	Frame.Minus:SetTexture(C.Media.Backdrop);
	Frame.Minus:SetVertexColor(1, 1, 1);

	Frame.Plus = Frame:CreateTexture(nil, 'OVERLAY');
	Frame.Plus:SetSize(1, 7);
	Frame.Plus:SetPoint('CENTER');
	Frame.Plus:SetTexture(C.Media.Backdrop);
	Frame.Plus:SetVertexColor(1, 1, 1);

	Frame:HookScript('OnEnter', ColourExpandOrCollapse);
	Frame:HookScript('OnLeave', ClearExpandOrCollapse);
end

F.SetBD = function(Frame, x1, y1, x2, y2)
	local xOfs1 = x1 or 0;
	local yOfs1 = y1 or 0;
	local xOfs2 = x2 or 0;
	local yOfs2 = y2 or 0;
	
	local PTR = true;
	
	if not PTR then
		F.StripTextures(Frame);
	end
	
	local BD = CreateFrame('Frame', nil, Frame);
	BD:ClearAllPoints();
	if ( xOfs1 == 0 and yOfs1 == 0 and xOfs2 == 0 and yOfs2 == 0 ) then
	 	BD:SetAllPoints(Frame);
	else
		BD:SetPoint('TOPLEFT', Frame, 'TOPLEFT', xOfs1, yOfs1);
		BD:SetPoint('BOTTOMRIGHT', Frame, 'BOTTOMRIGHT', xOfs2, yOfs2);
	end
	
	F.CreateBD(BD);
	
	local Success, Err = pcall(LowerFrameLevel, BD);
	if ( not Success ) then RaiseFrameLevel(Frame); end
	
	return BD
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

	f:SetNormalTexture(C.Media.Backdrop)
	local nt = f:GetNormalTexture()

	nt:SetPoint("TOPLEFT", 3, -3)
	nt:SetPoint("BOTTOMRIGHT", -3, 3)

	bg:SetTexture(0, 0, 0)
	bg:SetPoint("TOPLEFT", 2, -2)
	bg:SetPoint("BOTTOMRIGHT", -2, 2)
end

F.ColourQuality = function(Button, ID)
	local Quality, Texture, _;
	local Quest = _G[Button:GetName()..'IconQuestTexture'];

	if ( ID ) then
		Quality, _, _, _, _, _, _, Texture = select(3, GetItemInfo(ID));
	end

	if ( Texture ) then
		local r, g, b;

		if ( Quest and Quest:IsShown() ) then
			r, g, b = 1, 0, 0;
		else
			r, g, b = GetItemQualityColor(Quality);
			
			if ( r == 1 and g == 1 ) then r, g, b = 0, 0, 0; end
		end

		Button:SetBackdropBorderColor(r, g, b);
	else
		Button:SetBackdropBorderColor(0, 0, 0);
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

C.Modules = {}
C.Modules['Aurora'] = {}

local Skin = CreateFrame('Frame', nil, UIParent)
Skin:RegisterEvent('ADDON_LOADED')
Skin:SetScript('OnEvent', function(self, event, addon)
	if addon == "Aurora" then
		-- [[ Load Variables ]]

		-- remove deprecated or corrupt variables
		for key, value in pairs(AuroraConfig) do
			if C.Defaults[key] == nil then
				AuroraConfig[key] = nil
			end
		end

		-- load or init variables
		for key, value in pairs(C.Defaults) do
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

	for module, moduleFunc in pairs(C.Modules) do
		if type(moduleFunc) == "function" then
			if module == addon then
				moduleFunc()
			end
		elseif type(moduleFunc) == "table" then
			if module == addon then
				for _, moduleFunc in pairs(C.Modules[module]) do
					moduleFunc()
				end
			end
		end
	end

	if addon == 'Aurora' then
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
				self.Plus:Show()
			else
				self.Plus:Hide()
			end
		end)
		
		local AllUISetBD = {'GameMenuFrame', 'VideoOptionsFrame', 'AudioOptionsFrame', 'InterfaceOptionsFrame'}
		for i = 1, #AllUISetBD do
			F.SetBD(_G[AllUISetBD[i]])
		end
	end
end)

local f = CreateFrame('Frame');
f:RegisterEvent('PLAYER_LOGIN')
f:SetScript('OnEvent', function() SetCVar('useUiScale', 1); SetCVar('uiScale', 768/string.match(({GetScreenResolutions()})[GetCurrentResolution()], '%d+x(%d+)')); end);

local Delay = CreateFrame('Frame')
Delay:RegisterEvent('PLAYER_ENTERING_WORLD')
Delay:SetScript('OnEvent', function()
	Delay:UnregisterEvent('PLAYER_ENTERING_WORLD')
	-- Сумки
	if AuroraConfig.Bags == true and not(IsAddOnLoaded('Baggins') or IsAddOnLoaded('Stuffing') or IsAddOnLoaded('Combuctor') or IsAddOnLoaded('cargBags') or IsAddOnLoaded('famBags') or IsAddOnLoaded('ArkInventory') or IsAddOnLoaded('Bagnon')) then
		for i = 1, 12 do
			local Container = _G['ContainerFrame'..i];
			local ContainerCloseButton = _G['ContainerFrame'..i..'CloseButton'];
			
			F.StripTextures(Container, true);
			F.SetBD(Container, 1, -1, -1, 1);
			
			F.ReskinClose(ContainerCloseButton, 'TOPRIGHT', Container, 'TOPRIGHT', -5, -5);

			for k = 1, MAX_CONTAINER_ITEMS do
				local ContainerItem = 'ContainerFrame'..i..'Item'..k;
				local ContainerItemButton = _G[ContainerItem];
				local ContainerItemIconTexture = _G[ContainerItem..'IconTexture'];

				_G[ContainerItem..'IconQuestTexture']:SetAlpha(0);

				F.StripTextures(ContainerItemButton);
				F.StyleButton(ContainerItemButton);
				F.CreateBD(ContainerItemButton, .25);
				
				ContainerItemIconTexture:SetTexCoord(unpack(F.TexCoords));
				ContainerItemIconTexture:SetPoint('TOPLEFT', 1, -1);
				ContainerItemIconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
			end
			
			if i == 1 then
				F.StripTextures(BackpackTokenFrame);
				
				for i = 1, MAX_WATCHED_TOKENS do
					local TokenIcon = _G['BackpackTokenFrameToken'..i..'Icon'];
					
					TokenIcon:SetTexCoord(unpack(F.TexCoords));
				end
			end
		end
		
		if ( AuroraConfig.QualityColour ) then
			hooksecurefunc('ContainerFrame_Update', function(self)
				local ID = self:GetID();
				local Name = self:GetName();

				for i = 1, self.size, 1 do
					local Button = _G[Name..'Item'..i];
					local ItemID = GetContainerItemID(ID, Button:GetID());
					
					F.ColourQuality(Button, ItemID);
				end
			end);
		end
		
		F.StripTextures(BankFrame, true);
		F.SetBD(BankFrame, 10, -11, -25, 91);
		
		F.ReskinClose(BankCloseButton, 'TOPRIGHT', BankFrame, 'TOPRIGHT', -29, -15);
		
		F.Reskin(BankFramePurchaseButton);

		for i = 1, 28 do
			local BankItem = 'BankFrameItem'..i;
			local BankItemButton = _G[BankItem];
			local BankItemIconTexture = _G[BankItem..'IconTexture'];

			_G[BankItem..'IconQuestTexture']:SetAlpha(0);
			
			F.StripTextures(BankItemButton);
			F.StyleButton(BankItemButton);
			F.CreateBD(BankItemButton, .25);
			
			BankItemIconTexture:SetPoint('TOPLEFT', 1, -1);
			BankItemIconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
			BankItemIconTexture:SetTexCoord(unpack(F.TexCoords));
		end

		for i = 1, 7 do
			local BankFrameBag = _G['BankFrameBag'..i];
			local BankFrameBagIconTexture = _G['BankFrameBag'..i..'IconTexture'];
			
			F.StripTextures(BankFrameBag);
			F.StyleButton(BankFrameBag);
			F.CreateBD(BankFrameBag, .25);
			
			BankFrameBagIconTexture:SetPoint('TOPLEFT', 1, -1);
			BankFrameBagIconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
			BankFrameBagIconTexture:SetTexCoord(unpack(F.TexCoords));
		end
		
		if ( AuroraConfig.QualityColour ) then
			hooksecurefunc('BankFrameItemButton_Update', function(self)
				F.ColourQuality(self, GetInventoryItemID('player', self:GetInventorySlot()));
			end);
		end
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
					region:SetFont(C.Media.Font, 13)
				end
			end

			frame:SetBackdrop({
				bgFile = C.Media.Backdrop,
				edgeFile = C.Media.Backdrop,
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

		local Backdrop = {bgFile = C.Media.Backdrop, edgeFile = C.Media.Backdrop, edgeSize = 1}
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
		StatusBar:SetStatusBarTexture(C.Media.Backdrop)

		local StatusBarTexture = GameTooltipStatusBar:CreateTexture(nil, 'ARTWORK')
		StatusBarTexture:SetHeight(1)
		StatusBarTexture:SetPoint('BOTTOMLEFT', 0, 5)
		StatusBarTexture:SetPoint('BOTTOMRIGHT', 0, 5)
		StatusBarTexture:SetTexture(C.Media.Backdrop)
		StatusBarTexture:SetVertexColor(0, 0, 0)

		F.CreateBD(FriendsTooltip)
	end
	
	if AuroraConfig.Loot == true and not(IsAddOnLoaded('Butsu') or IsAddOnLoaded('LovelyLoot') or IsAddOnLoaded('XLoot')) then
		F.StripTextures(LootFrame, true);
		F.SetBD(LootFrame, 12, -14, -68, 5);
		
		F.ReskinClose(LootCloseButton, 'TOPRIGHT', LootFrame, 'TOPRIGHT', -72, -18);

		hooksecurefunc('LootFrame_UpdateButton', function(index)
			local ButtonIconTexture = _G['LootButton'..index..'IconTexture'];

			if not ButtonIconTexture.BG then
				local Button = _G['LootButton'..index];
				local ButtonNameFrame = _G['LootButton'..index..'NameFrame'];
				
				Button:SetNormalTexture('');
				Button:SetPushedTexture('');
				Button:GetHighlightTexture():SetTexture(C.r, C.g, C.b, .25);
				
				local BD = CreateFrame("Frame", nil, Button);
				BD:SetPoint('TOPLEFT');
				BD:SetPoint('BOTTOMRIGHT', 114, 0);
				BD:SetFrameLevel(Button:GetFrameLevel() - 1);
				F.CreateBD(BD, .25);
				
				ButtonNameFrame:Hide();
				
				ButtonIconTexture:SetTexCoord(unpack(F.TexCoords));
				ButtonIconTexture.BG = F.CreateBG(ButtonIconTexture);
			end
		end);
		
		LootFrameDownButton:ClearAllPoints();
		LootFrameDownButton:SetPoint('BOTTOMRIGHT', -84, 16);
		LootFramePrev:ClearAllPoints();
		LootFramePrev:SetPoint('LEFT', LootFrameUpButton, 'RIGHT', 4, 0);
		LootFrameNext:ClearAllPoints();
		LootFrameNext:SetPoint('RIGHT', LootFrameDownButton, 'LEFT', -4, 0);
		
		F.ReskinArrow(LootFrameUpButton, 'Up');
		F.ReskinArrow(LootFrameDownButton, 'Down');
	end
end)
