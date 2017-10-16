----------------------------------
-- Area: Gustav Tunnel
--  MOB: Baronial Bat
--   ID: 17645809
-- Note: Popped by qm1
-- Involved in Quest: Cloak and Dagger
-----------------------------------
require("scripts/globals/wsquest");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.cloakAndDagger, player);
end;