local F, C = unpack(select(2, ...));

local _G = getfenv(0);

C.Modules['Blizzard_BindingUI'] = function()
	F.SetBD(KeyBindingFrame, 2, 0, -42, 12);
	
	KeyBindingFrame:DisableDrawLayer('BACKGROUND');
	KeyBindingFrameOutputText:SetDrawLayer('OVERLAY');
	KeyBindingFrameHeader:SetTexture(nil);
	
	do
		local Key1Button, Key2Button;
		
		for i = 1, KEY_BINDINGS_DISPLAYED do
			Key1Button = _G['KeyBindingFrameBinding'..i..'Key1Button'];
			Key2Button = _G['KeyBindingFrameBinding'..i..'Key2Button'];
			
			F.Reskin(Key1Button, nil, true);
			F.Reskin(Key2Button, nil, true);
			Key2Button:SetPoint('LEFT', Key1Button, 'RIGHT', 1, 0);
		end
	end
	
	F.ReskinScroll(KeyBindingFrameScrollFrameScrollBar);
	
	F.ReskinCheck(KeyBindingFrameCharacterButton);
	
	F.Reskin(KeyBindingFrameDefaultButton);
	F.Reskin(KeyBindingFrameCancelButton);
	F.Reskin(KeyBindingFrameOkayButton);
	KeyBindingFrameOkayButton:SetPoint('RIGHT', KeyBindingFrameCancelButton, 'LEFT', -1, 0);
	F.Reskin(KeyBindingFrameUnbindButton);
	KeyBindingFrameUnbindButton:SetPoint('RIGHT', KeyBindingFrameOkayButton, 'LEFT', -1, 0);
end