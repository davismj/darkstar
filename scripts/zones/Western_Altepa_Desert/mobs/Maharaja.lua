----------------------------------
-- Area: Western Altepa Desert
--  MOB: Maharaja
--   ID: 17289656
-- Involved in Quest: Inheritance
-----------------------------------
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/Western_Altepa_Desert/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.inheritance, player);
end;