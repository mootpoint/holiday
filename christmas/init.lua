--christmas mod for minetest

--[[
Copyright (C) 2016 Joseph 'Tucker' Bamberg
leave room for Foz to copyright if he wants
This file is part of christmas.
christmas is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
Stats is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with christmas.  If not, see <http://www.gnu.org/licenses/>.
]]

-- far from a complete mod use at your own risk




minetest.register_node('christmas:present_red', {
	description = 'Red Christmas Present',
	tiles = {
		'christmas_present_red_top.png',
		'christmas_present_red_bottom.png',
		'christmas_present_red_side.png',
		'christmas_present_red_side.png',
		'christmas_present_red_side.png',
		'christmas_present_red_side.png'
	},
	groups = {oddly_breakable_by_hand = 3}
})

minetest.register_node('christmas:present_yellow', {
	description = 'Yellow Christmas Present',
	tiles = {
		'christmas_present_yellow_top.png',
		'christmas_present_yellow_bottom.png',
		'christmas_present_yellow_side.png',
		'christmas_present_yellow_side.png',
		'christmas_present_yellow_side.png',
		'christmas_present_yellow_side.png'
	},
	groups = {oddly_breakable_by_hand = 3}
})

minetest.register_node('christmas:present_green', {
	description = 'Green Christmas Present',
	tiles = {
		'christmas_present_green_top.png',
		'christmas_present_green_bottom.png',
		'christmas_present_green_side.png',
		'christmas_present_green_side.png',
		'christmas_present_green_side.png',
		'christmas_present_green_side.png'
	},
	groups = {oddly_breakable_by_hand = 3,},
	
})

minetest.register_node('christmas:present_small_red', {
	description = 'Small Red Present',
	drawtype = 'nodebox',
	paramtype = 'light',
	tiles = {
		'christmas_present_small_red_top.png',
		'christmas_present_small_red_bottom.png',
		'christmas_present_small_red_side.png',
		'christmas_present_small_red_side.png',	
		'christmas_present_small_red_side.png',
		'christmas_present_small_red_side.png',
	},
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, 0.125, 0.3125},
		}
	},
	groups = {oddly_breakable_by_hand = 3,},
	
})

minetest.register_node('christmas:present_small_blue', {
	description = 'Small Blue Present',
	drawtype = 'nodebox',
	paramtype = 'light',
	tiles = {
		'christmas_present_small_blue_top.png',
		'christmas_present_small_blue_bottom.png',
		'christmas_present_small_blue_side.png',
		'christmas_present_small_blue_side.png',	
		'christmas_present_small_blue_side.png',
		'christmas_present_small_blue_side.png',
	},
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, 0.125, 0.3125},
		}
	},
	groups = {oddly_breakable_by_hand = 3,},
	
})

minetest.register_node('christmas:present_small_purple', {
	description = 'Small Purple Present',
	drawtype = 'nodebox',
	paramtype = 'light',
	tiles = {
		'christmas_present_small_purple_top.png',
		'christmas_present_small_purple_bottom.png',
		'christmas_present_small_purple_side.png',
		'christmas_present_small_purple_side.png',	
		'christmas_present_small_purple_side.png',
		'christmas_present_small_purple_side.png',
	},
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, 0.125, 0.3125},
		}
	},
	groups = {oddly_breakable_by_hand = 3,},
	
})

local register_driedel = function(name, def, color)
	def.tiles = {
		'christmas_driedel_'..color..'_tb.png',
		'christmas_driedel_'..color..'_tb.png',
		'christmas_driedel_'..color..'_side_a.png',
		'christmas_driedel_'..color..'_side_b.png',
		'christmas_driedel_'..color..'_side_c.png',
		'christmas_driedel_'..color..'_side_d.png',
	}
	def.drawtype = 'nodebox'
	def.is_ground_content = true
	def.paramtype = 'light'
	def.node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox1
			{-0.375, 0.0625, -0.375, 0.375, 0.1875, 0.375}, -- NodeBox2
			{-0.3125, -0.125, -0.3125, 0.3125, 0.0625, 0.3125}, -- NodeBox3
			{-0.25, -0.25, -0.25, 0.25, -0.125, 0.25}, -- NodeBox4
			{-0.1875, -0.3125, -0.1875, 0.1875, -0.25, 0.1875}, -- NodeBox5
			{-0.125, -0.375, -0.125, 0.125, -0.3125, 0.125}, -- NodeBox6
		}
	}
	def.groups = {snappy = 3, oddly_breakable_by_hand = 2,}
	def.inventory_image = 'christmas_driedel_'..color..'.png',
	minetest.register_node(name, def)
	
