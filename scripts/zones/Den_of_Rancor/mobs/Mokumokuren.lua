----------------------------------
-- Area: Den of Rancor
--  MOB: Mokumokuren
--   ID: 17433006
-- Involved in Quest: Souls in Shadow
-----------------------------------
package.loaded["scripts/zones/Den_of_Rancor/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/Den_of_Rancor/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.soulsInShadow, player);
end;
