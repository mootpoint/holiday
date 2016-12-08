-- easter mod that adds easter egg easter eggs, 

-- part of the holiday modpack written by mootpoint and Foz

--[[
Copyright (C) 2016 Joseph 'Tucker' Bamberg
leave room for Foz to copyright if he wants
This file is part of easter.
easter is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
Stats is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with easter.  If not, see <http://www.gnu.org/licenses/>.
]]

-- far from a complete mod use at your own risk

-- first enable a few different eggs, next make some physics eggs some present eggs, last hook each egg to a different item.


-- functions to control random numbers and random decimals

-- rounding function 

local function round(number)
	-- round to 2 decimal points 
	return tonumber(string.format("%.2f", number))

end

-- generate random decimal number
	
local function randomdecimal(use)
	math.randomseed( os.time() )
	local dec = math.random()
	local whole = math.random(0, 10)
	local final = whole + dec
	if use ~= 'speed' then
		return round(final)
	else 
		wholespeed = math.random(1, 3)
		final = wholespeed + dec
		return round(final)
	end
end

-- generate random whole number

local function randomnum(amount)
	-- amount should be the number of items in the list or the max number needed
	math.randomseed( os.time() )
	return math.random(0, amount)
end


-- generate items for rare and common

local common = {
	'default:apple',
	'default:pick_wood',
	'default:pick_stone',
	'default:pick_steel',
	'default:shovel_wood',
	'default:shovel_stone',
	'default:shovel_steel',
	'default:axe_wood',
	'default:axe_stone',
	'default:axe_steel',
	'default:papyrus',
	'default:paper',
	'default:glass',
	'default:coal_lump',
	'default:iron_lump',
	'default:cobble',
	'default:stone',
	'default:sapling',
	'default:dirt',
	'default:tree',
	'default:desert_stone',
	'default:desert_cobble',
}

local commondistribution = {1, 1, 1, 2, 2, 3}


-- register eggs

minetest.register_craftitem('easter:egg_black', {
	description = 'Easter Egg Black',
	inventory_image = 'easter_egg_black.png',
	-- black egg is dangerous and unpredictable
	on_use = function(itemstack, user)
		local healthchange = 20
		local chance = math.random(1, 2)
		if chance == 1 then
			user:set_hp(user:get_hp() + healthchange)
		else
			user:set_hp(user:get_hp() - healthchange)
		end
		itemstack:take_item()
		return itemstack
	end
			
})

minetest.register_craftitem('easter:egg_checkered', {
	description = 'Easter Egg Checkered',
	inventory_image = 'easter_egg_checkered.png',
	-- gift random common item
	on_use = function(itemstack, user)
		local item = common[math.random(1, #common)]
		local amount = commondistribution[math.random(1, #commondistribution)]
		local inv = user:get_inventory()
		if inv:room_for_item('main', item..' '..amount) then
			user:get_inventory():add_item('main', item..' '..amount)
			itemstack:take_item()
		 	minetest.chat_send_player(user:get_player_name(), 'This egg just gave you '..amount..' '..item..'.')
			return itemstack
		else
			minetest.chat_send_player(user:get_player_name(), 'You may want to make room in your inventory before trying that. I dont know what this thing does, but i think you need space.')
		end
	end
})

minetest.register_craftitem('easter:egg_diamond', {
	description = 'Easter Egg Diamond',
	inventory_image = 'easter_egg_diamond.png',
	--decide what to do
	-- on_use = probably gift uncommon to semi rare item
	
})

minetest.register_craftitem('easter:egg_food', {
	description = 'Easter Egg Food',
	inventory_image = 'easter_egg_food.png',
	-- just eat it
	on_use = minetest.item_eat(4),
})

minetest.register_craftitem('easter:egg_speed', {
	description = 'Easter Egg Speed',
	inventory_image = 'easter_egg_speed.png',
	--speed
	on_use = function(itemstack, user)
		local random = randomdecimal('speed')
		user:set_physics_override({speed = random})
		minetest.chat_send_player(user:get_player_name(), 'Your speed was set to : ' ..random..'.')
		minetest.chat_send_player(user:get_player_name(), 'Alright, this one is like the flash, i guess. Unless your slow, then its like a snail.')
		itemstack:take_item()
		return itemstack
	end
})

minetest.register_craftitem('easter:egg_mario', {
	description = 'Easter Egg Mario',
	inventory_image = 'easter_egg_mario.png',
	--Mario
	on_use = function(itemstack, user)
			user:set_physics_override({jump = 1.7})
			minetest.chat_send_player(user:get_player_name(),'So the Mario Egg makes you jump like Mario!. cool')	
			itemstack:take_item()
			return itemstack
		
	end
})

minetest.register_craftitem('easter:egg_mese', {
	description = 'Easter Egg Mese',
	inventory_image = 'easter_egg_mese.png',
	--decide what to do
	-- on_use = gift semi rare to rare item, or mese group tool
})

-- space egg gives moon boots
minetest.register_craftitem('easter:egg_space', {
	description = 'Easter Egg Space',
	inventory_image = 'easter_egg_space.png',
	--moon boots
	on_use = function(itemstack, user)
			
			user:set_physics_override({gravity = 0.165})
			minetest.chat_send_player(user:get_player_name(),'Wow! That egg gave you Moon Boots!')	
			
			itemstack:take_item()
			return itemstack
		
	end

})
-- random gravity egg

minetest.register_craftitem('easter:egg_striped', {
	description = 'Easter Egg Striped',
	inventory_image = 'easter_egg_striped.png',
	-- Random Gravity
	on_use = function(itemstack, user)
		random = randomdecimal('gravity')
		user:set_physics_override({gravity = random})
		minetest.chat_send_player(user:get_player_name(), 'This egg just set your Gravity to : '..random)
		itemstack:take_item()
		local normal = function()
			user:set_physics_override({gravity = 1})
			minetest.chat_send_player(user:get_player_name(), 'Wow, That egg was dangerous. We better put you back to normal before you fly off or implode.')
		end
		minetest.after(30, normal)
		return itemstack  
	end
})

minetest.register_craftitem('easter:egg_time', {
	description = 'Easter Egg time',
	inventory_image = 'easter_egg_time.png',
	-- set day
	on_use = function(itemstack, user)
		minetest.set_timeofday(0.23)
		minetest.chat_send_player(user:get_player_name(), 'This Egg must be magic! it made it Day Time!!!!')
		itemstack:take_item()
		return itemstack
	end
})

minetest.register_craftitem('easter:egg_white', {
	description = 'Easter Egg White',
	inventory_image = 'easter_egg_white.png',
	-- set physics to normal
	on_use = function(itemstack, user)
		user:set_physics_override(1, 1, 1)
		minetest.chat_send_player(user:get_player_name(), 'This egg tastes Normal... like vanilla')
		itemstack:take_item()
		return itemstack
	end
})

minetest.register_craftitem('easter:egg_zig_zag', {
	description = 'Easter Egg Zig Zag',
	inventory_image = 'easter_egg_zig_zag.png',
	--decide what to do
	-- on_use = 
})