end


minetest.register_node("christmas:driedel_wood", {
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox1
			{-0.375, 0.0625, -0.375, 0.375, 0.1875, 0.375}, -- NodeBox2
			{-0.3125, -0.125, -0.3125, 0.3125, 0.0625, 0.3125}, -- NodeBox3
			{-0.25, -0.25, -0.25, 0.25, -0.125, 0.25}, -- NodeBox4
			{-0.1875, -0.3125, -0.1875, 0.1875, -0.25, 0.1875}, -- NodeBox5
			{-0.125, -0.375, -0.125, 0.125, -0.3125, 0.125}, -- NodeBox6
		}
	},
	groups = {snappy = 3, oddly_breakable_by_hand = 2,},
})

-- Blue Driedel
register_driedel('christmas:driedel_blue', {
	description = 'Blue Driedel',
}, 'blue')

-- Gold Driedel
register_driedel('christmas:driedel_gold', {
	description = 'Gold Driedel',
}, 'gold')


-- Red Driedel
register_driedel('christmas:driedel_red', {
	description = 'Red Driedel',
}, 'red')


-- Gray Driedel
register_driedel('christmas:driedel_gray', {
	description = 'Gray Driedel',
}, 'gray')


-- Green Driedel
register_driedel('christmas:driedel_green', {
	description = 'Green Driedel',
}, 'green')


-- Yellow Driedel
register_driedel('christmas:driedel_yellow', {
	description = 'Yellow Driedel',
}, 'yellow')

-- Craft Recipes for driedel

minetest.register_craft({
	output = 'christmas:driedel_wood',
	recipe = {
		{'default:stick',},
		{'default:wood',},
	}
})

minetest.register_craft({
	output = 'christmas:driedel_blue',
	type = 'shapeless',
	recipe = {'christmas:driedel_wood', 'dye:blue',}
})
minetest.register_craft({
	output = 'christmas:driedel_gold',
	type = 'shapeless',
	recipe = {'christmas:driedel_wood', 'dye:green',}
})

minetest.register_craft({
	output = 'christmas:driedel_gray',
	type = 'shapeless',
	recipe = {'christmas:driedel_wood', 'dye:grey',},
})

minetest.register_craft({
	output = 'christmas:driedel_green',
	type = 'shapeless',
	recipe = {'christmas:driedel_wood', 'dye:dark_green',},
})

minetest.register_craft({
	output = 'christmas:driedel_red',
	type = 'shapeless',
	recipe = {'christmas:driedel_wood', 'dye:red',}
})

minetest.register_craft({
	output = 'christmas:driedel_yellow',
	type = 'shapeless',
	recipe = {'christmas:driedel_wood', 'dye:yellow',}
})
-- Snowman 

minetest.register_node('christmas:snowman_head', {
	description = 'Snowman Head',
	drawtype = 'nodebox',
	paramtype = 'light',
	tiles = {
		'christmas_snowman_head_top.png',
		'christmas_snowman_head_top.png',
		'christmas_snowman_head_front.png',
		'christmas_snowman_head_side.png',
		'christmas_snowman_head_side.png',
		'christmas_snowman_head_side.png',
	},

	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, 0.25, 0.3125},
		}
	},
	groups = {cracky = 2, crumbly = 2, choppy = 2, oddly_breakable_by_hand = 2, melts = 1, icemaker = 1},
	
	after_destruct = function(pos, oldnode)
		--use group melts = 1 to 'melt' the snowman into a water source, then check for the water source after dug to make sure
		--it wasn't just dug
		if minetest.get_node(pos).name == 'default:water_source' then
			--use 2 minetest.env:add_item calls because name = 'default:coal_lump 2' did not work.			
			minetest.add_item(pos, {name = 'default:coal_lump'})
			minetest.add_item(pos, {name = 'default:coal_lump'})
			-- check if Farming_plus installed and give carrot back instead of stick
			if minetest.get_modpath('farming_plus') then
				minetest.add_item(pos, {name = 'farming_plus:carrot_item'})
			else
				minetest.add_item(pos, {name = 'default:stick'})
			end
			-- replace water_source with water_flowing after items are given. this replicates the snowman 'melting'
			minetest.add_node(pos, {name = 'default:water_flowing'})
		end
	end,
})
	
