/// @description Insert description here
// You can write your code in this editor
entered = 0

ens = 1

spawn = false

health = 100

global.en_credits = 10


function first_room_spawner(){
	prev_c = global.en_credits
	bod = 0
	leg = 0
	// gs stores the random number, which is then matched to what it would be after weighting is conscidered
	gs = []
	// weights of each gun (based on the positions of the guns within the var _the_guns array at the end of the function
	gun_w = [1, 2, 3];
	overall_w = 0;
	
	// for the while loop (the while loop will break when credits is 0, however an iterator is also needed)
	var _i = 0
	
	// main while loop
	while(global.en_credits > 0){
		// a switch to allow for each type of bodies maximum amount of guns per type of body
		switch(bod){
			case 0:
				for(var _j = 0; _j < 2; _j++){
					overall_w = 0
					
					// create a variale with the sum of the total weights of all the guns
					for(var _s = 0; _s < array_length(gun_w); _s++){
						if(gun_w[_s] <= global.en_credits){
							overall_w += gun_w[_s] 
						}
					}
					
					// generate random number with overall weight (+ 0.99 so that the last occurence can be taken into account)
					gs[_i][_j] = floor(random(overall_w + 0.99))
					var _tmp = 0
					
					// the below loop is to find what the random number correlates to if unweighted (find out the index of the gun)
					for (var _k = 0; _k < array_length(gun_w); _k++){
						_tmp += gun_w[_k]
						
						if(gs[_i][_j] <= _tmp){
							gs[_i][_j] = _k

							break;
						}
					}
	
					// to go towards ending the while loop
					global.en_credits -= gun_w[gs[_i][_j]]

				}
				
			break;
		}
		_i++
	}
	
	var _the_guns =  [en_gun_pea_spr, enemy_gun_gat_spr, enemy_gun_sprayer_spr]
	
	// below matches the index found above the the weighted random search to the sprite
	for(var _b = 0; _b < array_length(gs); _b++){
		for(var _v = 0; _v < array_length(gs[_b]); _v++){
			gs[_b][_v] = _the_guns[gs[_b][_v]]
		}
	
	}
	// spawn the enemies
	ens = array_length(gs)
	for(var _c = 0; _c < ens; _c++){
		instance_create_layer(100 + (random(room_width - 200)), 100 + (random(room_height - 200)), "legs", enemy_base_obj, {
			gun :gs[_c],
		})
	}
	//show_message(global.en_credits)
	global.en_credits = prev_c
	
}


oroom = room