local F, C = unpack(select(2, ...));

local _G = getfenv(0);

tinsert(C.modules['Aurora'], function()
	F.ReskinExpandOrCollapse(WatchFrameCollapseExpandButton);
	
	local function SkinWatchFrameItems()
		for i = 1, WATCHFRAME_NUM_ITEMS do
			local itemButton = _G['WatchFrameItem'..i];
			
			F.CreateBD(itemButton);
			F.StyleButton(itemButton);
			
			_G['WatchFrameItem'..i..'NormalTexture']:SetAlpha(0);
			_G['WatchFrameItem'..i..'IconTexture']:SetTexCoord(unpack(F.TexCoords));
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