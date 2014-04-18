local F, C = unpack(select(2, ...));

local _G = getfenv(0);

local TexCoords = F.TexCoords;

C.Modules['Blizzard_ItemSocketingUI'] = function()
	F.SetBD(ItemSocketingFrame, 10, -13, -5, 29);
	
	ItemSocketingFramePortrait:Hide();
	
	ItemSocketingScrollFrame:DisableDrawLayer('ARTWORK');
	F.ReskinScroll(ItemSocketingScrollFrameScrollBar);
	
	for i = 1, MAX_NUM_SOCKETS  do
		local socket = _G['ItemSocketingSocket'..i];
		local socketTexture = _G['ItemSocketingSocket'..i..'IconTexture'];
		
		socket:DisableDrawLayer('BACKGROUND');
		socket:DisableDrawLayer('BORDER');
		
		socket.bg = CreateFrame('Frame', nil, socket)
		socket.bg:SetAllPoints(socket);
		socket.bg:SetFrameLevel(socket:GetFrameLevel() - 1);
		F.CreateBD(socket.bg, .25);

		socket.glow = CreateFrame('Frame', nil, socket);
		socket.glow:SetBackdrop({ edgeFile = C.Media.Glow, edgeSize = 5 });
		socket.glow:SetPoint('TOPLEFT', -5, 5);
		socket.glow:SetPoint('BOTTOMRIGHT', 5, -5);
		
		F.StyleButton(socket);
		
		socketTexture:SetTexCoord(unpack(TexCoords));
		
		_G['ItemSocketingSocket'..i..'BracketFrame']:Hide();
	end
	
	F.Reskin(ItemSocketingSocketButton, nil, true);
	
	F.ReskinClose(ItemSocketingCloseButton, 'TOPRIGHT', ItemSocketingFrame, 'TOPRIGHT', -9, -17);
	
	hooksecurefunc('ItemSocketingFrame_Update', function()
		for i = 1, MAX_NUM_SOCKETS do
			local socket = _G['ItemSocketingSocket'..i];
			local color = GEM_TYPE_INFO[GetSocketTypes(i)];
			
			socket.bg:SetBackdropBorderColor(color.r, color.g, color.b);
			socket.glow:SetBackdropBorderColor(color.r, color.g, color.b);
		end
	end);
end