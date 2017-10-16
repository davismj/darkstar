----------------------------------
-- Area: Quicksand Caves
--  MOB: Girtablulu
--   ID: 17629645
-- Note: Popped by qm3
-- Involved in Quest: Old Wounds
-----------------------------------
require("scripts/globals/wsquest");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.oldWounds, player);
end;