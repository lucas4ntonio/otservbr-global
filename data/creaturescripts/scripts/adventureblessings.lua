local freeBlessMaxLevel = 130

function onLogin(cid)
    local player = Player(cid)
    if player:getLevel() <= freeBlessMaxLevel then
    	for i = 1, 8 do
    		if not player:hasBlessing(i) then
    			player:addBlessing(i, 1)
    		end
    	end

    	player:sendTextMessage(MESSAGE_EVENT_ADVANCE,'You have free blesses until you get level ' .. freeBlessMaxLevel .. '.')
        player:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
    end
    return true
end
