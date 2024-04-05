/// @description Insert description here
// You can write your code in this editor

// check if it spawned in the location of another enemy, and place it somewhere else


state = "passive"
canshoot = array_create(array_length(spr_g), false)

// durations between each shot
durs = []

for (i=0; i < array_length(spr_g); i++){
	switch(spr_g[i]){ 
		case enemy_gun_gat_spr:
			dur[i] = 0.25
			alarm[i] = i+1 * game_get_speed(gamespeed_fps)
			break;
		case en_gun_pea_spr:
			dur[i] = 2
			alarm[i] = i+1 * game_get_speed(gamespeed_fps)
			break;
		case enemy_gun_sprayer_spr:
			dur[i] = 2
			alarm[i] = i+1 * game_get_speed(gamespeed_fps)
			break;
	}
}



// below s the initialisation of all of the particle affects that go near the gun connection
ps = []

ps[0] = part_system_create();
part_system_draw_order( ps[0], true);

var ptype1 = part_type_create();
part_type_sprite( ptype1, elec_spr, false, true, false)
part_type_size( ptype1, 0.01, 3, 0, 0 );
part_type_scale( ptype1, 0.15, 0.15);
part_type_speed( ptype1, 0, 0, 0, 0);
part_type_direction( ptype1, 0, 360, 0.1, 0);
part_type_gravity( ptype1, 0, 270);
part_type_orientation( ptype1, 0, 360, 0, 0, false);
part_type_colour3( ptype1, $FFC119, $FF1111, $F132FF );
part_type_alpha3( ptype1, 1, 0.439, 0);
part_type_blend( ptype1, true);
part_type_life( ptype1, 10, 10);

pemit1 = part_emitter_create( ps[0] );
part_emitter_region( ps[0], pemit1, -5.638466, 5.638466, -4.7618713, 4.7618713, ps_shape_ellipse, ps_distr_gaussian );
part_emitter_stream(ps[0], pemit1, ptype1, 9);

for (var _i = 1; _i < array_length(spr_g); _i++)
{
	ps[_i] = part_system_create();
	part_system_draw_order( ps[_i], true);

	pemit1 = part_emitter_create( ps[_i] );
	part_emitter_region( ps[_i], pemit1, -5.638466, 5.638466, -4.7618713, 4.7618713, ps_shape_ellipse, ps_distr_gaussian );
	part_emitter_stream(ps[_i], pemit1, ptype1, 9);
}

