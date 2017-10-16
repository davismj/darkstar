-----------------------------------
-- Area: Quicksand Caves
--  NPC: qm3 (???)
-- Quests: Old Wounds (Savage Blade WSNM "Girtablulu")
-- !pos -145 2 446
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/Quicksand_Caves/TextIDs");

----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    handleQmTrigger(WSQUESTS.oldWounds, player);
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
