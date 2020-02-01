-- 50k
local cost = 50000

function onSay(player, words, param)
    if player:removeMoneyNpc(cost) then
        player:addItem(2173, 1)
        player:sendTextMessage(MESSAGE_INFO_DESCR, 'You bought an amulet of loss!')
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, 'You do not have enough money (50k).')
    end

    return false
end