local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local tinsert = table.insert;

tinsert(C.Modules['Aurora'], function()
	ChannelFrameVerticalBar:DisableDrawLayer('BACKGROUND');
	
	F.ReskinCheck(ChannelFrameAutoJoinParty);
	F.ReskinCheck(ChannelFrameAutoJoinBattleground);
	
	F.Reskin(ChannelFrameNewButton);
	
	ChannelListScrollFrame:DisableDrawLayer('ARTWORK');
	F.ReskinScroll(ChannelListScrollFrameScrollBar);
	
	do
		local Button;
		
		for i = 1, MAX_DISPLAY_CHANNEL_BUTTONS do
			Button = _G['ChannelButton'..i];
			
			Button:SetNormalTexture('');
			
			F.StyleButton(Button);
		end
	end
	
	ChannelRosterScrollFrame:DisableDrawLayer('BACKGROUND');
	F.ReskinScroll(ChannelRosterScrollFrameScrollBar);
	
	F.CreateBD(ChannelFrameDaughterFrame);
	
	ChannelFrameDaughterFrameTitlebar:SetTexture(nil);
	ChannelFrameDaughterFrameCorner:SetTexture(nil);
	
	F.ReskinInput(ChannelFrameDaughterFrameChannelName);
	F.ReskinInput(ChannelFrameDaughterFrameChannelPassword);
	
	F.ReskinClose(ChannelFrameDaughterFrameDetailCloseButton);
	
	F.Reskin(ChannelFrameDaughterFrameCancelButton);
	F.Reskin(ChannelFrameDaughterFrameOkayButton);
end);