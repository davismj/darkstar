----------------------------------
-- Area: The Boyahda Tree
--  MOB: Beet Leafhopper
--   ID: 17404338
-- Note: Popped by qm1
-- Involved in Quest: Shoot First, Ask Questions Later
-----------------------------------
require("scripts/globals/wsquest");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.shootFirstAskQuestionsLater, player);
end;