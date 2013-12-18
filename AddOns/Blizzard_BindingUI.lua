local F, C = unpack(select(2, ...))

local _G = getfenv(0);

C.modules["Blizzard_BindingUI"] = function()
	F.StripTextures(_G['KeyBindingFrame']);
	F.SetBD(_G['KeyBindingFrame'], 2, 0, -42, 12);
	
	F.ReskinCheck(_G['KeyBindingFrameCharacterButton']);
	
	for i = 1, KEY_BINDINGS_DISPLAYED do
		local Key1Button = _G["KeyBindingFrameBinding"..i.."Key1Button"];
		local Key2Button = _G["KeyBindingFrameBinding"..i.."Key2Button"];
		
		F.Reskin(Key1Button, nil, true);
		F.Reskin(Key2Button, nil, true);
	end
	
	F.ReskinScroll(_G['KeyBindingFrameScrollFrameScrollBar']);
	
	F.Reskin(_G['KeyBindingFrameDefaultButton']);
	F.Reskin(_G['KeyBindingFrameUnbindButton']);
	F.Reskin(_G['KeyBindingFrameOkayButton']);
	F.Reskin(_G['KeyBindingFrameCancelButton']);
end