-----------------------------------
-- Area: Kuftal Tunnel
--  NPC: qm3 (???)
-- Quests: The Potential Within (Tachi: Kasha WSNM "Kettenkaefer")
-- !pos 200 11 99
-----------------------------------
package.loaded["scripts/zones/Kuftal_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/Kuftal_Tunnel/TextIDs");

----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    handleQmTrigger(WSQUESTS.thePotentialWithin, player);
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
