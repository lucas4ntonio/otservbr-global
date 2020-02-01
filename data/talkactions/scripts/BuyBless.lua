-- 100k
local cost = 100000
local blessings = {
	{id = 5, name = 'The Spiritual Shielding'},
	{id = 6, name = 'The Embrace of Tibia'},
	{id = 4, name = 'The Fire of the Suns'},
	{id = 3, name = 'The Spark of the Phoenix'},
	{id = 2, name = 'The Wisdom of Solitude'},
	{id = 7, name = 'Blood of the Mountain'},
	{id = 8, name = 'Heart of the Mountain'}
}

function onSay(player, words, param)
    local bless = nil
    local blessCount = 0

    -- check for blesses
    for i = 1, #blessings do
        bless = blessings[i]
        if(player:hasBlessing(bless.id)) then
            blessCount = blessCount + 1
        end

        -- player already has all blesses
        if(blessCount == 7) then
            player:sendTextMessage(MESSAGE_INFO_DESCR, 'You already have been blessed!')
            return false
        end
    end

    if player:removeMoneyNpc(cost) then
        for i = 1, #blessings do
            bless = blessings[i]
            -- Add only the missing blesses
            if(player:hasBlessing(bless.id) == false) then
                player:addBlessing(bless.id,1)
            end
        end

        player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have been blessed!')
        player:getPosition():sendMagicEffect(CONST_ME_LOSEENERGY)
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, 'You do not have enough money (100k).')
    end

    return false
end