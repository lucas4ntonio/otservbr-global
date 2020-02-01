local table = 
{
    [50] = {id = {2160, 3}, msg = "Congratulations for reaching the level 50! You earned 30k."},
    [100] = {id = {2160, 5}, msg = "Congratulations for reaching the level 100! You earned 50k."},
    [100] = {id = {2160, 8}, msg = "Congratulations for reaching the level 150! You earned 80k."},
    [200] = {id = {2160, 10}, msg = "Congratulations for reaching the level 200! You earned 100k."},
}

local storage = 15000

function onAdvance(player, skill, oldLevel, newLevel)
	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end

	for level, _ in pairs(table) do
		if newLevel >= level and player:getStorageValue(storage) < level then
		    player:addItem(table[level].id[1], table[level].id[2])
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, table[level].msg)
			player:setStorageValue(storage, level)
		end
    end
    
    player:save()
    
	return true
end