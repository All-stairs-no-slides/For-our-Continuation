/// @description Insert description here
// You can write your code in this editor
guns = []
var _c = ceil(array_length(spr_g)/2)

//h = 0
for (var _i = 1; (_i - 1) < array_length(spr_g); _i++){
	part_system_depth(ps[_i - 1], depth + 1)
	part_system_position(ps[_i - 1], x - 20 + (32 * (_i % 2 )), y - (30 * (ceil(_i/2))));
	
	
	draw_sprite_ext(spr_g[_i - 1], image_index,x - 20 + (32 * (_i % 2 )), y - (30 * (ceil(_i/2))), 1, 1, i_angles[_i - 1], c_white, 1)
}

//show_message(h)

