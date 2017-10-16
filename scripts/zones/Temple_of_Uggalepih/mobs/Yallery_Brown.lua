----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Yallery Brown
--   ID: 17428817
-- Note: Popped by qm9
-- Involved in Quest: Axe The Competition
-----------------------------------
require("scripts/globals/wsquest");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.axeTheCompetition, player);
end;