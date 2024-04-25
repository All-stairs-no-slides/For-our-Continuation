/// @description Insert description here
// You can write your code in this editor

for(var _i = 0; _i < array_length(ps); _i++){
	part_particles_clear(ps[_i])
	part_emitter_destroy_all(ps[_i])
}


main.ens -= 1

//instance_create_layer(x, y - 5, "dead_bodies", dead_en_obj)

