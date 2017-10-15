----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  MOB: Greenman
--   ID: 17273295
-- Involved in Quest: The Weight Of Your Limits
-----------------------------------
package.loaded["scripts/zones/The_Sanctuary_of_ZiTah/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/The_Sanctuary_of_ZiTah/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.theWeightOfYourLimits, player);
end;