---------------------------------------------------------------------------------------------------
-- func: dellearnedweaponskill <unlock_id> {player}
-- desc: Unlearns a weaponskill
---------------------------------------------------------------------------------------------------

require("scripts/globals/quests");

cmdprops =
{
    permission = 1,
    parameters = "sss"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!addlearnedweaponskill <unlock_id> {player}");
end;

function onTrigger(player, unlockId, target)

    -- validate unlockId
    local wsName;
    if (unlockId == nil) then
        error(player, "You must provide an unlock_id");
        return;
    elseif (tonumber(unlockId) ~= nil) then
        unlockId = tonumber(unlockId);
    elseif (unlockId < 0 or unlockId > 48) then -- TODO pull from weapon_skills table if possible rather than hardcoding
        error(player, "unlock_id out of range");
        return;        
    end

    -- validate target
    local targ;
    if (target == nil) then
        targ = player;
    else
        targ = GetPlayerByName(target);
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target));
            return;
        end
    end

    -- add quest
    targ:delLearnedWeaponskill(unlockId, questId);
    --player:PrintToPlayer(string.format("Player %p learned %w.", targ:getName(),));
end;