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


-- Teleport player to random location.

local function randteleport(user)
	-- p.x, p.y, and p.z will be the position at coordinates
	local p = {}
	p.x = math.random(-4000, 4000)
	p.y = math.random(-1000, 1000)
	p.z = math.random(-4000, 4000)
	if p.x and p.y and p.z then
			local lm = tonumber(minetest.setting_get("map_generation_limit") or 31000)
			if p.x < -lm or p.x > lm or p.y < -lm or p.y > lm or p.z < -lm or p.z > lm then
				return false, "Cannot teleport out of map bounds!"
			end
			teleportee = core.get_player_by_name(user)
			if teleportee then
				teleportee:setpos(p)
				return true, "Teleporting to "..core.pos_to_string(p)
			end
	end
end
		
-- functions to control random numbers and random decimals

-- rounding function 
local function randomegg(egglist)
	local rarity = math.random(1, 100)
	if rarity < 50 then
		return egglist[math.random(1, 4)]
	elseif rarity >= 50 and rarity < 80 then
		return egglist[math.random(5, 6)]
	elseif rarity >= 80 and rarity < 90 then
		return egglist[math.random(7, 9)]
	elseif rarity >= 90 and rarity <= 100 then
		return egglist[math.random(10, 12)]
	else 
		return egglist[math.random(1, 4)]
	end
	
end
local function round(number)
	-- round to 2 decimal points 
	return tonumber(string.format("%.2f", number))

end

-- generate random decimal number
	
local function randomdecimal(use)

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


-- generate items for rare and common

local common = {
	'default:apple',
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
	'default:ingot_steel',
	'default:snow',
	'default:snowblock',
	'default:gravel',
	'default:sand',
	'tool',

}

local commontools ={
	'default:shovel_wood',
	'default:axe_wood',
	'default:pick_wood',
	'default:shovel_stone',
	'default:axe_stone',
	'default:pick_stone',
	'default:shovel_steel',
	'default:axe_steel',
	'default:pick_steel',
}

local uncommon = {
	'default:diamond',
	'default:obsidian',
	'default:obsidian_glass',
	'default:obsidian_block',
	'default:steelblock',
	'default:gold_lump',
	'default:gold_ingot',
	'default:mese_crystal_fragment',
	'default:mese_crystal',
	'default:flint',
	'default:coalblock',
	'tool',
}

local rare = {
	'default:mese',
	'default:diamondblock', 
	'default:goldblock',
	'tool'

}



local commontools ={
	'default:shovel_wood',
	'default:axe_wood',
	'default:pick_wood',
	'default:shovel_stone',
	'default:axe_stone',
	'default:pick_stone',
	'default:shovel_steel',
	'default:axe_steel',
	'default:pick_steel',
}

local uncommon = {
	'default:diamond',
	'default:obsidian',
	'default:obsidian_glass',
	'default:obsidian_block',
	'default:steelblock',
	'default:gold_lump',
	'default:gold_ingot',
	'default:mese_crystal_fragment',
	'default:mese_crystal',
	'default:flint',
	'default:coalblock',
	'tool',
}

local rare = {
	'default:mese',
	'default:diamondblock', 
	'default:goldblock',
	'tool'

}

local raretools = {
	'default:shovel_mese',
	'default:axe_mese',
	'default:pick_mese',
}

local uncommontools = {
	'default:shovel_diamond',
	'default:axe_diamond',
	'default:pick_diamond',
}



local commondistribution = {1, 1, 1, 2, 2, 3}


-- register eggs

minetest.register_craftitem('easter:egg_black', {
	description = 'Easter Egg Black',
	inventory_image = 'easter_egg_black.png',
	groups = {not_in_creative_inventory = 1,},
	-- black egg is dangerous and unpredictable
	on_use = function(itemstack, user)
		local chance = math.random(1, 2)
		itemstack:take_item()
		if chance == 1 then
			user:set_hp(user:get_hp() + 20)
			minetest.chat_send_player(user:get_player_name(), 'You have been healed.')

			return itemstack
		else			
			minetest.after(0.1, function()
				user:set_hp(user:get_hp() - 20)
			end)
			return itemstack
			
		end
		
	end
			
})

