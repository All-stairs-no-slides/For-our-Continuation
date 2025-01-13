// this is a variable that the legs bullets will access upon death to place data
bullet_closeness = []

paths = [base_1_path]

in_path = false

// choose health
switch(head){
	case enemy_body_1_spr:
		en_health = 20
	break;
}

en_max_health = en_health

// setup the function for the pathing the enemy will take
function pathing(_path){
	switch(_path){
		case 0:
			if(!in_path){
				path_end()
				path_start(paths[0], 2, path_action_restart, false)
				in_path = true
			}
		break;
		
		case 1:
			in_path = false
			if(mp_potential_step(player.x, player.y, 3, false)){
				
			}
		break;
	}
	
}

state = "passive"
pathing(0)

// setup the other body parts setting spr_g to alll of the individual guns that it will use, and the body portion to the sprite stored in head
sprite_index = leg
e_gun = instance_create_layer(x, y-((sprite_height/2)), "bodies", enemy_gun_obj, {
	spr_g : gun,
	legs : self.id,
})

e_bod = instance_create_layer(x, (y-((sprite_height/2) - 10)), "bodies", enemy_body_obj, {
	sprite_index : head,
	legs: self.id,
})


// put the enemy in a place that isnt colliding with anything else
//var _hi = 0
while(collision_circle(x, y, sprite_height * 1.5, collider_obj, false, true)){
	x = 100 + (random(room_width - 155))
	y = 100 + (random(room_height - 160))
	//show_message("stuck")
	//_hi += 1
}
//show_debug_message(_hi)