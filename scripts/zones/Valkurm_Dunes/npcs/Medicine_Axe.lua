-----------------------------------
-- Area: Valkurm Dunes
--  NPC: Medicine Axe
-- Type: Outpost Vendor
-- !pos 144 -7 104 103
-----------------------------------
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/globals/conquest");
require("scripts/zones/Valkurm_Dunes/TextIDs");

local region     = dsp.conquest.ZULKHEIM;
local csid    = 0x7ff4;

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local owner = GetRegionOwner(region);
    local arg1 = dsp.conquest.getArg1(owner,player);

    if (owner == player:getNation()) then
        nation = 1;
    elseif (arg1 < 1792) then
        nation = 2;
    else
        nation = 0;
    end

    player:startEvent(csid,nation,dsp.conquest.opTeleFee(player,region),0,dsp.conquest.opTeleFee(player,region),player:getCP(),0,0,0);

end;

function onEventUpdate(player,csid,option)
    -- printf("OPTION: %u",option);

    player:updateEvent(player:getGil(),dsp.conquest.opTeleFee(player,region),0,dsp.conquest.opTeleFee(player,region),player:getCP());

end;

function onEventFinish(player,csid,option)
    -- printf("OPTION: %u",option);

    if (option == 1) then
        ShowOPVendorShop(player);
    elseif (option == 2) then
        if (player:delGil(dsp.conquest.opTeleFee(player,region))) then
            dsp.conquest.toHomeNation(player);
        end
    elseif (option == 6) then
        player:delCP(dsp.conquest.opTeleFee(player,region));
        dsp.conquest.toHomeNation(player);
    end

end;