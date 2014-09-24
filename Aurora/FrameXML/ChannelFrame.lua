local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	ChannelFrameVerticalBar:DisableDrawLayer('BACKGROUND');
	
	F:ReskinCheck(ChannelFrameAutoJoinParty);
	F:ReskinCheck(ChannelFrameAutoJoinBattleground);
	
	F:Reskin(ChannelFrameNewButton);
	
	ChannelListScrollFrame:DisableDrawLayer('ARTWORK');
	F:ReskinScroll(ChannelListScrollFrameScrollBar);
	
	do
		local Button;
		
		for i = 1, MAX_DISPLAY_CHANNEL_BUTTONS do
			Button = _G['ChannelButton'..i];
			
			Button:SetNormalTexture('');
			
			F:StyleButton(Button);
			
			_G['ChannelButton'..i..'Collapsed']:SetTextColor(1, 1, 1);
		end
	end
	
	ChannelRosterScrollFrame:DisableDrawLayer('BACKGROUND');
	F:ReskinScroll(ChannelRosterScrollFrameScrollBar);
	
	F:CreateBD(ChannelFrameDaughterFrame);
	
	ChannelFrameDaughterFrameTitlebar:SetTexture(nil);
	ChannelFrameDaughterFrameCorner:SetTexture(nil);
	
	F:ReskinInput(ChannelFrameDaughterFrameChannelName);
	F:ReskinInput(ChannelFrameDaughterFrameChannelPassword);
	
	F:ReskinClose(ChannelFrameDaughterFrameDetailCloseButton);
	
	F:Reskin(ChannelFrameDaughterFrameCancelButton);
	F:Reskin(ChannelFrameDaughterFrameOkayButton);
end);