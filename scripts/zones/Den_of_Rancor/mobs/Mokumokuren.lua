----------------------------------
-- Area: Den of Rancor
--  MOB: Mokumokuren
--   ID: 17433006
-- Note: Popped by qm2
-- Involved in Quest: Souls in Shadow
-----------------------------------
require("scripts/globals/wsquest");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.soulsInShadow, player);
end;
