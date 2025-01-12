
image_angle = point_direction(player.x, player.y, mouse_x, mouse_y)

visible = true
// firing state machine
switch(fire_state){
	// neutral
	case 0:
		image_index = 0
		if(ammo == 0){
			fire_state = 4	
		}
		
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
			direction : point_direction(player.x, player.y, mouse_x, mouse_y),
			speed : bullet_spd,
		})
		ammo -= 1 
		fire_state = 3
		break;
		
	// recovery
	case 3:
		if(image_index == 1){
			fire_state = 0
		}
		break;
		
	case 4:
		image_index = 0
		if(!audio_is_playing(reload_gunarm_sd))
		{
			ammo += 1
			if(ammo == ammo_max)
			{
				fire_state = 0
			}
			audio_play_sound_ext(
				{
					sound: reload_gunarm_sd,
					pitch: 7, 
					gain: 1
				}
			)
		}
		
		break;
}

var _px = player.x
var _py = player.y
var _dir = point_direction(_px, _py, mouse_x, mouse_y)
//endefector origin (diff from the hand (the y was a 0 diff))
var _xorigin = 23

// change pos for rotation
// as the second bit would always -0 i just didnt include it 2 save resources
x = (_xorigin * (cos(degtorad(_dir))))
// first bit excluded here 4 same reason
y = -(_xorigin * (sin(degtorad(_dir))))

// reassign pos based on player positio
switch(player.face_state){
	case 0:
		ass_depth = true
		x += _px + 5
		y += _py - 13
		depth = player.depth + 1
		image_yscale = 1
		break;
		
	case 1:
		ass_depth = true
		x += _px - 13
		y += _py - 6
		depth = player.depth + 1
		image_yscale = 1
		break;
		
	case 2:
		ass_depth = true

		x += _px 
		y += _py - 2
		depth = player.depth - 1
		image_yscale = -1
		break;
		
	case 3:
	
		ass_depth = false
		
		x += _px + 13
		y += _py - 4
		image_yscale = 1
		break;
}



