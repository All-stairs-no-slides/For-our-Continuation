/// @description Insert description here
// You can write your code in this editor
//show_message(sprite_height)

//show_message(collision_circle(x, y, sprite_height * 2, collider_obj, false, true))


paths = [base_1_path]

in_path = false

switch(head){
	case enemy_body_1_spr:
		en_health = 20
	break;
}

function pathing(_path){
	switch(_path){
		case 0:
			if(!in_path){
				path_end()
				//path_start(paths[0], 2, path_action_restart, false)
				in_path = true
			}
		break;
		
		case 1:
			in_path = false
			//if(mp_potential_step(player.x, player.y, 3, false)){
				
			//}
		break;
	}
	
}

state = "passive"
pathing(0)

sprite_index = leg
e_gun = instance_create_layer(x, y-((sprite_height/2)), "bodies", enemy_gun_obj, {
	spr_g : gun,
	legs : self,
})

e_bod = instance_create_layer(x, (y-((sprite_height/2) - 10)), "bodies", enemy_body_obj, {
	sprite_index : head,
})

//show_message(sprite_width)
while(collision_circle(x, y, sprite_height, collider_obj, false, true)){
	x = 100 + (random(room_width - 155))
	y = 100 + (random(room_height - 160))
	//show_message("stuck")
	
}

//path_start(Path1, 2, path_action_reverse, false)