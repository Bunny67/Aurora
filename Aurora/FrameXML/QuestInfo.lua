local _G = getfenv(0);
local unpack = unpack;
local select = select;
local tinsert = table.insert;

local F, C = unpack(select(2, ...));

local TexCoords = F.TexCoords;

tinsert(C.Modules['Aurora'], function()
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
			
			if (Finished) then
				Objective:SetTextColor(1, 1, 0);
			else
				Objective:SetTextColor(0.6, 0.6, 0.6);
			end
		end
	end);
	
	do
		local Item, ItemIcon, ItemName, ItemCount;
		
		for i = 1, MAX_NUM_ITEMS do
			Item = _G['QuestInfoItem'..i];
			ItemIcon = _G['QuestInfoItem'..i..'IconTexture'];
			ItemName = _G['QuestInfoItem'..i..'NameFrame'];
			ItemCount = _G['QuestInfoItem'..i..'Count'];
			
			F:StyleButton(Item);
			
			F:CreateBG(ItemIcon);
			ItemIcon:SetPoint('TOPLEFT', 1, -1);
			ItemIcon:SetTexCoord(unpack(TexCoords));
			ItemIcon:SetDrawLayer('OVERLAY');

			ItemName:SetTexture(0, 0, 0, .25);
			ItemName:SetSize(117, 39);
			
			Item.BG = CreateFrame('Frame', nil, Item);
			Item.BG:SetPoint('TOPLEFT', ItemName, 'TOPLEFT', 10, 0);
			Item.BG:SetPoint('BOTTOMRIGHT', ItemName, 'BOTTOMRIGHT');
			F:CreateBD(Item.BG, 0);
			
			ItemCount:SetDrawLayer('OVERLAY');
		end
	end
end);