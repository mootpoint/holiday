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
	groups = {cracky = 1}
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
	groups = {cracky = 1}
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
	groups = {cracky = 1}
})
