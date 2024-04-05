image_angle = point_direction(x, y, mouse_x, mouse_y)

visible = true
// firing state machine
switch(fire_state){
	// neutral
	case 0:
		image_index = 0
		if (mouse_check_button_pressed(mb_left)){
			fire_state = 1
		}
		break;
	
	// playsound
	case 1:
		audio_play_sound(gat_g_sd, 1, false)
		image_index = 0
		fire_state = 2
		break;
	
	// firing
	case 2:
		if(image_index < 6){
			break;
		}
		instance_create_layer(x, y, "bullets", bullet_t, {
			direction : point_direction(x, y, mouse_x, mouse_y),
			speed : bullet_spd,
		})
		fire_state = 3
		break;
		
	// recovery
	case 3:
		if(image_index == 1){
			fire_state = 0
		}
		break;
}