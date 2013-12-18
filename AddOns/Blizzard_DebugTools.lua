local F, C = unpack(select(2, ...));

local _G = getfenv(0);

C.modules['Blizzard_DebugTools'] = function()
	local Texures = { 'TopLeft', 'TopRight', 'Top', 'BottomLeft', 'BottomRight', 'Bottom', 'Left', 'Right', 'TitleBG', 'DialogBG' };
	for i=1, #Texures do
		_G['ScriptErrorsFrame'..Texures[i]]:SetTexture(nil);
		_G['EventTraceFrame'..Texures[i]]:SetTexture(nil);
	end
	-- ScriptErrors
	F.CreateBD(_G['ScriptErrorsFrame']);
	
	F.ReskinClose(_G['ScriptErrorsFrameClose']);
	
	F.ReskinScroll(_G['ScriptErrorsFrameScrollFrameScrollBar']);
	
	for i=1, _G['ScriptErrorsFrame']:GetNumChildren() do
		local Child = select(i, _G['ScriptErrorsFrame']:GetChildren());
		if Child:GetObjectType() == 'Button' and not Child:GetName() then
			F.Reskin(Child);
		end
	end
	-- EventTrace
	F.CreateBD(_G['EventTraceFrame']);
	
	F.ReskinClose(_G['EventTraceFrameCloseButton']);
	-- FrameStack
	F.CreateBD(_G['FrameStackTooltip']);
end