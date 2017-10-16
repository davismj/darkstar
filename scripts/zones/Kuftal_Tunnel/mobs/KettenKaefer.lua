----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Kettenkaefer
--   ID: 17490235
-- Note: Popped by qm3
-- Involved in Quest: The Potential Within
-----------------------------------
require("scripts/globals/wsquest");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.thePotentialWithin, player);
end;
