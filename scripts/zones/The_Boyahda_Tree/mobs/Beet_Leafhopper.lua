----------------------------------
-- Area: The Boyahda Tree
--  MOB: Beet Leafhopper
--   ID: 17404338
-- Involved in Quest: Shoot First, Ask Questions Later
-----------------------------------
package.loaded["scripts/zones/The_Boyahda_Tree/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/wsquest");
require("scripts/zones/The_Boyahda_Tree/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    handleWsnmDeath(WSQUESTS.shootFirstAskQuestionsLater, player);
end;