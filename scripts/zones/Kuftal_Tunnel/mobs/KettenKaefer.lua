----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Kettenkaefer
--   ID: 17490235
-- Involved in Quest: The Potential Within
-----------------------------------
package.loaded["scripts/zones/Kuftal_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/Kuftal_Tunnel/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.thePotentialWithin, player);
end;
