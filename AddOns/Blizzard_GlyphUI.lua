local F, C = unpack(select(2, ...))
-- СИМВОЛЫ
C.modules["Blizzard_GlyphUI"] = function()
	if AuroraConfig.GlyphUI then
	-- [[ Чистка текстур ]]
		local AllGlyphUIStripTextures = {'GlyphFrame'}
		for i = 1, #AllGlyphUIStripTextures do
		local AllGlyphUIStripTexture = _G[AllGlyphUIStripTextures[i]]
			if AllGlyphUIStripTexture then
				F.StripTextures(AllGlyphUIStripTexture, true)
			else
				print("Ошибка Aurora: "..AllGlyphUIStripTextures[i].." не был найден.")
			end
		end
		
		local bg = CreateFrame("Frame", nil, GlyphFrame)
		bg:SetPoint("TOPLEFT", 12, -14)
		bg:SetPoint("BOTTOMRIGHT", -33, 78)
		F.CreateBG(bg)
	end
end