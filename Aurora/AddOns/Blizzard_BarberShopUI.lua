local F, C = unpack(select(2, ...));

local _G = getfenv(0);

C.Modules['Blizzard_BarbershopUI'] = function()
	F.SetBD(BarberShopFrame, 44, -75, -40, 44);
	BarberShopFrameBackground:Hide();
	
	do
		local Prev, Next;
		
		for i = 1, 4 do
			Prev = _G['BarberShopFrameSelector'..i..'Prev'];
			Next = _G['BarberShopFrameSelector'..i..'Next'];
			
			F.ReskinArrow(Prev, 'Left');
			F.ReskinArrow(Next, 'Right');
		end
	end
	
	BarberShopFrameMoneyFrame:GetRegions():SetTexture(nil);
	
	F.Reskin(BarberShopFrameOkayButton);
	F.Reskin(BarberShopFrameCancelButton);
	F.Reskin(BarberShopFrameResetButton);
end