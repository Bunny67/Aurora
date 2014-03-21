local F, C = unpack(select(2, ...));

local _G = getfenv(0);
local unpack = unpack;

tinsert(C.modules['Aurora'], function()
	hooksecurefunc('QuestInfo_Display', function()								
		-- Headers
		QuestInfoTitleHeader:SetTextColor(1, 1, 1);
		QuestInfoTitleHeader:SetShadowColor(0, 0, 0);
		QuestInfoDescriptionHeader:SetTextColor(1, 1, 1);
		QuestInfoDescriptionHeader:SetShadowColor(0, 0, 0);
		QuestInfoObjectivesHeader:SetTextColor(1, 1, 1);
		QuestInfoObjectivesHeader:SetShadowColor(0, 0, 0);
		QuestInfoRewardsHeader:SetTextColor(1, 1, 1);
		QuestInfoRewardsHeader:SetShadowColor(0, 0, 0);
		-- Other text
		QuestInfoDescriptionText:SetTextColor(1, 1, 1);
		QuestInfoObjectivesText:SetTextColor(1, 1, 1);
		QuestInfoGroupSize:SetTextColor(1, 1, 1);
		QuestInfoRewardText:SetTextColor(1, 1, 1);
		-- Reward frame text
		QuestInfoItemChooseText:SetTextColor(1, 1, 1);
		QuestInfoItemReceiveText:SetTextColor(1, 1, 1);
		QuestInfoSpellLearnText:SetTextColor(1, 1, 1);		
		QuestInfoHonorFrameReceiveText:SetTextColor(1, 1, 1);
		QuestInfoArenaPointsFrameReceiveText:SetTextColor(1, 1, 1);
		QuestInfoTalentFrameReceiveText:SetTextColor(1, 1, 1);
		QuestInfoXPFrameReceiveText:SetTextColor(1, 1, 1);
		
		local NumObjectives = GetNumQuestLeaderBoards();
		local Objective;
		local Type, Finished;
		local NumVisibleObjectives = 0;
		for i = 1, NumObjectives do
			_, Type, Finished = GetQuestLogLeaderBoard(i);
			NumVisibleObjectives = NumVisibleObjectives + 1;
			Objective = _G['QuestInfoObjective'..NumVisibleObjectives];
			
			if ( Finished ) then
				Objective:SetTextColor(1, 1, 0);
			else
				Objective:SetTextColor(0.6, 0.6, 0.6);
			end
		end
	end);
	
	for i = 1, MAX_NUM_ITEMS do
		local Item = _G['QuestInfoItem'..i];
		local ItemIconTexture = _G['QuestInfoItem'..i..'IconTexture'];
		local ItemNameFrame = _G['QuestInfoItem'..i..'NameFrame'];
		local ItemCount = _G['QuestInfoItem'..i..'Count'];
		
		F.StyleButton(Item);
		F.CreateBD(Item, .25);
		
		ItemIconTexture:SetPoint('TOPLEFT', 1, -1);
		ItemIconTexture:SetTexCoord(unpack(F.TexCoords));
		ItemIconTexture:SetDrawLayer('OVERLAY');

		ItemNameFrame:Hide();
		
		ItemCount:SetDrawLayer('OVERLAY');
	end
end);