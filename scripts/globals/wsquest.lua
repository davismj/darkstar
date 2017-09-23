require('scripts/globals/quests');

WSQUESTS =
{
    ['cloakAndDagger'] =
    {
        ['wsName'] = 'Evisceration',
        ['unlockId'] = 2,
        ['combatSkill'] = 'Dagger',
        ['minSkill'] = 230,
        ['skillId'] = SKILL_DAG,
        ['weaponName'] = 'Dagger of Trials',
        ['weaponId'] = 17616,
        ['questName'] = 'Cloak and Dagger',
        ['logId'] = OUTLANDS,
        ['questId'] = CLOAK_AND_DAGGER,
        ['npc'] = 'Jakoh Wahcondalo',
        ['npcZoneId'] = KAZHAM,
        ['learnedMessageId'] = EVISCERATION_LEARNED,
        ['eventIds'] =
        {
            ['start'] = 279,
            ['cont1'] = 280,
            ['cont2'] = 283,
            ['tradeIncomplete'] = 281,
            ['tradeComplete'] = 282,
            ['finish'] = 284
        },
        ['options'] =
        {
            ['acceptStart'] = nil,
            ['dropped'] = 1,
            ['abandon'] = 3
        }
    }
};

function handleWsQuestTrade(quest, player, trade)
    local wsPoints = 300; -- TODO replace this with player's actual ws point count
    if (player:getQuestStatus(quest.logId, quest.questId) == QUEST_ACCEPTED and trade:hasItemQty(quest.weaponId,1) and trade:getItemCount() == 1) then
        if wsPoints < 300 then -- TODO replace  this with player's actual ws point count
            player:startEvent(quest.eventIds.tradeIncomplete);
        else
            player:startEvent(quest.eventIds.tradeComplete);
        end
    end
end;

function handleWsQuestTrigger(quest, player)
    if (player:getQuestStatus(quest.logId, quest.questId) == QUEST_AVAILABLE
        and player:canEquipItem(quest.weaponId, true)
        and player:getSkillLevel(quest.skillId) >= quest.minSkill
        and player:hasItem(quest.weaponId) == false
        and player:hasKeyItem(WEAPON_TRAINING_GUIDE) == false) then
            player:startEvent(quest.eventIds.start); -- WS Quest start
            return true;
    elseif (player:getQuestStatus(quest.logId, quest.questId) == QUEST_ACCEPTED) then
        if (player:hasKeyItem(ANNALS_OF_TRUTH)) then
            player:startEvent(quest.eventIds.finish); -- WS Quest completed (WSNM killed)
            return true;
        elseif (player:hasKeyItem(MAP_TO_THE_ANNALS_OF_TRUTH)) then
            player:startEvent(quest.eventIds.cont2); -- WS Quest ongoing stage 2 (turned in completed trial weapon)
            return true;
        else
            player:startEvent(quest.eventIds.cont1); -- WS Quest ongoing stage 1 (just started)
            return true;
        end
    end

    return false;
end;

function handleWsQuestFinish(quest, player, csid, option)
    if (csid == quest.eventIds.start) then -- WS Quest start
        if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,quest.weaponId);
        else
            player:addItem(quest.weaponId);
            player:messageSpecial(ITEM_OBTAINED,quest.weaponId);
            player:addQuest(quest.logId,quest.questId);
            player:addKeyItem(WEAPON_TRAINING_GUIDE);
            player:messageSpecial(WEAPON_TRAINING_GUIDE);
            -- TODO initialize ws point counter
        end
    elseif (csid == quest.eventIds.cont1) then -- WS Quest ongoing stage 1 (just started)
        if (option == quest.options.dropped) then -- Misplaced weapon
            if (player:hasItem(quest.weaponId) == false) then
                -- TODO set ws point counter to 0
                player:addItem(quest.weaponId);
                player:messageSpecial(ITEM_OBTAINED,quest.weaponId);
            end
        end
        if (option == quest.options.abandon) then -- Abandon quest
            player:delQuest(quest.logId,quest.questId);
            player:delKeyItem(WEAPON_TRAINING_GUIDE);
            player:delKeyItem(MAP_TO_THE_ANNALS_OF_TRUTH);
        end
    elseif (csid == quest.eventIds.tradeComplete) then -- WS Quest ongoing stage 2 (turned in completed trial weapon)
        player:tradeComplete();
        player:addKeyItem(MAP_TO_THE_ANNALS_OF_TRUTH);
        player:messageSpecial(KEYITEM_OBTAINED,MAP_TO_THE_ANNALS_OF_TRUTH);
    elseif (csid == quest.eventIds.finish) then -- WS Quest completed (WSNM killed)
        player:addLearnedWeaponskill(quest.unlockId);
        player:messageSpecial(quest.learnedMessageId);
        player:addFame(quest.npcZoneId,WSNM_FAME);
        player:delKeyItem(MAP_TO_THE_ANNALS_OF_TRUTH);
        player:delKeyItem(ANNALS_OF_TRUTH);
        player:delKeyItem(WEAPON_TRAINING_GUIDE);
        player:completeQuest(quest.logId,quest.questId);
    end
end;