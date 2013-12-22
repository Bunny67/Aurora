local F, C = unpack(select(2, ...));

local _G = getfenv(0);

C.modules['Blizzard_BarbershopUI'] = function()
	BarberShopFrameBackground:Hide();
	F.SetBD(BarberShopFrame, 44, -75, -40, 44);
	
	for i = 1, 4 do
		local Prev = _G['BarberShopFrameSelector'..i..'Prev'];
		local Next = _G['BarberShopFrameSelector'..i..'Next'];
		
		F.ReskinArrow(Prev, 'left');
		F.ReskinArrow(Next, 'right');
	end
	
	BarberShopFrameMoneyFrame:GetRegions():Hide();
	
	F.Reskin(BarberShopFrameOkayButton);
	F.Reskin(BarberShopFrameCancelButton);
	F.Reskin(BarberShopFrameResetButton);
end