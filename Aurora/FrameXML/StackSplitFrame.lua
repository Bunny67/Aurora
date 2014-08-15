local F, C = unpack(select(2, ...));

local tinsert = table.insert;

tinsert(C.Modules['Aurora'], function()
	F:CreateBD(StackSplitFrame);
	StackSplitFrame:GetRegions():SetTexture(nil);
	
	F:Reskin(StackSplitOkayButton);
	F:Reskin(StackSplitCancelButton);
end);