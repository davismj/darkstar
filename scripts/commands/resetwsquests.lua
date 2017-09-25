---------------------------------------------------------------------------------------------------
-- func: resetwsquests {player}
-- desc: Deletes all known WSquests and associated items/keyitems/WSes for the GM or target player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/wsquest");

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!resetwsquests {player}");
end;

function onTrigger(player, target)

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

    -- Store a table of deleted stuff for nicer output.
    local DELETED = {
        ['quests'] = {},
        ['items'] = {},
        ['keyItems'] = {},
        -- ['weaponSkills'] = {},
    };

    for quest,questData in pairs(WSQUESTS) do
        local logId = questData.logId;
        local questId = questData.questId;
        local itemId = questData.trialWeaponId;

        -- Delete WSquest if flagged or completed
        if (targ:getQuestStatus(logId, questId) ~= QUEST_AVAILABLE) then
            targ:delQuest(logId, questId);
            table.insert(DELETED.quests, 1, questData.questName);
        end

        -- Forget weaponskill if learned
        -- if (targ:hasLearnedWeaponSkill(questData.wsUnlockId)) then
            targ:delLearnedWeaponskill(questData.wsUnlockId);
        --     table.insert(DELETED.weaponSkills, 1, questData.wsName);
        -- end

        -- Delete leftover trial weapon
        for i = LOC_INVENTORY, LOC_WARDROBE4 do -- inventory locations enums
            if (targ:hasItem(itemId, i)) then
                targ:delItem(itemId, 1, i);
                table.insert(DELETED.items, 1, questData.trialWeaponName);
                break;
            end
        end

    end

    -- Delete common keyItems
    local keyItems = {WEAPON_TRAINING_GUIDE,MAP_TO_THE_ANNALS_OF_TRUTH,ANNALS_OF_TRUTH};

    for i, keyId in ipairs(keyItems) do
        if (targ:hasKeyItem(keyId)) then
            local TextIDs = "scripts/zones/" .. targ:getZoneName() .. "/TextIDs";
            package.loaded[TextIDs] = nil;
            require(TextIDs);
            targ:delKeyItem( keyId );
            --targ:messageSpecial(KEYITEM_OBTAINED + 1, keyId);
            table.insert(DELETED.keyItems, 1, keyId);
        end
    end

    -- Print a report of everything that was removed.
    player:PrintToPlayer(string.format(
        "Deleted\n Quests: %s\n Items: %s\n KeyItems: %s",
        --"Deleted\n Quests: %s\n Items: %s\n KeyItems: %s\n WS: %s",
        table.concat(DELETED.quests, ", "),
        table.concat(DELETED.items, ", "),
        table.concat(DELETED.keyItems, ", ")
        --,table.concat(DELETED.weaponSkills, ", ")
        ));
    player:PrintToPlayer(string.format("Finished resetting Weapon Skill quests for %s.",targ:getName()));

end;