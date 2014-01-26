local F, C = unpack(select(2, ...));

C.modules['Blizzard_GlyphUI'] = function()
	local r, g, b = C.r, C.g, C.b;
	
	F.StripTextures(GlyphFrame, true);
	
	hooksecurefunc('GlyphFrameGlyph_UpdateSlot', function(self)
		self.glyph:SetTexCoord(unpack(F.TexCoords));
		self.setting:Hide();
		self.highlight:SetTexture('');
		self.background:Hide();
		self.ring:Hide();
		
		if ( not self.bg ) then
			self.bg = CreateFrame('Frame', nil, self);
			self.bg:SetPoint('TOPLEFT', self.glyph, -1, 1);
			self.bg:SetPoint('BOTTOMRIGHT', self.glyph, 1, -1);
			self.bg:SetFrameLevel(self:GetFrameLevel() - 1);
			
			F.CreateBD(self.bg, .25);
		end
	end);
	--[[
	hooksecurefunc('GlyphFrameGlyph_OnUpdate', function(self)
		local id = self:GetID();
		
		if GlyphMatchesSocket(id) then
			self.bg:SetBackdropBorderColor(r, g, b);
		else
			self.bg:SetBackdropBorderColor(0, 0, 0);
		end
	end);]]
end