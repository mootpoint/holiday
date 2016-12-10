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

-- Register Crafting recipes for big presents


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
