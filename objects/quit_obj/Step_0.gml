/// @description Insert description here
// You can write your code in this editor

//show_debug_message("hi")
image_index = state
if((x + sprite_width) > mouse_x && mouse_x > x && (y + sprite_height) > mouse_y && mouse_y > y)
{
	if(mouse_check_button_released(mb_left))
	{
		game_end()
	}
	if(mouse_check_button_pressed(mb_left))
	{
		state = 1
	}
}



 







