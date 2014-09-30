local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

tinsert(C.Modules['Aurora'], function()
	hooksecurefunc('TalentFrame_Update', function(TalentFrame)
		if(not TalentFrame) then
			return;
		end
		
		local talentFrameName = TalentFrame:GetName();
		local selectedTab = PanelTemplates_GetSelectedTab(TalentFrame);
		local preview = GetCVarBool('previewTalents');
		
		local isActiveTalentGroup;
		if(TalentFrame.inspect) then
			isActiveTalentGroup = true;
		else
			isActiveTalentGroup = TalentFrame.talentGroup == GetActiveTalentGroup(TalentFrame.inspect, TalentFrame.pet);
		end

		local numTalents = GetNumTalents(selectedTab, TalentFrame.inspect, TalentFrame.pet);
		local unspentPoints = TalentFrame_UpdateTalentPoints(TalentFrame);
		
		local tabPointsSpent;
		if(TalentFrame.pointsSpent and TalentFrame.previewPointsSpent) then
			tabPointsSpent = TalentFrame.pointsSpent + TalentFrame.previewPointsSpent;
		else
			tabPointsSpent = 0;
		end
		
		local talentFrameTalentName = talentFrameName..'Talent';
		local forceDesaturated, tierUnlocked;
		for i = 1, MAX_NUM_TALENTS do
			local buttonName = talentFrameTalentName..i;
			local button = _G[buttonName];
			
			if(i <= numTalents) then
				local name, _, tier, column, rank, maxRank, _, meetsPrereq, previewRank, meetsPreviewPrereq = GetTalentInfo(selectedTab, i, TalentFrame.inspect, TalentFrame.pet, TalentFrame.talentGroup);
				if(name) then
					local displayRank;
					
					if(preview) then
						displayRank = previewRank;
					else
						displayRank = rank;
					end
					
					if((unspentPoints <= 0 or not isActiveTalentGroup) and displayRank == 0) then
						forceDesaturated = 1;
					else
						forceDesaturated = nil;
					end
					
					if(((tier - 1) * (TalentFrame.pet and PET_TALENTS_PER_TIER or PLAYER_TALENTS_PER_TIER) <= tabPointsSpent)) then
						tierUnlocked = 1;
					else
						tierUnlocked = nil;
					end
					
					local prereqsSet = TalentFrame_SetPrereqs(TalentFrame, tier, column, forceDesaturated, tierUnlocked, preview, GetTalentPrereqs(selectedTab, i, TalentFrame.inspect, TalentFrame.pet, TalentFrame.talentGroup));
					if(prereqsSet and ((preview and meetsPreviewPrereq) or (not preview and meetsPrereq))) then
						if(displayRank < maxRank)then
							button.background:SetVertexColor(0, 1, 0);
						else
							button.background:SetVertexColor(1, 1, 0);
						end
						
						button.RankFrame:Show();
					else
						button.background:SetVertexColor(0, 0, 0);
						
						if(rank == 0) then
							button.RankFrame:Hide();
						end
					end
				end
			end
		end
	end);
end);