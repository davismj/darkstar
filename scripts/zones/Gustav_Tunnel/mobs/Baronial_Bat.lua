----------------------------------
-- Area: Gustav Tunnel
--  MOB: Baronial Bat
--   ID: 17645809
-- Involved in Quest: Cloak and Dagger
-----------------------------------
package.loaded["scripts/zones/Gustav_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/Gustav_Tunnel/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.cloakAndDagger, player);
end;