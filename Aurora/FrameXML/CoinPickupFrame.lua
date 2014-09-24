local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	F:CreateBD(CoinPickupFrame);
	CoinPickupFrame:GetRegions():SetTexture(nil);
	
	F:Reskin(CoinPickupOkayButton);
	F:Reskin(CoinPickupCancelButton);
end);