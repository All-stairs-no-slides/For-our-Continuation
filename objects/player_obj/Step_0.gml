//var _sorter = instance_find(collider_depth_sorter_obj, 0)

//show_debug_message(array_get_index(_sorter.colliders, id))


// for switching sprite direction
var _x_mov = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * _hspd

var _y_mov = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * _vspd

if(_x_mov != 0 ) {
	if(_hspd != max_spd){
		_hspd += 0.1
	}
} else {
	_hspd = 1
}

if(_y_mov != 0) {
	if(_vspd != max_spd){
		_vspd += 0.1
	}
} else {
	_vspd = 1
}

if(_vspd == 1 and _hspd  == 1){
	image_index = 1
}

if(keyboard_check_pressed(vk_shift) && can_dash){
	can_dash = false
	dash = 3
	alarm[0] = 0.1 * game_get_speed(gamespeed_fps)
	alarm[1] = 0.6 * game_get_speed(gamespeed_fps)
}

move_and_collide(dash * (_x_mov * (1 - (_y_mov != 0)/4)), dash * (_y_mov * (1 - (_x_mov != 0)/4)), collider_obj)
var _dir = point_direction(x, y, mouse_x, mouse_y)

// point right
if(45 > _dir  or _dir  >= 315){
	image_index = (max(24, image_index))
	
	face_state = 0
	
// point up
} else if(45 <= _dir  and _dir  <= 135){
	image_index = image_index % 8
	face_state = 1

	
	
// point left
} else if(135 < _dir  and _dir  <= 225){
	image_index = (max(17, image_index % 24))
	face_state = 2

	
// point down
} else if(225 < _dir  and _dir  < 315){
	image_index = (max(9, image_index % 16))
	face_state = 3
}