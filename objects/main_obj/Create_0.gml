//*****************************
// setup vars
//*****************************

// this is the data that shall be piped into the ML model
closeness_data = []

paused = false;

entered = 0

// enemies alive set to 1 initially so that they dont set off the enemies all dead sequence at home_rm
ens = 1

spawn = false

hp_max = 100
health = 100

oroom = room
depth = 0

global.en_credits = 10

//*************************
// functionalities below
//*************************
if(audio_is_paused(start_screen_sd) || !audio_is_playing(start_screen_sd)){
	audio_play_sound(main_hub_sd, 0, true)
	show_debug_message("hi")
}


// **************************
// methods below
//***************************

// spawn enemies in the first room
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

// save the closeness data to a txt file


function ship_data()
{
	var _output = [["Body", "Legs", "Used Gun", "Clossest Dist"]]
	var _iter = 1
	// loops over all the enemies
	for(var _i = 0; _i < array_length(closeness_data); _i++)
	{
		var _en_leg = sprite_get_name(closeness_data[_i][0])
		var _en_bod = sprite_get_name(closeness_data[_i][1])
		// loops over all of the bullets
		for(var _j = 0; _j < array_length(closeness_data[_i][2]); _j++)
		{
			_output[_iter] = [_en_bod, _en_leg, sprite_get_name(closeness_data[_i][2][_j][1]), closeness_data[_i][2][_j][0]]
			_iter++
		}
	}
	// trim up the data
	_output = string_replace_all(string(_output), "[", "")
	_output = string_delete(_output, 0, 2)
	_output = string_delete(_output, string_length(_output) - 2, 4)
	_output = string_replace_all(_output, " ], ", "\n")
	_output = string_replace_all(_output, "\"", "")
	// save the data
	var _file = file_text_open_write(game_save_id + "data.csv")
	file_text_write_string(_file, string(_output))
	file_text_close(_file)
	show_debug_message(game_save_id + "data.csv")
	// do ML stuff
	if(room != home_rm){
		show_debug_message("starto")
		show_debug_message(EnemySelection("data.csv"))
	}
}