minetest.register_craftitem('easter:egg_checkered', {
	description = 'Easter Egg Checkered',
	inventory_image = 'easter_egg_checkered.png',
	-- gift random common item
	groups = {not_in_creative_inventory = 1,},
	on_use = function(itemstack, user)
		local item = common[math.random(1, #common)]
		local amount = commondistribution[math.random(1, #commondistribution)]
		local inv = user:get_inventory()
		if item == 'tool' then
			local toolnum3 = math.random(1, 3)
			local toolnum2 = math.random(4, 6)
			local toolnum1 = math.random(7, 9)
			if amount == 1 then
				item = commontools[toolnum1]
                        	if inv:room_for_item('main', item) then
					user:get_inventory():add_item('main', item)
					itemstack:take_item()
		 			minetest.chat_send_player(user:get_player_name(), 'This egg just gave you '..item..'.')
					return itemstack
				end
			
			elseif amount == 2 then
				item = commontools[toolnum2]
                        	if inv:room_for_item('main', item) then
					user:get_inventory():add_item('main', item)
					itemstack:take_item()
		 			minetest.chat_send_player(user:get_player_name(), 'This egg just gave you '..item..'.')
					return itemstack
				end
			else
				item = commontools[toolnum3]
                        	if inv:room_for_item('main', item) then
					user:get_inventory():add_item('main', item)
					itemstack:take_item()
		 			minetest.chat_send_player(user:get_player_name(), 'This egg just gave you '..item..'.')
					return itemstack
				end
			end
		elseif  inv:room_for_item('main', item..' '..amount) then
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

	groups = {not_in_creative_inventory = 1,},
	--gift semi rare object
	on_use = function(itemstack, user)
		local item = uncommon[math.random(1, #uncommon)]
		local amount = commondistribution[math.random(1, #commondistribution)]
		local inv = user:get_inventory()
		if item == 'tool' then
			local toolnum1 = math.random(1, 3)
			item = uncommontools[toolnum1]
                       	if inv:room_for_item('main', item) then
				user:get_inventory():add_item('main', item)
				itemstack:take_item()
	 			minetest.chat_send_player(user:get_player_name(), 'This egg just gave you '..item..'.')
				return itemstack
			end
		elseif  inv:room_for_item('main', item..' '..amount) then
			user:get_inventory():add_item('main', item..' '..amount)
			itemstack:take_item()
		 	minetest.chat_send_player(user:get_player_name(), 'This egg just gave you '..amount..' '..item..'.')
			return itemstack
				
		else
			minetest.chat_send_player(user:get_player_name(), 'You may want to make room in your inventory before trying that. I dont know what this thing does, but i think you need space.')
		end
	end
})

minetest.register_craftitem('easter:egg_food', {
	description = 'Easter Egg Food',
	inventory_image = 'easter_egg_food.png',
	groups = {not_in_creative_inventory = 1,},
	-- just eat it
	on_use = minetest.item_eat(4),
})

minetest.register_craftitem('easter:egg_speed', {
	description = 'Easter Egg Speed',
	inventory_image = 'easter_egg_speed.png',
	groups = {not_in_creative_inventory = 1,},
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
	groups = {not_in_creative_inventory = 1,},
	--Mario
	on_use = function(itemstack, user)
			user:set_physics_override({jump = 1.7})
			minetest.chat_send_player(user:get_player_name(),'So this Egg makes you jump like Mario!. cool')	
			itemstack:take_item()
			return itemstack
		
	end
})

minetest.register_craftitem('easter:egg_mese', {
	description = 'Easter Egg Mese',
	inventory_image = 'easter_egg_mese.png',
	groups = {not_in_creative_inventory = 1,},
	--gift rare item
	on_use = function(itemstack, user)
		local item = rare[math.random(1, #rare)]
		local amount = commondistribution[math.random(1, #commondistribution)]
		local inv = user:get_inventory()
		if item == 'tool' then
			local toolnum1 = math.random(1, 3)
			item = raretools[toolnum1]
                       	if inv:room_for_item('main', item) then
				user:get_inventory():add_item('main', item)
				itemstack:take_item()
	 			minetest.chat_send_player(user:get_player_name(), 'This egg just gave you '..item..'.')
				return itemstack
			end
		elseif  inv:room_for_item('main', item..' '..amount) then
			user:get_inventory():add_item('main', item..' '..amount)
			itemstack:take_item()
		 	minetest.chat_send_player(user:get_player_name(), 'This egg just gave you '..amount..' '..item..'.')
			return itemstack
				
		else
			minetest.chat_send_player(user:get_player_name(), 'You may want to make room in your inventory before trying that. I dont know what this thing does, but i think you need space.')
		end
	end
})

-- space egg gives moon boots
minetest.register_craftitem('easter:egg_space', {
	description = 'Easter Egg Space',
	inventory_image = 'easter_egg_space.png',
	groups = {not_in_creative_inventory = 1,},
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
	groups = {not_in_creative_inventory = 1,},
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
	groups = {not_in_creative_inventory = 1,},
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
	groups = {not_in_creative_inventory = 1,},
	-- set physics to normal
	on_use = function(itemstack, user)
		user:set_physics_override(1, 1, 1)
		minetest.chat_send_player(user:get_player_name(), 'This egg tastes Normal... like vanilla')
		minetest.do_item_eat(2,nil,itemstack,user)
		return itemstack
	end
})

minetest.register_craftitem('easter:egg_zig_zag', {
	description = 'Easter Egg Zig Zag',
	inventory_image = 'easter_egg_zig_zag.png',
	groups = {not_in_creative_inventory = 1,},
	-- Teleport to random location.
	on_use =  function(itemstack, user)
		local p_name = user:get_player_name()
		randteleport(p_name)
		minetest.chat_send_player(p_name, 'My head is spinning... Where are we?')
		itemstack:take_item()
		return itemstack
	end
		
})
--i believe while this is more accurate for digging easter eggs, it will invite unwanted strip mining.
--[[
minetest.override_item('default:dirt_with_grass', {
	drop = {
		max_items = 2,
		items = {
			{items = {'default:dirt'},     rarity = 1 },
			{items = {'easter:egg_white'}, rarity = 30},
		}
	}
})
]]--


-- item list as suggested by kaeza
minetest.override_item('default:stone', {
	drop = {
		max_items = 2,
		items = {
			{items = {'default:cobble'},	   rarity = 1},
			{items = {'easter:egg_checkered'}, rarity = 30},
			{items = {'easter:egg_white'},     rarity = 30},
			{items = {'easter:egg_food'},      rarity = 30},
			{items = {'easter:egg_space'},	   rarity = 40},
			{items = {'easter:egg_mario'},     rarity = 40},
			{items = {'easter:egg_speed'},     rarity = 40},
			{items = {'easter:egg_striped'},   rarity = 40},
			{items = {'easter:egg_zig_zag'},   rarity = 60},
			{items = {'easter:egg_diamond'},   rarity = 60},
			{items = {'easter:egg_black'},     rarity = 90},
			{items = {'easter:egg_time'},      rarity = 90},
			{items = {'easter:egg_mese'},      rarity = 90},

		}
	}
})
