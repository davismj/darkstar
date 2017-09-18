-----------------------------------
-- Area: Kazham
-- NPC:  Jakoh Wahcondalo
-- Starts and Finishes Quest: Cloak And Dagger
-- !pos 101 -16 -115 250
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests"); 
require("scripts/globals/missions");
require("scripts/zones/Kazham/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local count = trade:getItemCount();
    local cloakAndDagger = player:getQuestStatus(OUTLANDS,CLOAK_AND_DAGGER);
    local daggerOfTrials = 17616;
    local dagWSPoints = 300; -- TODO replace this with player's actual ws point count

    if (cloakAndDagger == QUEST_ACCEPTED and trade:hasItemQty(daggerOfTrials,1) and count == 1) then
        if dagWSPoints < 300 then -- TODO replace  this with player's actual ws point count
            player:startEvent(0x0119);
        else
            player:startEvent(0x011A);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local cloakAndDagger = player:getQuestStatus(OUTLANDS,CLOAK_AND_DAGGER);

    local mLvl = player:getMainLvl();
    local mJob = player:getMainJob();
    local dagSkill = player:getSkillLevel(SKILL_DAG);
    local daggerOfTrials = 17616;

    if (player:getCurrentMission(ZILART) == KAZAMS_CHIEFTAINESS) then
        player:startEvent(0x0072);
    elseif (player:getCurrentMission(ZILART) == THE_TEMPLE_OF_UGGALEPIH) then
        player:startEvent(0x0073);
    elseif (player:getCurrentMission(WINDURST) == AWAKENING_OF_THE_GODS and player:getVar("MissionStatus") == 2) then
        player:startEvent(0x0109);
    elseif (cloakAndDagger == QUEST_AVAILABLE and player:canEquipItem(daggerOfTrials, true) and dagSkill >= 230 and player:hasItem(daggerOfTrials) == false and player:hasKeyItem(WEAPON_TRAINING_GUIDE) == false) then
        player:startEvent(0x0117); -- 'Cloak and Dagger' start
    elseif (cloakAndDagger == QUEST_ACCEPTED) then
        if (player:hasKeyItem(ANNALS_OF_TRUTH)) then
            player:startEvent(0x011C); -- 'Cloak and Dagger' completed (WSNM killed)
        elseif (player:hasKeyItem(MAP_TO_THE_ANNALS_OF_TRUTH)) then
            player:startEvent(0x011B); -- 'Cloak and Dagger' ongoing stage 2 (turned in completed trial weapon)
        else
            player:startEvent(0x0118); -- 'Cloak and Dagger' ongoing stage 1 (just started)
        end
    else
        player:startEvent(0x0071); -- Default dialogue
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    local evisceration = 2; -- unlock_id from weapon_skills.sql
    local daggerOfTrials = 17616;

    if (csid == 0x0072) then
        player:addKeyItem(SACRIFICIAL_CHAMBER_KEY);
        player:messageSpecial(KEYITEM_OBTAINED,SACRIFICIAL_CHAMBER_KEY);
        player:completeMission(ZILART,KAZAMS_CHIEFTAINESS);
        player:addMission(ZILART,THE_TEMPLE_OF_UGGALEPIH);
    elseif (csid == 0x0109) then
        player:setVar("MissionStatus",3);
    -- Cloak and Dagger
    elseif (csid == 0x0117) then -- 'Cloak and Dagger' start
        if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,daggerOfTrials);
        else
            player:addItem(daggerOfTrials);
            player:messageSpecial(ITEM_OBTAINED,daggerOfTrials);
            player:addQuest(OUTLANDS,CLOAK_AND_DAGGER);
            player:addKeyItem(WEAPON_TRAINING_GUIDE);
            player:messageSpecial(WEAPON_TRAINING_GUIDE);
            -- TODO initialize ws point counter
        end
    elseif (csid == 0x0118) then -- 'Cloak and Dagger' ongoing stage 1 (just started)
        if (option == 1) then -- Misplaced weapon
            if (player:hasItem(daggerOfTrials) == false) then
                -- TODO set ws point counter to 0
                player:addItem(daggerOfTrials);
                player:messageSpecial(ITEM_OBTAINED,daggerOfTrials);
            end
        end
        if (option == 3) then -- Abandon quest
            player:delQuest(OUTLANDS,CLOAK_AND_DAGGER);
            player:delKeyItem(WEAPON_TRAINING_GUIDE);
            player:delKeyItem(MAP_TO_THE_ANNALS_OF_TRUTH);
        end
    elseif (csid == 0x011A) then -- 'Cloak and Dagger' ongoing stage 2 (turned in completed trial weapon)
        player:tradeComplete();
        player:addKeyItem(MAP_TO_THE_ANNALS_OF_TRUTH);
        player:messageSpecial(KEYITEM_OBTAINED,MAP_TO_THE_ANNALS_OF_TRUTH);
    elseif (csid == 0x011C) then -- 'Cloak and Dagger' completed (WSNM killed)
        player:addLearnedWeaponskill(evisceration);
        player:messageSpecial(EVISCERATION_LEARNED);
        player:addFame(KAZHAM,WSNM_FAME);
        player:delKeyItem(ANNALS_OF_TRUTH);
        player:delKeyItem(WEAPON_TRAINING_GUIDE);
        player:completeQuest(OUTLANDS,CLOAK_AND_DAGGER);
    end

end;