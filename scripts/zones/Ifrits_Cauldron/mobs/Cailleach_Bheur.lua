----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Cailleach Bheur
--   ID: 17617165
-- Involved in Quest: Blood and Glory
-----------------------------------
package.loaded["scripts/zones/Ifrits_Cauldron/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/Ifrits_Cauldron/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.bloodAndGlory, player);
end;