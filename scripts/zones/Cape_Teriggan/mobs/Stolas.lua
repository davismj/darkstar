----------------------------------
-- Area: Cape Teriggan
--  MOB: Stolas
--   ID: 17240424
-- Note: Popped by qm1
-- Involved in Quest: From Saplings Grow
-----------------------------------
require("scripts/globals/wsquest");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.fromSaplingsGrow, player);
end;