----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Cailleach Bheur
--   ID: 17617165
-- Note: Popped by qm3
-- Involved in Quest: Blood and Glory
-----------------------------------
require("scripts/globals/wsquest");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.bloodAndGlory, player);
end;