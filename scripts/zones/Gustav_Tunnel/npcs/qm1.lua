-----------------------------------
-- Area: Gustav tunnel
--  NPC: qm2 (???)
-- Quests: Cloak and Dagger (Evisceration WSNM "Baronial Bat")
-- !pos 52.8, -1, 19.9 (212)
-----------------------------------
package.loaded["scripts/zones/Gustav_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Gustav_Tunnel/TextIDs");
require("scripts/globals/quests");

----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local cloakAndDagger = player:getQuestStatus(OUTLANDS,CLOAK_AND_DAGGER); -- Evisceration WSquest
    local baronialBat = 17645809;

    if (cloakAndDagger == QUEST_ACCEPTED 
            and player:hasKeyItem(MAP_TO_THE_ANNALS_OF_TRUTH)
            and not(player:hasKeyItem(ANNALS_OF_TRUTH))) then
        if (player:getVar("WSNMKILLED_EVISC") == 1) then -- This is set by Baronial_Bat.lua onMobDeath()
            if not(player:hasKeyItem(ANNALS_OF_TRUTH)) then
                player:addKeyItem(ANNALS_OF_TRUTH);
                player:messageSpecial(KEYITEM_OBTAINED,ANNALS_OF_TRUTH);
        elseif (GetMobAction(baronialBat) == 0) then
            SpawnMob(baronialBat):updateClaim(player);
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
