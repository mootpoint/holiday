--christmas

-- part of the holiday modpack written by Tucker Bamberg AKA 'mootpoint' and John Cole AKA 'Foz'

-- liscened under lgpl v3. File to follow

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
})

minetest.register_node('christmas:snowman_bottom', {
	description = 'Snowman Bottom',
	tiles = {'christmas_snowman_side.png'},
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
