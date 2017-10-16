-----------------------------------
-- Area: Port Bastok
-- NPC:  Oggbi
-- Starts and Finishes: Ghosts of the Past, The First Meeting, The Walls of Your Mind
-- !pos -159 -7 5 (236)
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/wsquest");
require("scripts/zones/Port_Bastok/TextIDs");

WSQUEST = WSQUESTS.theWallsOfYourMind;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(BASTOK,GHOSTS_OF_THE_PAST) == QUEST_ACCEPTED
            and (trade:hasItemQty(13122,1) 
            and trade:getItemCount() == 1)) then -- Trade Miner's Pendant
        player:startEvent(0x00e8); -- Finish Quest "Ghosts of the Past"
    else
        handleWsQuestTrade(WSQUEST, player, trade);
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local mLvl = player:getMainLvl();
    local mJob = player:getMainJob();
    local ghostsOfThePast = player:getQuestStatus(BASTOK,GHOSTS_OF_THE_PAST);
    local theFirstMeeting = player:getQuestStatus(BASTOK,THE_FIRST_MEETING);
    local wsQuestEvent = handleWsQuestTrigger(WSQUEST, player); -- Asuran Fists

    if (ghostsOfThePast == QUEST_AVAILABLE and mJob == 2 and mLvl >= 40) then
        player:startEvent(0x00e7); -- Start Quest "Ghosts of the Past"
    elseif (ghostsOfThePast == QUEST_COMPLETED and player:needToZone() == false and theFirstMeeting == QUEST_AVAILABLE and mJob == 2 and mLvl >= 50) then
        player:startEvent(0x00e9); -- Start Quest "The First Meeting"
    elseif (player:hasKeyItem(LETTER_FROM_DALZAKK) and player:hasKeyItem(SANDORIAN_MARTIAL_ARTS_SCROLL)) then
        player:startEvent(0x00ea); -- Finish Quest "The First Meeting"
    elseif (wsQuestEvent ~= nil) then
        player:startEvent(wsQuestEvent);
    else
        player:startEvent(0x00e6); -- Standard Dialog
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x00e7) then
        player:addQuest(BASTOK,GHOSTS_OF_THE_PAST);
    elseif (csid == 0x00e8) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17478); -- Beat Cesti
        else
            player:tradeComplete();
            player:addItem(17478);
            player:messageSpecial(ITEM_OBTAINED,17478); -- Beat Cesti
            player:needToZone(true);
            player:addFame(BASTOK,AF1_FAME);
            player:completeQuest(BASTOK,GHOSTS_OF_THE_PAST);
        end
    elseif (csid == 0x00e9) then
        player:addQuest(BASTOK,THE_FIRST_MEETING);
    elseif (csid == 0x00ea) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14090); -- Temple Gaiters
        else
            player:delKeyItem(LETTER_FROM_DALZAKK);
            player:delKeyItem(SANDORIAN_MARTIAL_ARTS_SCROLL);
            player:addItem(14090);
            player:messageSpecial(ITEM_OBTAINED,14090); -- Temple Gaiters
            player:addFame(BASTOK,AF2_FAME);
            player:completeQuest(BASTOK,THE_FIRST_MEETING);
        end
    else
        local learnedId = ASURAN_FISTS_LEARNED;
        handleWsQuestFinish(WSQUEST, player, csid, option, learnedId);
    end

end;