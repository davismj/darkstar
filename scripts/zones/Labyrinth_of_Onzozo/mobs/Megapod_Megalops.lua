----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Megapod Megalops
--   ID: 17649861
-- Note: Popped by qm1
-- Involved in Quest: Bugi Soden
-----------------------------------
require("scripts/globals/wsquest");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.bugiSoden, player);
end;