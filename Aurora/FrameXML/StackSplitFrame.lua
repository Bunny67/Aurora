local F, C = unpack(select(2, ...));

tinsert(C.modules['Aurora'], function()
	StackSplitFrame:GetRegions():Hide();
	F.CreateBD(StackSplitFrame);
	
	F.Reskin(StackSplitOkayButton);
	F.Reskin(StackSplitCancelButton);
end);