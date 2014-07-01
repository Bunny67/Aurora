local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;
local tinsert = table.insert;

local TexCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
	F.ReskinExpandOrCollapse(WatchFrameCollapseExpandButton);
	
	local function SkinWatchFrameItems()
		local ItemButton, ItemButtonIcon;
		
		for i = 1, WATCHFRAME_NUM_ITEMS do
			ItemButton = _G['WatchFrameItem'..i];
			ItemButtonIcon = _G['WatchFrameItem'..i..'IconTexture'];
			
			F.CreateBD(ItemButton);
			F.StyleButton(ItemButton);
			
			_G['WatchFrameItem'..i..'NormalTexture']:SetAlpha(0);
			
			ItemButtonIcon:SetPoint('TOPLEFT', 1, -1);
			ItemButtonIcon:SetPoint('BOTTOMRIGHT', -1, 1);
			ItemButtonIcon:SetTexCoord(unpack(TexCoords));
		end	
	end
	
	WatchFrame:HookScript('OnEvent', SkinWatchFrameItems);
	
	hooksecurefunc('WatchFrame_Expand', function()
		WatchFrameCollapseExpandButton.Plus:Hide();
	end);
	
	hooksecurefunc('WatchFrame_Collapse', function()
		WatchFrameCollapseExpandButton.Plus:Show();
	end);
end);