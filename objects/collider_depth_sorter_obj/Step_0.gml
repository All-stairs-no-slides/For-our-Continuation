/// @description Insert description here
// You can write your code in this editor

//sort the objects based on "y"
for (var _i = 0; _i < array_length(colliders); _i++;){
	var _sw = false
	for(var _j = 0; _j < (array_length(colliders) - _i - 1); _j++;){
		var _first = colliders[_j]
		//show_debug_message(_first.y)
		//show_debug_message(colliders[_j+1])
		if(_first.y < colliders[_j+1].y){
			
			colliders[_j] = colliders[_j + 1]
			colliders[_j + 1] = _first
			
			_sw = true
		}
	}
	if (_sw == false){
		break;
	}
}

for(var _l = 0; _l < array_length(colliders); _l++;){
	if(colliders[_l].ass_depth == false){
		colliders[_l].depth = layer_get_depth("Instances") + (_l * 2)
	}
}