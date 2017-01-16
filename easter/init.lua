-- Easter mod that adds easter egg easter eggs,
-- part of the holiday modpack written by mootpoint and Foz

--[[
Copyright (C) 2017 Joseph 'Tucker' Bamberg
Copyright (C) 2017 John Cole
This file is part of easter.
easter is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
easter is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with easter.  If not, see <http://www.gnu.org/licenses/>.
--]]

local egglist = {
	'easter:egg_white', -- normal resets back to normal -- start common 1
	'easter:egg_food', -- just food 2
	'easter:egg_space', -- mb 3
	'easter:egg_mario', -- mario jump 4
	'easter:egg_speed', -- random speed variable 5
	'easter:egg_checkered', -- common items -- end common list 6
	'easter:egg_striped', -- random gravity -- uncommon 7
	'easter:egg_zig_zag', -- random teleportation 8  
	'easter:egg_night', -- make player see either night or day w/o changing server time -- end uncommon 9
	'easter:egg_diamond', -- give semi rare things -- rare 10
	'easter:egg_black', -- kill or heal -- end rare 11
	'easter:egg_time', -- set server time to day -- superrare 12
	'easter:egg_mese', -- grants rare blocks -- end superrare 13
}

local randomegg = function()
	local rarity = 2500
	local year = os.date('*t').year
	local march22 = os.time({year = year, month = 03, day = 22, hour = 0 })
	local april25 = os.time({year = year, month = 04, day = 25, hour = 24})
	local now = os.time()
	if march22 < now and now < april25 then
		rarity = 25
	end

	local roll = math.random(0,rarity*100)
	if roll <= 100 then
		if roll < 40 then -- 40% chance
			return egglist[math.random(1, 7)]
		elseif roll < 90 then -- 50% chance
			return egglist[math.random(7, 9)]
		elseif roll < 95 then -- 5% chance
			return egglist[math.random(10, 11)]
		else -- 6% chance
			return egglist[math.random(12, 13)]
		end
	end
end

local hatch = function(itemstack, user, item, amount)
	local inv = user:get_inventory()
	if inv:room_for_item('main', item..' '..amount) then
		inv:add_item('main', item..' '..amount)
		minetest.chat_send_player(user:get_player_name(),
			'This egg just gave you '..amount..' '..item..'.')
	else
		minetest.item_drop(ItemStack(item..' '..amount), user, user:getpos())
	end
	itemstack:take_item()
	return itemstack
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
	'default:steel_ingot',
	'default:snow',
	'default:snowblock',
	'default:gravel',
	'default:sand',
	'tool',
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
	'default:shovel_stone',
	'default:axe_stone',
	'default:pick_stone',
	'default:shovel_steel',
	'default:axe_steel',
	'default:pick_steel',
}

local uncommontools = {
	'default:shovel_diamond',
	'default:axe_diamond',
	'default:pick_diamond',
}

local raretools = {
	'default:shovel_mese',
	'default:axe_mese',
	'default:pick_mese',
}

local commondistribution = {1, 1, 1, 2, 2, 3}

-- register eggs

minetest.register_craftitem('easter:egg_black', {
	description = 'Easter Egg Black',
	inventory_image = 'easter_egg_black.png',
	groups = {not_in_creative_inventory = 1,},
	-- black egg is dangerous and unpredictable
	on_use = function(itemstack, user)
		if math.random(0,1) == 1 then
			user:set_hp(20)
			minetest.chat_send_player(user:get_player_name(), 'You have been healed.')
		else
			minetest.after(0, function() user:set_hp(0) end)
		end
		itemstack:take_item()
		return itemstack
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
		if item == 'tool' then
			if amount == 1 then
				item = commontools[math.random(7,9)]
			elseif amount == 2 then
				item = commontools[math.random(4,6)]
			else
				item = commontools[math.random(1,3)]
			end
			amount = 1
		end
		return hatch(itemstack, user, item, amount)
	end
})

