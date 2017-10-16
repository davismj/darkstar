----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  MOB: Greenman
--   ID: 17273295
-- Note: Popped by qm1
-- Involved in Quest: The Weight Of Your Limits
-----------------------------------
require("scripts/globals/wsquest");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.theWeightOfYourLimits, player);
end;