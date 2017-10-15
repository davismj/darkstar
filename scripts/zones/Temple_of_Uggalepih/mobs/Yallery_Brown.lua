----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Yallery Brown
--   ID: 17428817
-- Involved in Quest: Axe The Competition
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.axeTheCompetition, player);
end;