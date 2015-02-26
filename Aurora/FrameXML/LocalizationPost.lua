local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	if(DeclensionFrame) then
		F:CreateBD(DeclensionFrame);
		
		do
			local DeclensionEdit;
			
			for i = 1, RUSSIAN_DECLENSION_PATTERNS do
				DeclensionEdit = _G['DeclensionFrameDeclension'..i..'Edit'];
				
				DeclensionEdit:SetBackdrop(nil);
				
				F:ReskinInput(DeclensionEdit);
			end
		end
		
		F:ReskinArrow(DeclensionFrameSetNext, 'Right');
		F:ReskinArrow(DeclensionFrameSetPrev, 'Left');
		
		F:Reskin(DeclensionFrameOkayButton);
		F:Reskin(DeclensionFrameCancelButton);
	end
end);