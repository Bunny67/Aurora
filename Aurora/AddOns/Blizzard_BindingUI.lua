local F, C = unpack(select(2, ...));

local _G = getfenv(0);

C.Modules['Blizzard_BindingUI'] = function()
	F.SetBD(KeyBindingFrame, 2, 0, -42, 12);
	
	KeyBindingFrame:DisableDrawLayer('BACKGROUND');
	KeyBindingFrameOutputText:SetDrawLayer('OVERLAY');
	KeyBindingFrameHeader:SetTexture('');
	
	F.ReskinCheck(KeyBindingFrameCharacterButton);
	
	for i = 1, KEY_BINDINGS_DISPLAYED do
		local Key1Button = _G['KeyBindingFrameBinding'..i..'Key1Button'];
		local Key2Button = _G['KeyBindingFrameBinding'..i..'Key2Button'];
		
		F.Reskin(Key1Button, nil, true);
		F.Reskin(Key2Button, nil, true);
	end
	
	F.ReskinScroll(KeyBindingFrameScrollFrameScrollBar);
	
	F.Reskin(KeyBindingFrameDefaultButton);
	F.Reskin(KeyBindingFrameUnbindButton);
	F.Reskin(KeyBindingFrameOkayButton);
	F.Reskin(KeyBindingFrameCancelButton);
end