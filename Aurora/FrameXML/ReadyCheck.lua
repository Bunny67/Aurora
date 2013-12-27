local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.CreateBD(ReadyCheckFrame);
	
	F.Kill(ReadyCheckPortrait);
	select(2, ReadyCheckListenerFrame:GetRegions()):Hide();
	
	F.Reskin(ReadyCheckFrameYesButton);
	F.Reskin(ReadyCheckFrameNoButton);
end)