require('scripts/globals/quests');

WSQUESTS =
{
    --------------------------------------
    -- Quest: The Walls of Your Mind
    --   NPC: Oggbi (Port Bastok)
    --    WS: Asuran Fists (Hand-to-Hand)
    --------------------------------------
    ['theWallsOfYourMind'] =
    {
        ['skillId'] = SKILL_H2H,
        ['minSkill'] = 250,
        ['wsUnlockId'] = 1,
        ['trialWeaponId'] = 17507, -- 'Knuckles of Trials'
        ['logId'] = BASTOK,
        ['questId'] = THE_WALLS_OF_YOUR_MIND,
        ['fameRegion'] = BASTOK,
        ['learnedWsTextId'] = ASURAN_FISTS_LEARNED,
        ['eventIds'] =
        {
            ['start'] = 286,
            ['cont1'] = 287,
            ['cont2'] = nil,
            ['tradedUnfinishedWeapon'] = 288,
            ['tradedFinishedWeapon'] = 289,
            ['finish'] = 290
        },
        ['options'] =
        {
            ['acceptStart'] = nil,
            ['dropped'] = 1,
            ['abandon'] = 2
        }
    },
    ------------------------------------
    -- Quest: Cloak and Dagger
    --   NPC: Jakoh Wahcondalo (Kazham)
    --    WS: Evisceration (Dagger)
    ------------------------------------
    ['cloakAndDagger'] =
    {
        ['skillId'] = SKILL_DAG,
        ['minSkill'] = 230,
        ['wsUnlockId'] = 2,
        ['trialWeaponId'] = 17616, -- 'Dagger of Trials'
        ['logId'] = OUTLANDS,
        ['questId'] = CLOAK_AND_DAGGER,
        ['fameRegion'] = KAZHAM,
        ['learnedWsTextId'] = EVISCERATION_LEARNED,
        ['eventIds'] =
        {
            ['start'] = 279,
            ['cont1'] = 280,
            ['cont2'] = 283,
            ['tradedUnfinishedWeapon'] = 281,
            ['tradedFinishedWeapon'] = 282,
            ['finish'] = 284
        },
        ['options'] =
        {
            ['acceptStart'] = nil,
            ['dropped'] = 1,
            ['abandon'] = 3
        }
    },
    ----------------------------------------
    -- Quest: Old Wounds
    --   NPC: Curilla (Chateau d'Oraguille)
    --    WS: Savage Blade (Sword)
    ----------------------------------------
    ['oldWounds'] =
    {
        ['skillId'] = SKILL_SWD,
        ['minSkill'] = 240,
        ['wsUnlockId'] = 3,
        ['trialWeaponId'] = 17654, -- 'Sapara of Trials'
        ['logId'] = SANDORIA,
        ['questId'] = OLD_WOUNDS,
        ['fameRegion'] = SANDORIA,
        ['learnedWsTextId'] = SAVAGE_BLADE_LEARNED,
        ['eventIds'] = 
        {
            ['start'] = 43,
            ['cont1'] = 46,
            ['cont2'] = 47,
            ['tradedUnfinishedWeapon'] = 45,
            ['tradedFinishedWeapon'] = 44,
            ['finish'] = 48
        },
        ['options'] =
        {
            ['acceptStart'] = 1,
            ['dropped'] = 1,
            ['abandon'] = 2
        }
    },

};

function handleWsQuestTrade(quest, player, trade)
    local wsPoints = 300; -- TODO replace this with player's actual ws point count
    if (player:getQuestStatus(quest.logId, quest.questId) == QUEST_ACCEPTED and trade:hasItemQty(quest.trialWeaponId,1) and trade:getItemCount() == 1) then
        if wsPoints < 300 then -- TODO replace  this with player's actual ws point count
            player:startEvent(quest.eventIds.tradedUnfinishedWeapon);
        else
            player:startEvent(quest.eventIds.tradedFinishedWeapon);
        end
    end
end;

function handleWsQuestTrigger(quest, player)
    if (player:getQuestStatus(quest.logId, quest.questId) == QUEST_AVAILABLE
            and player:canEquipItem(quest.trialWeaponId, true)
            and player:getSkillLevel(quest.skillId) >= quest.minSkill
            and player:hasItem(quest.trialWeaponId) == false
            and player:hasKeyItem(WEAPON_TRAINING_GUIDE) == false) then
        player:startEvent(quest.eventIds.start); -- WS Quest start
        return true;
    elseif (player:getQuestStatus(quest.logId, quest.questId) == QUEST_ACCEPTED) then
        if (player:hasKeyItem(ANNALS_OF_TRUTH)) then
            player:startEvent(quest.eventIds.finish); -- WS Quest completed (WSNM killed)
            return true;
        elseif (player:hasKeyItem(MAP_TO_THE_ANNALS_OF_TRUTH) and not(quest.eventIds.cont2 == nil)) then
            player:startEvent(quest.eventIds.cont2); -- WS Quest ongoing stage 2 (traded finished weapon but have not killed NM)
            return true;
        elseif (not (player:hasKeyItem(MAP_TO_THE_ANNALS_OF_TRUTH))) then
            player:startEvent(quest.eventIds.cont1); -- WS Quest ongoing stage 1 (quest flagged but have not traded finished weapon)
            return true;
        end
    end

    return false;
end;

function handleWsQuestFinish(quest, player, csid, option)
    if (csid == quest.eventIds.start and ((quest.options.acceptStart == nil) or (option == quest.options.acceptStart))) then -- WS Quest start
        if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,quest.trialWeaponId);
        else
            player:addKeyItem(WEAPON_TRAINING_GUIDE);
            player:messageSpecial(KEYITEM_OBTAINED,WEAPON_TRAINING_GUIDE);
            player:addItem(quest.trialWeaponId);
            player:messageSpecial(ITEM_OBTAINED,quest.trialWeaponId);
            player:addQuest(quest.logId,quest.questId);
            -- TODO initialize ws point counter
        end
    elseif (csid == quest.eventIds.cont1) then -- WS Quest ongoing stage 1
        if (option == quest.options.dropped) then -- Misplaced weapon
            if (player:hasItem(quest.trialWeaponId))  then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,quest.trialWeaponId);
            else
                -- TODO set ws point counter to 0
                player:addItem(quest.trialWeaponId);
                player:messageSpecial(ITEM_OBTAINED,quest.trialWeaponId);
            end
        end
        if (option == quest.options.abandon) then -- Abandon quest
            player:delQuest(quest.logId,quest.questId);
            player:delKeyItem(WEAPON_TRAINING_GUIDE);
            player:delKeyItem(MAP_TO_THE_ANNALS_OF_TRUTH);
        end
    elseif (csid == quest.eventIds.tradedFinishedWeapon) then -- WS Quest ongoing stage 2
        player:tradeComplete();
        player:addKeyItem(MAP_TO_THE_ANNALS_OF_TRUTH);
        player:messageSpecial(KEYITEM_OBTAINED,MAP_TO_THE_ANNALS_OF_TRUTH);
    elseif (csid == quest.eventIds.finish) then -- WS Quest completed
        player:addLearnedWeaponskill(quest.wsUnlockId);
        player:messageSpecial(quest.learnedWsTextId);
        player:addFame(quest.fameRegion,WSNM_FAME);
        player:delKeyItem(MAP_TO_THE_ANNALS_OF_TRUTH);
        player:delKeyItem(ANNALS_OF_TRUTH);
        player:delKeyItem(WEAPON_TRAINING_GUIDE);
        player:completeQuest(quest.logId,quest.questId);
    end
end;