-----------------------------------
-- Area: Port Windurst
-- NPC: Kuriodo-Moido
-- Starts and Finishes Quests: Making Amens!, Orastery Woes
-- Involved In Quest: Making Amends, Wonder Wands
-- !pos -115 -3 104
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/wsquest");
require("scripts/zones/Port_Windurst/TextIDs");

WSQUEST = WSQUESTS.orasteryWoes;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    handleWsQuestTrade(WSQUEST, player, trade);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local MakingAmends = player:getQuestStatus(WINDURST,MAKING_AMENDS); --First quest in series
    local MakingAmens = player:getQuestStatus(WINDURST,MAKING_AMENS); --Second quest in series
    local WonderWands = player:getQuestStatus(WINDURST,WONDER_WANDS); --Third and final quest in series
    local pfame = player:getFameLevel(WINDURST);
    local BrokenWand = player:hasKeyItem(128);
    needToZone = player:needToZone();
    local wsQuestEvent = handleWsQuestTrigger(WSQUEST, player); -- Black Halo
    
    if (wsQuestEvent ~= nil) then
        player:startEvent(wsQuestEvent);
    elseif (MakingAmends == QUEST_ACCEPTED) then -- MAKING AMENDS: During Quest
        player:startEvent(0x0114); 
    elseif (MakingAmends == QUEST_COMPLETED and MakingAmens ~= QUEST_COMPLETED and WonderWands ~= QUEST_COMPLETED and needToZone) then -- MAKING AMENDS: After Quest  
        player:startEvent(0x0117); 
    elseif (MakingAmends == QUEST_COMPLETED and MakingAmens == QUEST_AVAILABLE) then 
        if (pfame >=4 and not needToZone) then
            player:startEvent(0x0118); -- Start Making Amens! if prerequisites are met
        else 
            player:startEvent(0x0117); -- MAKING AMENDS: After Quest
        end
    elseif (MakingAmens == QUEST_ACCEPTED and not BrokenWand) then -- Reminder for Making Amens!
        player:startEvent(0x011b);
    elseif (MakingAmens == QUEST_ACCEPTED and BrokenWand) then -- Complete Making Amens!
        player:startEvent(0x011c,GIL_RATE*6000);
    elseif (MakingAmens == QUEST_COMPLETED) then
        if (WonderWands == QUEST_ACCEPTED) then -- During Wonder Wands dialogue
            player:startEvent(0x0105);
        elseif (WonderWands == QUEST_COMPLETED) then -- Post Wonder Wands dialogue
            player:startEvent(0x010a);
        else
            player:startEvent(0x011e,0,937); -- Post Making Amens! dialogue (before Wonder Wands)
        end
    elseif (player:getCurrentMission(ASA) == THAT_WHICH_CURDLES_BLOOD) then
        local item = 0;
        local asaStatus = player:getVar("ASA_Status");
                
        -- TODO: Other Enfeebling Kits
        if (asaStatus == 0) then
            item = 2779;
        else
            printf("Error: Unknown ASA Status Encountered <%u>", asaStatus);
        end

        -- The Parameters are Item IDs for the Recipe        
        player:startEvent(0x035a, item, 1134, 2778, 2778, 4099, 2778);        
    else
        rand = math.random(1,2);
        if (rand == 1) then
            player:startEvent(0x00e1);   -- Standard Conversation
        else
            player:startEvent(0x00e2);   -- Standard Conversation
        end
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
    if (csid == 0x0118) then
        player:addQuest(WINDURST,MAKING_AMENS);
    elseif (csid == 0x011c) then
        player:needToZone(true);
        player:delKeyItem(BROKEN_WAND);
        player:addTitle(HAKKURURINKURUS_BENEFACTOR);
        player:addGil(GIL_RATE*6000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*6000);
        player:addFame(WINDURST,150);
        player:completeQuest(WINDURST,MAKING_AMENS);
    else
        handleWsQuestFinish(WSQUEST, player, csid, option);
    end
end;