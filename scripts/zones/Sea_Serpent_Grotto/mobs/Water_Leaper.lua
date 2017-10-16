----------------------------------
-- Area: Sea Serpent Grotto
--  MOB: Water Leaper
--   ID: 17498565
-- Note: Popped by qm1
-- Involved in Quest: Methods Create Madness
-----------------------------------
require("scripts/globals/wsquest");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.methodsCreateMadness, player);
end;