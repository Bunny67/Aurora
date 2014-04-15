local F, C = unpack(select(2, ...));

local _G = getfenv(0);

C.modules['Blizzard_BarbershopUI'] = function()
	F.SetBD(BarberShopFrame, 44, -75, -40, 44);
	BarberShopFrameBackground:Hide();
	
	for i = 1, 4 do
		local Prev = _G['BarberShopFrameSelector'..i..'Prev'];
		local Next = _G['BarberShopFrameSelector'..i..'Next'];
		
		F.ReskinArrow(Prev, 'Left');
		F.ReskinArrow(Next, 'Right');
	end
	
	BarberShopFrameMoneyFrame:GetRegions():Hide();
	
	F.Reskin(BarberShopFrameOkayButton);
	F.Reskin(BarberShopFrameCancelButton);
	F.Reskin(BarberShopFrameResetButton);
end