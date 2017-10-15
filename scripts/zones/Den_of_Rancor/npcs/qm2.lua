-----------------------------------
-- Area: Den of Rancor
--  NPC: qm2 (???)
-- Quests: Souls in Shadow (Spiral Hell WSNM "Mokumokuren")
-- !pos 118 36 -281
-----------------------------------
package.loaded["scripts/zones/Den_of_Rancor/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/Den_of_Rancor/TextIDs");

----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    handleQmTrigger(WSQUESTS.soulsInShadow, player);
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
