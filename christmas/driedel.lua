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
	output = 'christmas:driedel_blue',
	type = 'shapeless',
	recipe = {'christmas:driedel_wood', 'dye:blue',}

})

minetest.register_craft({
	output = 'christmas:driedel_wood',
	type = 'shapeless',
	recipe = {'christmas:snowman_head', 'default:cobble',}

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