minetest.register_node('christmas:snowman_middle', {
	description = 'Snowman Middle',
	tiles = {
		'christmas_snowman_side.png',
		'christmas_snowman_side.png',
		'christmas_snowman_middle_buttons.png',
		'christmas_snowman_side.png',
		'christmas_snowman_side.png',
		'christmas_snowman_side.png',
	},
	groups = {cracky = 2, crumbly = 2, choppy = 2, oddly_breakable_by_hand = 2, melts = 1, icemaker = 1},
	after_destruct = function(pos, oldnode)
		--use group melts = 1 to 'melt' the snowman into a water source, then check for the water source after dug to make sure
		--it wasn't just dug
		if minetest.get_node(pos).name == 'default:water_source' then
			--use 3 minetest.env:add_item calls because name = 'default:coal_lump 3' did not work.			
			minetest.add_item(pos, {name = 'default:coal_lump'})
			minetest.add_item(pos, {name = 'default:coal_lump'})
			minetest.add_item(pos, {name = 'default:coal_lump'})
			-- replace water_source with water_flowing after items are given. this replicates the snowman 'melting'
			minetest.add_node(pos, {name = 'default:water_flowing'})
		end
	end,
})

minetest.register_node('christmas:snowman_bottom', {
	description = 'Snowman Bottom',
	tiles = {'christmas_snowman_side.png'},
	groups = {cracky = 2, crumbly = 2, choppy = 2, oddly_breakable_by_hand = 2, melts = 1, icemaker = 1},

	-- snow will not replace with water_flowing on melt 2 like it should so we work around it until they fix it.
	after_destruct = function(pos, oldnode)
		if minetest.get_node(pos).name == 'default:water_source' then
			minetest.add_node(pos, {name = 'default:water_flowing'})
		end
	end,
})
--register craft recipes

-- check for farming plus and use carrot instead of stick

if minetest.get_modpath('farming_plus') then
	minetest.register_craft({
		output = 'christmas:snowman_head',
		recipe = {
			{'default:coal_lump', 'default:snow       ', 'default:coal_lump'},
			{'default:snow     ', 'farming_plus:carrot_item', 'default:snow     '},
			{'default:snow     ', 'default:snow       ', 'default:snow     '},
		}
	})
else
	minetest.register_craft({
		output = 'christmas:snowman_head',
		recipe = {
			{'default:coal_lump', 'default:snow ', 'default:coal_lump'},
			{'default:snow     ', 'default:stick', 'default:snow     '},
			{'default:snow     ', 'default:snow ', 'default:snow     '},
		}
	})
end

minetest.register_craft({
	output = 'christmas:snowman_middle',
	recipe = {
		{'default:snow', 'default:coal_lump', 'default:snow'},
		{'default:snow', 'default:coal_lump', 'default:snow'},
		{'default:snow', 'default:coal_lump', 'default:snow'},
	}
})

minetest.register_craft({
	output = 'christmas:snowman_bottom',
	recipe = {
		{'default:snow', 'default:snow', 'default:snow'},
		{'default:snow', '            ', 'default:snow'},
		{'default:snow', 'default:snow', 'default:snow'},
	}
})

minetest.register_craft({
	output = 'christmas:present_red',
	type = 'shapeless',
	recipe =  {'default:chest', 'dye:red'}
})

minetest.register_craft({
	output = 'christmas:present_yellow',
	type = 'shapeless',
	recipe = {'default:chest', 'dye:yellow'}
})

minetest.register_craft({
	output = 'christmas:present_green',
	type = 'shapeless',
	recipe = {'default:chest', 'dye:dark_green'}
})
