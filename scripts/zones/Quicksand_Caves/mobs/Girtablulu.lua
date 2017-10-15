----------------------------------
-- Area: Quicksand Caves
--  MOB: Girtablulu
--   ID: 17629645
-- Involved in Quest: Old Wounds
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/Quicksand_Caves/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.oldWounds, player);
end;