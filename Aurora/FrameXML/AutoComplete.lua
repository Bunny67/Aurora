local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	do
		local button;
		
		for i = 1, AUTOCOMPLETE_MAX_BUTTONS do
			button = _G['AutoCompleteButton'..i];
			
			button:SetHighlightTexture(nil);
		end
	end
end);