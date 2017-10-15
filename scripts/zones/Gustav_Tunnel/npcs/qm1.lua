-----------------------------------
-- Area: Gustav tunnel
--  NPC: qm1 (???)
-- Quests: Cloak and Dagger (Evisceration WSNM "Baronial Bat")
-- !pos 52.8, -1, 19.9 (212)
-----------------------------------
package.loaded["scripts/zones/Gustav_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/Gustav_Tunnel/TextIDs");

----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    handleQmTrigger(WSQUESTS.cloakAndDagger, player);
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
