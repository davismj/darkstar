----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Megapod Megalops
--   ID: 17649861
-- Involved in Quest: Bugi Soden
-----------------------------------
package.loaded["scripts/zones/Labyrinth_of_Onzozo/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/Labyrinth_of_Onzozo/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.bugiSoden, player);
end;