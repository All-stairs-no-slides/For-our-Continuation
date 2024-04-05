/// @description Insert description here
// You can write your code in this editor


e_gun.x = x
e_gun.y = y - ((sprite_height/2)) + 5
e_bod.x = x
e_bod.y = y - ((sprite_height/2) - 10)

// enemy finite state automata
switch (state){
	case "passive":
		if(!collision_line(x, y, player.x, player.y, wall_obj, true, true))
		{
			path_end()
			e_gun.state = "aggressive"
			state = "aggressive"
		}
	break;
	
	case "aggressive":
		pathing(1)
	
	break;
	
		
		
}

if(en_health <= 0){
	instance_destroy()
	instance_destroy(e_gun)
	instance_destroy(e_bod)
}



