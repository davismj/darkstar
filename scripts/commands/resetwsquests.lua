---------------------------------------------------------------------------------------------------
-- func: resetwsquests {player}
-- desc: Deletes all known WSquests and associated items/keyitems for the GM or target player.
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

function onTrigger(player)

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


    for quest,questData in pairs(WSQUESTS) do
        local logId = questData.logId;
        local questId = questData.questId;
        local itemId = questData.trialWeaponId;

        -- Forget weaponskill
        targ:delLearnedWeaponskill(questData.wsUnlockId);

        -- Delete WSquest if flagged or completed
        if (targ:getQuestStatus(logId, questId) ~= QUEST_AVAILABLE) then
            targ:delQuest(logId, questId);
            player:PrintToPlayer(string.format("Quest: %s removed from %s.", questData.questName, targ:getName()));
        end

        -- Delete leftover trial weapon
        for i = LOC_INVENTORY, LOC_WARDROBE4 do -- inventory locations enums
            if (targ:hasItem(itemId, i)) then
                targ:delItem(itemId, 1, i);
                player:PrintToPlayer(string.format("Item: %s removed from %s.", questData.trialWeaponName, targ:getName()));
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
            player:PrintToPlayer(string.format("Key item: %i deleted from %s.", keyId, targ:getName()));
        end
    end

    player:PrintToPlayer(string.format("Finished resetting Weapon Skill quests for %s.", targ:getName()));

end;