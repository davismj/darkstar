-----------------------------------
-- Area: Labyrinth of Onzozo
--  NPC: qm1 (???)
-- Quests: Bugi Soden (Blade: Ku WSNM "Megapod Megalops")
-- !pos 110 15 162
-----------------------------------
package.loaded["scripts/zones/Labyrinth_of_Onzozo/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/Labyrinth_of_Onzozo/TextIDs");

----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    handleQmTrigger(WSQUESTS.bugiSoden, player);
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
