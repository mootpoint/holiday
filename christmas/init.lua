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
	groups = {oddly_breakable_by_hand = 3},
	
})

minetest.register_node('christmas:snowman_head', {
	description = 'Snowman Head',
	drawtype = 'nodebox',
	paramtype = "light",
	tiles = {
		'christmas_snowman_head_top.png',
		'christmas_snowman_head_top.png',
		'christmas_snowman_head_front.png',
		'christmas_snowman_head_side.png',
		'christmas_snowman_head_side.png',
		'christmas_snowman_head_side.png',
	},
	groups = {oddly_breakable_by_hand = 1},

	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, 0.25, 0.3125},
		}
	},
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
	groups = {oddly_breakable_by_hand = 1},
})

minetest.register_node('christmas:snowman_bottom', {
	description = 'Snowman Bottom',
	tiles = {'christmas_snowman_side.png'},
	groups = {oddly_breakable_by_hand = 1},
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
