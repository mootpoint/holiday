-- Christmas Foods and cookies

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
]]--
-----------------------------
-- Register Cookie Cutters --
-----------------------------

minetest.register_craftitem('christmas:candy_cane_cutter', {
	description = 'Candy Cane Cookie Cutter',
	inventory_image = 'christmas_candy_cane_cutter.png',
})

minetest.register_craftitem('christmas:tree_cutter', {
	description = 'Christmas Tree Cookie Cutter',
	inventory_image = 'christmas_tree_cutter.png',
})

minetest.register_craftitem('christmas:gingerbread_man_cutter', {
	description = 'Gingerbread Man Cookie Cutter',
	inventory_image = 'christmas_gingerbread_man_cutter.png',
})

minetest.register_craftitem('christmas:star_cutter', {
	description = 'Star Cookie Cutter',
	inventory_image = 'christmas_star_cutter.png',
})

----------------------
-- Register Cookies --
----------------------

minetest.register_craftitem('christmas:candy_cane_cookie', {
	description = 'Candy Cane Cookie',
	inventory_image = 'christmas_candy_cane_cookie.png',
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem('christmas:tree_cookie', {
	description = 'Christmas Tree Cookie',
	inventory_image = 'christmas_tree_cookie.png',
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem('christmas:gingerbread_man_cookie', {
	description = 'Gingerbread Man Cookie',
	inventory_image = 'christmas_gingerbread_man_cookie.png',
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem('christmas:star_cookie', {
	description = 'Star Cookie Cutter',
	inventory_image = 'christmas_star_cookie.png',
	on_use = minetest.item_eat(3),
})

-----------------------
-- Register Yule Log --
-----------------------

minetest.register_craftitem('christmas:yule_log', {
	description = 'Yule Log',
	inventory_image = 'christmas_yule_log.png',
	on_use = minetest.item_eat(4),
})

-------------------------------
-- Register Crafting Recipes --
-------------------------------

if minetest.get_modpath('moreores') then
	minetest.register_craft({
		output = 'christmas:candy_cane_cutter',
		type = 'shapeless',
		recipe = {'moreores:tin_ingot'},
	})
else
	minetest.register_craft({
		output = 'christmas:candy_cane_cutter',
		type = 'shapeless',
		recipe = {'default:steel_ingot'},
	})
end

minetest.register_craft({
	output = 'christmas:tree_cutter',
	type = 'shapeless',
	recipe = {'christmas:candy_cane_cutter'},
})

minetest.register_craft({
	output = 'christmas:gingerbread_man_cutter',
	type = 'shapeless',
	recipe = {'christmas:tree_cutter'},
})

minetest.register_craft({
	output = 'christmas:star_cutter',
	type = 'shapeless',
	recipe = {'christmas:gingerbread_man_cutter'},
})

minetest.register_craft({
	output = 'christmas:candy_cane_cookie',
	type = 'shapeless',
	recipe = {'christmas:candy_cane_cutter', 'mtfoods:cookies'},
	replacements = {
		{ 'christmas:candy_cane_cutter', 'christmas:candy_cane_cutter' }
	}
})
minetest.register_craft({
	output = 'christmas:tree_cookie',
	type = 'shapeless',
	recipe = {'christmas:tree_cutter', 'mtfoods:cookies'},
	replacements = {
		{ 'christmas:tree_cutter', 'christmas:tree_cutter' }
	}
})

minetest.register_craft({
	output = 'christmas:gingerbread_man_cookie',
	type = 'shapeless',
	recipe = {'christmas:gingerbread_man_cutter', 'mtfoods:cookies'},
	replacements = {
		{ 'christmas:gingerbread_man_cutter', 'christmas:gingerbread_man_cutter' }
	}

})

minetest.register_craft({
	output = 'christmas:star_cookie',
	type = 'shapeless',
	recipe = {'christmas:star_cutter', 'mtfoods:cookies'},
	replacements = {
		{ 'christmas:star_cutter', 'christmas:star_cutter' }
	}

})

minetest.register_craft({
	output = 'christmas:yule_log',
	type = 'shapeless',
	recipe = {'mtfoods:chocolate_cake', 'mtfoods:cream'}
})

