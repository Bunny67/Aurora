local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local select = select;
local tinsert = table.insert;

local Hoop = F.dummy;

tinsert(C.Modules['Aurora'], function()
	-- PVPParentFrame;
	F.SetBD(PVPParentFrame, 13, -13, -32, 76);
	
	F.ReskinClose(PVPParentFrameCloseButton, 'TOPRIGHT', PVPParentFrame, 'TOPRIGHT', -36, -17);
	-- PVPFrame;
	PVPFramePortrait:Hide();
	
	for i = 3, 6 do
		select(i, PVPFrame:GetRegions()):SetTexture(nil);
	end
	
	PVPFrameBackground:SetTexture(nil);
	
	do
		local Team;
		local TeamHighlight;
		
		for i = 1, MAX_ARENA_TEAMS do
			Team = _G['PVPTeam'..i];
			TeamHighlight = _G['PVPTeam'..i..'Highlight'];
			
			F.SetBD(Team, 9, -4, -24, 3);
			
			for j = 1, 5 do
				select(j, Team:GetRegions()):SetTexture(nil);
			end
			
			TeamHighlight:Hide();
			TeamHighlight.Show = Hoop;
		end
	end
	-- PVPTeamDetails;
	F.CreateBD(PVPTeamDetails);
	
	do
		local Region;
		
		for i = 1, PVPTeamDetails:GetNumRegions() do
			Region = select(i, PVPTeamDetails:GetRegions());
			
			if (Region and Region:GetObjectType() == 'Texture') then
				Region:Hide();
			end
		end
	end
	
	F.ReskinClose(PVPTeamDetailsCloseButton, 'TOPRIGHT', PVPTeamDetails, 'TOPRIGHT', -4, -4);
	
	do
		local Header;
		
		for i = 1, 5 do
			Header = _G['PVPTeamDetailsFrameColumnHeader'..i];
			
			F.ReskinHeader(Header);
		end
	end
	
	F.Reskin(PVPTeamDetailsAddTeamMember);
	
	F.ReskinArrow(PVPTeamDetailsToggleButton, 'Right');
	
	do
		local Tab;
		
		for i = 1, 2 do
			Tab = _G['PVPParentFrameTab'..i];
			
			F.ReskinTab(Tab);
		end
	end
end);