local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;
local select = select;

local TexCoords = F.TexCoords;

C.Modules['Blizzard_ItemSocketingUI'] = function()
	F.SetBD(ItemSocketingFrame, 10, -13, -5, 29);
	ItemSocketingFramePortrait:Hide();
	
	select(2, ItemSocketingFrame:GetRegions()):SetTexture(nil);
	
	ItemSocketingScrollFrame:DisableDrawLayer('ARTWORK');
	F.ReskinScroll(ItemSocketingScrollFrameScrollBar);
	
	do
		local Socket, SocketIcon;
		
		for i = 1, MAX_NUM_SOCKETS  do
			Socket = _G['ItemSocketingSocket'..i];
			SocketIcon = _G['ItemSocketingSocket'..i..'IconTexture'];
			
			Socket:DisableDrawLayer('BACKGROUND');
			Socket:DisableDrawLayer('BORDER');
			
			Socket.bg = CreateFrame('Frame', nil, Socket)
			Socket.bg:SetAllPoints(Socket);
			Socket.bg:SetFrameLevel(Socket:GetFrameLevel() - 1);
			F.CreateBD(Socket.bg, .25);

			Socket.glow = CreateFrame('Frame', nil, Socket);
			Socket.glow:SetBackdrop({ edgeFile = C.Media.Glow, edgeSize = 5 });
			Socket.glow:SetPoint('TOPLEFT', -5, 5);
			Socket.glow:SetPoint('BOTTOMRIGHT', 5, -5);
			
			F.StyleButton(Socket);
			
			SocketIcon:SetTexCoord(unpack(TexCoords));
			
			_G['ItemSocketingSocket'..i..'BracketFrame']:Hide();
		end
	end
	
	F.Reskin(ItemSocketingSocketButton, nil, true);
	
	F.ReskinClose(ItemSocketingCloseButton, 'TOPRIGHT', ItemSocketingFrame, 'TOPRIGHT', -9, -17);
	
	hooksecurefunc('ItemSocketingFrame_Update', function()
		local Socet, Color;
		
		for i = 1, MAX_NUM_SOCKETS do
			Socket = _G['ItemSocketingSocket'..i];
			Color = GEM_TYPE_INFO[GetSocketTypes(i)];
			
			Socket.bg:SetBackdropBorderColor(Color.r, Color.g, Color.b);
			Socket.glow:SetBackdropBorderColor(Color.r, Color.g, Color.b);
		end
	end);
end