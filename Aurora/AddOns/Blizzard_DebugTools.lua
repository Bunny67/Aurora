local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local select = select;

C.Modules['Blizzard_DebugTools'] = function()
	do
		local Texures = { 'TopLeft', 'TopRight', 'Top', 'BottomLeft', 'BottomRight', 'Bottom', 'Left', 'Right', 'TitleBG', 'DialogBG' };
		
		for i = 1, #Texures do
			_G['ScriptErrorsFrame'..Texures[i]]:SetTexture(nil);
			_G['EventTraceFrame'..Texures[i]]:SetTexture(nil);
		end
	end
	-- ScriptErrors
	F:CreateBD(ScriptErrorsFrame);
	
	F:ReskinClose(ScriptErrorsFrameClose);
	
	F:ReskinScroll(ScriptErrorsFrameScrollFrameScrollBar);
	
	do
		local Child;
		
		for i = 1, _G['ScriptErrorsFrame']:GetNumChildren() do
			Child = select(i, _G['ScriptErrorsFrame']:GetChildren());
			
			if Child:GetObjectType() == 'Button' and not Child:GetName() then
				F:Reskin(Child);
			end
		end
	end
	-- EventTrace
	F:CreateBD(EventTraceFrame);
	
	F:ReskinClose(EventTraceFrameCloseButton);
	-- FrameStack
	F:CreateBD(FrameStackTooltip);
end