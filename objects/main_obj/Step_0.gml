/// @description Insert description here
// You can write your code in this editor

if(health <= 0){
	room_goto(es)
}

if(ens == 0){
	//show_message("hi")
	ens = 1
	global.en_credits += 10
	instance_create_layer(floor(room_width / 2), floor(room_height / 2), "Exits", exit_obj)
}

if (spawn){
	first_room_spawner()
	spawn = false
	entered += 1
}

oroom = room



