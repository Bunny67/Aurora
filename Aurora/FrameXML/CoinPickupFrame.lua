local F, C = unpack(select(2, ...));

local tinsert = table.insert;

tinsert(C.Modules['Aurora'], function()
	F:CreateBD(CoinPickupFrame);
	CoinPickupFrame:GetRegions():SetTexture(nil);
	
	F:Reskin(CoinPickupOkayButton);
	F:Reskin(CoinPickupCancelButton);
end);