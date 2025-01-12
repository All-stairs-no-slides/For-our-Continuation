function fire(_i, diff){
	// _i refers to the guns index, while diff refers to the difference between desired and current angle
	if (diff < 5 and diff > -5) {
		if(canshoot[_i]){
			canshoot[_i] = false
			//show_debug_message("hi")
			alarm[_i] = durs[_i] * game_get_speed(gamespeed_fps)
			image_index = (max(8, image_index % 13))
			var bul = instance_create_layer(x - 20 + (32 * (_i < floor(array_length(canshoot)/2))), y - (30 * (floor(_i/2) + 1)), "bullets", bullet_obj, {
				sprite_index : gat_bul_spr,
				image_angle : i_angles[_i],
				type : spr_g[_i],
				speed : 5,
				legs: legs.id,
			})
		}
	}
}

// enemy finite state automata
switch (state){
	case "passive":
		image_index = 0
	break;
	
	
	// contains code for shooting, and rotating the guns to face the player
	case "aggressive":
		image_index = (max(2, image_index % 7))
		if(!collision_line(x, y, player.x, player.y, wall_obj, true, true))
		{
			for (var _i = 0; _i < array_length(canshoot); _i++;) {
				var diff = angle_difference(i_angles[_i], point_direction(x - 20 + (32 * (_i < floor(array_length(canshoot)/2))), y - (30 * (floor(_i/2) + 1)), player.x, player.y + 20))
				// for non-rotating guns
				if(r_speeds[_i] == 0){
					diff = 0
				}
				// rotate rotating guns if need be
				if (diff < 0){
					i_angles[_i] += 1
				} else if(diff > 0) {
					i_angles[_i] -= 1
				}
				
				fire(_i, diff);
			}
		}
	break;
}

