local config = {
	[0] = {
		--club, coat
		items = {{2398, 1}, {2461, 1}, {2467, 1}, {2649, 1}},
		--container rope, shovel, red apple
		container = {{2120, 1}, {2554, 1}, {2674, 2}}
	},
	[1] = {
		--equipment dwarven shield, wand of vortex, magician's robe, mage hat, studded legs, leather boots, scarf
		items = {{2525, 1}, {2190, 1}, {8819, 1}, {8820, 1}, {2468, 1}, {2643, 1}, {2661, 1}},
		--container crystal coin, mana potion, adventurer's stone, rope, shovel, brown mushroom
		container = {{2160, 1}, {7620, 70}, {18559, 1}, {2120, 1}, {2554, 1}, {2789, 10}}
	},
	[2] = {
		--equipment dwarven shield, snakebite rod, magician's robe, mage hat, studded legs, leather boots, scarf
		items = {{2525, 1}, {2182, 1}, {8819, 1}, {8820, 1}, {2468, 1}, {2643, 1}, {2661, 1}},
		--container crystal coin, mana potion, adventurer's stone, rope, shovel, brown mushroom
		container = {{2160, 1}, {7620, 70}, {18559, 1}, {2120, 1}, {2554, 1}, {2789, 10}}
	},
	[3] = {
		--equipment dwarven shield, 5 spear, ranger's cloak, ranger legs, scarf, legion helmet
		items = {{2525, 1}, {2389, 5}, {2660, 1}, {8923, 1}, {2643, 1}, {2661, 1}, {2480, 1}},
		--container crystal coin, health potion, mana potion, adventurer's stone, rope, shovel, brown mushroom
		container = {{2160, 1}, {7618, 5}, {7620, 38}, {18559, 1}, {2120, 1}, {2554, 1}, {2789, 10}}
	},
	[4] = {
		--equipment dwarven shield, steel axe, brass armor, brass helmet, brass legs, scarf
		items = {{2525, 1}, {8601, 1}, {2465, 1}, {2460, 1}, {2478, 1}, {2643, 1}, {2661, 1}},
		--container crystal coin, jagged sword, daramian mace, health potion, mana potion, rope, shovel, brown mushroom
		container = {{2160, 1}, {8602, 1}, {2439, 1}, {7618, 5}, {7620, 10}, {18559, 1}, {2120, 1}, {2554, 1}, {2789, 10}}
	}

}

function onLogin(player)
	local targetVocation = config[player:getVocation():getId()]
	if not targetVocation then
		return true
	end

	if player:getLastLoginSaved() ~= 0 then
		return true
	end

	if (player:getSlotItem(CONST_SLOT_LEFT)) then
		return true
	end

	for i = 1, #targetVocation.items do
		player:addItem(targetVocation.items[i][1], targetVocation.items[i][2])
	end

	local backpack = player:getVocation():getId() == 0 and player:addItem(1987) or player:addItem(1988)
	if not backpack then
		return true
	end

	for i = 1, #targetVocation.container do
		backpack:addItem(targetVocation.container[i][1], targetVocation.container[i][2])
	end
	return true
end
