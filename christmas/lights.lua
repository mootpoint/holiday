minetest.register_node('christmas:net_light', {
	decription = 'Net lights',
	tiles = {
		'christmas_net_light.png',
		'christmas_net_light.png',
		'christmas_net_light.png',
		'christmas_net_light.png',
		'christmas_net_light.png',
		'christmas_net_light.png',
	},
	drawtype = 'nodebox',
	paramtype = 'light',
	paramtype2 = 'facedir',
	light_source = 9,
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.46875},
		}
	}
})

minetest.register_node('christmas:net_light_small', {
	decription = 'Small Net lights',
	tiles = {
		'christmas_net_light_small.png',
		'christmas_net_light_small.png',
		'christmas_net_light_small.png',
		'christmas_net_light_small.png',
		'christmas_net_light_small.png',
		'christmas_net_light_small.png',
	},
	drawtype = 'nodebox',
	paramtype = 'light',
	paramtype2 = 'facedir',
	light_source = 9,
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.46875},
		}
	}
})

minetest.register_node('christmas:strip_light', {
	decription = 'Strip lights',
	tiles = {
		'christmas_strip_light.png',
		'christmas_strip_light.png',
		'christmas_strip_light.png',
		'christmas_strip_light.png',
		'christmas_strip_light.png',
		'christmas_strip_light.png',
	},
	drawtype = 'nodebox',
	paramtype = 'light',
	paramtype2 = 'facedir',
	light_source = 9,
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.46875},
		}
	}
})

