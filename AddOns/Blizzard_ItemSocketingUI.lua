local F, C = unpack(select(2, ...))

local _G = getfenv(0);

C.modules['Blizzard_ItemSocketingUI'] = function()
	F.StripTextures(_G['ItemSocketingFrame'], true);
	F.SetBD(_G['ItemSocketingFrame'], 10, -12, -4, 31);
	
	F.ReskinClose(_G['ItemSocketingCloseButton'], 'TOPRIGHT', ItemSocketingFrame, 'TOPRIGHT', -8, -16);
	
	F.StripTextures(_G['ItemSocketingScrollFrame']);
	F.ReskinScroll(_G['ItemSocketingScrollFrameScrollBar']);
	
	for i = 1, MAX_NUM_SOCKETS  do
		local Button = _G['ItemSocketingSocket'..i];
		local BracketFrame = _G['ItemSocketingSocket'..i..'BracketFrame'];
		local Background = _G['ItemSocketingSocket'..i..'Background'];
		local IconTexture = _G['ItemSocketingSocket'..i..'IconTexture'];
		
		F.StripTextures(Button);
		F.StyleButton(Button);
		F.CreateBD(Button);
		
		F.Kill(BracketFrame);
		F.Kill(Background);
		
		IconTexture:ClearAllPoints();
		IconTexture:SetPoint('TOPLEFT', 1, -1);
		IconTexture:SetPoint('BOTTOMRIGHT', -1, 1);
		IconTexture:SetTexCoord(unpack(F.TexCoords));
		
		_G['ItemSocketingFrame']:HookScript('OnUpdate', function(self)
			Types = GetSocketTypes(i);
			local Color = GEM_TYPE_INFO[Types];
			
			Button:SetBackdropColor(Color.r, Color.g, Color.b, 0.15);
			Button:SetBackdropBorderColor(Color.r, Color.g, Color.b);
		end)
	end
	
	F.Reskin(_G['ItemSocketingSocketButton'], nil, true);
end