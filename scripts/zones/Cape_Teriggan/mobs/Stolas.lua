----------------------------------
-- Area: Cape Teriggan
--  MOB: Stolas
--   ID: 17240424
-- Involved in Quest: From Saplings Grow
-----------------------------------
package.loaded["scripts/zones/Cape_Teriggan/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/Cape_Teriggan/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.fromSaplingsGrow, player);
end;