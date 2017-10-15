----------------------------------
-- Area: Sea Serpent Grotto
--  MOB: Water Leaper
--   ID: 17498565
-- Involved in Quest: Methods Create Madness
-----------------------------------
package.loaded["scripts/zones/Sea_Serpent_Grotto/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/Sea_Serpent_Grotto/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.methodsCreateMadness, player);
end;