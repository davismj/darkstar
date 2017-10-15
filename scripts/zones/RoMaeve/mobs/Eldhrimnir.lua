----------------------------------
-- Area: Ro'Maeve
--  MOB: Eldhrimnir
--   ID: 17277126
-- Involved in Quest: Orastery Woes
-----------------------------------
package.loaded["scripts/zones/RoMaeve/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/RoMaeve/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.orasteryWoes, player);
end;