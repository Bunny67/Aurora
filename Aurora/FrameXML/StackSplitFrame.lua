local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	F:CreateBD(StackSplitFrame);
	StackSplitFrame:GetRegions():SetTexture(nil);
	
	F:Reskin(StackSplitOkayButton);
	F:Reskin(StackSplitCancelButton);
end);