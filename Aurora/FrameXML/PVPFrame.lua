local F, C = unpack(select(2, ...))

local _G = getfenv(0);
local select = select;

local Hoop = F.dummy;

tinsert(C.Modules['Aurora'], function()
	-- PVPParentFrame;
	F.SetBD(PVPParentFrame, 13, -13, -32, 76);
	
	F.ReskinClose(PVPParentFrameCloseButton, 'TOPRIGHT', PVPParentFrame, 'TOPRIGHT', -36, -17);
	-- PVPFrame;
	PVPFramePortrait:Hide();
	
	for i = 1, PVPFrame:GetNumRegions() do
		local Region = select(i, PVPFrame:GetRegions());
		
		if ( Region and Region:GetObjectType() == 'Texture' ) then
			Region:Hide();
		end
	end
	
	for i = 1, MAX_ARENA_TEAMS do
		local Team = _G['PVPTeam'..i];
		local TeamHighlight = _G['PVPTeam'..i..'Highlight'];
		
		F.SetBD(Team, 9, -4, -24, 3);
		
		for j = 1, 5 do
			select(j, Team:GetRegions()):Hide();
		end
		
		TeamHighlight:Hide();
		TeamHighlight.Show = Hoop;
	end
	-- PVPTeamDetails;
	F.CreateBD(PVPTeamDetails);
	
	for i = 1, PVPTeamDetails:GetNumRegions() do
		local Region = select(i, PVPTeamDetails:GetRegions());
		
		if ( Region and Region:GetObjectType() == 'Texture' ) then
			Region:Hide();
		end
	end
	
	F.ReskinClose(PVPTeamDetailsCloseButton, 'TOPRIGHT', PVPTeamDetails, 'TOPRIGHT', -4, -4);
	
	for i = 1, 5 do
		local Header = _G['PVPTeamDetailsFrameColumnHeader'..i];

		F.ReskinHeader(Header);
	end
	
	F.Reskin(PVPTeamDetailsAddTeamMember);
	
	F.ReskinArrow(PVPTeamDetailsToggleButton, 'Right');
	
	for i = 1, 2 do
		local Tab = _G['PVPParentFrameTab'..i];
		
		F.ReskinTab(Tab);
	end
end)