local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	F.CreateBD(GameMenuFrame);
	GameMenuFrameHeader:SetTexture(nil);
	
	F.Reskin(GameMenuButtonOptions);
	F.Reskin(GameMenuButtonSoundOptions);
	F.Reskin(GameMenuButtonUIOptions);
	F.Reskin(GameMenuButtonMacOptions);
	F.Reskin(GameMenuButtonKeybindings);
	F.Reskin(GameMenuButtonMacros);
	F.Reskin(GameMenuButtonRatings);
	F.Reskin(GameMenuButtonLogout);
	F.Reskin(GameMenuButtonQuit);
	F.Reskin(GameMenuButtonContinue);
end);