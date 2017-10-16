----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Bodach
--   ID: 17461479
-- Note: Popped by qm1
-- Involved in Quest: The Walls of Your Mind
-----------------------------------
require("scripts/globals/wsquest");
-- require("scripts/globals/pathfind");

-- local path = {
--     29, 16, -140,
--     27, 17, -140
-- };

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.theWallsOfYourMind, player);
end;