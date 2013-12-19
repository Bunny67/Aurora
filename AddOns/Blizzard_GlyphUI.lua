local F, C = unpack(select(2, ...));

local _G = getfenv(0);

C.modules['Blizzard_GlyphUI'] = function()
	F.StripTextures(GlyphFrame, true);
	
	local BG = CreateFrame('Frame', nil, GlyphFrame);
	BG:SetPoint('TOPLEFT', 12, -14);
	BG:SetPoint('BOTTOMRIGHT', -33, 78);
	F.CreateBG(BG);
end