----------------------------------
-- Area: Western Altepa Desert
--  MOB: Maharaja
--   ID: 17289656
-- Note: Popped by qm1
-- Involved in Quest: Inheritance
-----------------------------------
require("scripts/globals/wsquest");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.inheritance, player);
end;