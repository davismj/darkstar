----------------------------------
-- Area: Ro'Maeve
--  MOB: Eldhrimnir
--   ID: 17277126
-- Note: Popped by qm1
-- Involved in Quest: Orastery Woes
-----------------------------------
require("scripts/globals/wsquest");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.orasteryWoes, player);
end;