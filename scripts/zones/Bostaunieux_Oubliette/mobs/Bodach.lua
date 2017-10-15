----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Bodach
--   ID: 17461479
-- Involved in Quest: The Walls of Your Mind
-----------------------------------
package.loaded["scripts/zones/Bostaunieux_Oubliette/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/Bostaunieux_Oubliette/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.theWallsOfYourMind, player);
end;