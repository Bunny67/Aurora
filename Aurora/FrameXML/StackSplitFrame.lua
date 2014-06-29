local F, C = unpack(select(2, ...));

local tinsert = table.insert;

tinsert(C.Modules['Aurora'], function()
	StackSplitFrame:GetRegions():Hide();
	F.CreateBD(StackSplitFrame);
	
	F.Reskin(StackSplitOkayButton);
	F.Reskin(StackSplitCancelButton);
end);