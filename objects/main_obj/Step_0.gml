/// @description Insert description here
// You can write your code in this editor
if(room == home_rm){
	//show_debug_message("hoi");
}



// all enemies in room dead
if(ens == 0){
	//show_message("hi")
	ens = 1
	global.en_credits += 10
	var _exit = instance_create_layer(floor(room_width / 2), floor(room_height / 2), "Exits", exit_obj)
	var _depth_sorter = instance_find(collider_depth_sorter_obj, 0);
	_depth_sorter.colliders[array_length(_depth_sorter.colliders)] = _exit;
}
 

// spawn enemies
if (spawn){
	first_room_spawner()
	instance_create_layer(0, 0, "Instances", collider_depth_sorter_obj);
	spawn = false
	entered += 1
}

// pause
if(keyboard_check_pressed(ord("P"))){
	if(!paused){
		paused = true
	} else {
		paused = false
		instance_activate_all()
	}
}

// paused
if(paused){
	instance_deactivate_all(true)
	instance_activate_layer("pause_menu")
}
// this is the old room
oroom = room

// player dead
if(health <= 0){
	draw_clear(c_black);
	room_goto(end_screen_rm)
	instance_destroy()
	instance_destroy(player)
	
	for (var _i = 0; _i < instance_number(gun_par_obj); ++_i;)
	{
	
	    instance_destroy(instance_find(gun_par_obj, _i));
	}
	
	
}