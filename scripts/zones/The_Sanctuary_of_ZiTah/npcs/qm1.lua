-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  NPC: qm1 (???)
-- Quests: The Weight of Your Limits (Steel Cyclone WSNM "Greenman")
-- !pos -324 1 474
-----------------------------------
package.loaded["scripts/zones/The_Sanctuary_of_ZiTah/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/The_Sanctuary_of_ZiTah/TextIDs");

----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    handleQmTrigger(WSQUESTS.theWeightOfYourLimits, player);
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
