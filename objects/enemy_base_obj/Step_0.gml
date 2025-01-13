/// @description Insert description here
// You can write your code in this editor
speed = 0

//effect_create_above(robot_con_par, x, y, 10, c_white)
e_gun.x = x
e_gun.y = y - ((sprite_height/2)) + 5
e_bod.x = x
e_bod.y = y - ((sprite_height/2) - 10)
if(en_health <= 0){
	state = "death";
}

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
		// check the create event to see how it works
		pathing(1)
		break;
	case "death":
		//var ps = part_system_create();
		//part_system_draw_order( ps, true);

		//var ptype1 = part_type_create();
		//part_type_shape( ptype1, pt_shape_line );
		//part_type_size( ptype1, 0.01, 2, 0, 0 );
		//part_type_scale( ptype1, 0.4, 0.4);
		//part_type_speed( ptype1, 20, 20, 0, 0);
		//part_type_direction( ptype1, 0, 360, 0, 0);
		//part_type_gravity( ptype1, 0, 351);
		//part_type_orientation( ptype1, 0, 0, 0, 0, true);
		//part_type_colour3( ptype1, $FFFFFF, $000000, $000000 );
		//part_type_alpha3( ptype1, 0.427, 1, 0);
		//part_type_blend( ptype1, true);
		//part_type_life( ptype1, 10, 10);

		//var pemit1 = part_emitter_create( ps );
		//part_emitter_region( ps, pemit1, -24.1193, 24.1193, -23.272636, 23.272636, ps_shape_ellipse, ps_distr_linear );
		//part_emitter_stream(ps, pemit1, ptype1, 1);

		//part_system_position(ps, x, y);

		var _sorter = instance_find(collider_depth_sorter_obj, 0)
	 	array_delete(_sorter.colliders, array_get_index(_sorter.colliders, id), 1);
		instance_destroy()
		instance_destroy(e_gun)
		instance_destroy(e_bod)
		break;		
}