minetest.register_craftitem('easter:egg_diamond', {
	description = 'Easter Egg Diamond',
	inventory_image = 'easter_egg_diamond.png',
	groups = {not_in_creative_inventory = 1,},
	--gift uncommon object
	on_use = function(itemstack, user)
		local item, amount = uncommon[math.random(1, #uncommon)], 1
		if item == 'tool' then
			item = uncommontools[math.random(1, #uncommontools)]
		else
			amount = commondistribution[math.random(1, #commondistribution)]
		end
		return hatch(itemstack, user, item, amount)
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
		-- Pick new speed in [0.2,0.9] or [1.1,3]
		local random
		if math.random(0,2) == 0 then
			random = math.random(20,90)/100
		else
			random = math.random(110,300)/100
		end
		user:set_physics_override({speed = random})
		minetest.chat_send_player(user:get_player_name(),
			'Your speed was set to : ' ..random..'.')
		minetest.chat_send_player(user:get_player_name(),
			'Alright, this one is like the flash, i guess. '..
			'Unless your slow, then its like a snail.')
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
		minetest.chat_send_player(user:get_player_name(),
			'So this Egg makes you jump like Mario!. cool')
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
		local item, amount = rare[math.random(1, #rare)], 1
		if item == 'tool' then
			item = raretools[math.random(1, #raretools)]
		else
			amount = commondistribution[math.random(1, #commondistribution)]
		end
		return hatch(itemstack, user, item, amount)
	end
})

minetest.register_craftitem('easter:egg_space', {
	description = 'Easter Egg Space',
	inventory_image = 'easter_egg_space.png',
	groups = {not_in_creative_inventory = 1,},
	-- space egg gives moon boots
	on_use = function(itemstack, user)
		user:set_physics_override({gravity = 0.165})
		minetest.chat_send_player(user:get_player_name(),
			'Wow! That egg gave you Moon Boots!')
		itemstack:take_item()
		return itemstack
	end
})

minetest.register_craftitem('easter:egg_striped', {
	description = 'Easter Egg Striped',
	inventory_image = 'easter_egg_striped.png',
	groups = {not_in_creative_inventory = 1,},
	-- Random Gravity
	on_use = function(itemstack, user)
		-- Pick new gravity in [0.1,0.9] or [1.1,10]
		local random
		if math.random(0,1) == 0 then
			random = math.random(10,90)/100
		else
			random = math.random(110,1000)/100
		end
		user:set_physics_override({gravity = random})
		minetest.chat_send_player(user:get_player_name(),
			'This egg just set your Gravity to : '..random)
		local normal = function(random)
			if random > 2 then
				user:set_physics_override({gravity = 1})
				minetest.chat_send_player(user:get_player_name(),
					'Wow, That egg was dangerous. '..
					'We better put you back to normal before you fly off or implode.')
			end
		end
		minetest.after(30, normal(random))
		itemstack:take_item()
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
		minetest.chat_send_player(user:get_player_name(),
			'This Egg must be magic! it made it Day Time!!!!')
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
		user:override_day_night_ratio(nil)
		minetest.chat_send_player(user:get_player_name(),
			'This egg tastes Normal... like vanilla')
		minetest.do_item_eat(2,nil,itemstack,user)
		return itemstack
	end
})

minetest.register_craftitem('easter:egg_night', {
	description = 'Easter Egg Night',
	inventory_image = 'easter_egg_night.png',
	groups = {not_in_creative_inventory = 1,},
	-- code for night function modified from Lightcorrect mod by mootpoint
	on_use = function(itemstack, user)
		local light = (minetest.get_timeofday()*2)
		if light < 0.47 then
			user:override_day_night_ratio((light)+0.4)
		else
			user:override_day_night_ratio((light)-0.4)
		end
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem('easter:egg_zig_zag', {
	description = 'Easter Egg Zig Zag',
	inventory_image = 'easter_egg_zig_zag.png',
	groups = {not_in_creative_inventory = 1,},
	-- Teleport to random location.
	on_use =  function(itemstack, user)
		local place = math.random(1, 10)
		if place == 1 then
			user:setpos( { x=45, y=6, z=168 } ) -- behind spawn mine
		elseif place == 2 then
			user:setpos( { x=595, y=6, z=405 } ) -- arena
		elseif place == 3 then
			user:setpos( { x=1111, y=24, z=-552 } ) -- above fountain at /hub
		elseif place == 4 then
			user:setpos( { x=-1777, y=23, z=748 } ) -- out near Hello Nemo
		elseif place == 5 then
			user:setpos( { x=0, y=28, z=169 } ) -- Geronimo
		elseif place == 6 then
			user:setpos( { x=2298, y=24, z=4400 } ) -- near edge of server
		elseif place == 7 then
			user:setpos( { x=1500, y=3, z=400 } ) -- random lake
		elseif place == 8 then
			user:setpos( { x=396, y=20, z=364 } ) -- Aquarium
		elseif place == 9 then
			user:setpos( { x=3000, y=33, z=-2000 } ) -- snowfield in the way out
		else
			user:setpos( { x=-166, y=-103, z=276 } ) -- Headache Room in hd's castle
		end
		itemstack:take_item()
		return itemstack
	end
})

minetest.override_item('default:stone', {
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local egg = randomegg(egglist)
			if egg ~= nil then
				local inv = digger:get_inventory()
				if inv:room_for_item('main', egg) then
					digger:get_inventory():add_item('main', egg)
				else
					minetest.item_drop(ItemStack(egg), digger, digger:getpos())
				end
			end
	end
})
