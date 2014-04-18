local F, C = unpack(select(2, ...));

local select = select;

tinsert(C.Modules['Aurora'], function()
	F.CreateBD(ReadyCheckFrame);
	
	ReadyCheckPortrait:Hide();
	
	select(2, ReadyCheckListenerFrame:GetRegions()):Hide();
	
	F.Reskin(ReadyCheckFrameYesButton);
	F.Reskin(ReadyCheckFrameNoButton);
	
	ReadyCheckFrame:HookScript('OnShow', function(self) if UnitIsUnit('player', self.initiator) then self:Hide(); end end);
end)