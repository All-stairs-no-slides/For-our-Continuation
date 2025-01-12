
var _blend = c_black
if (room != end_screen_rm){
	if(player.can_dash)
	{
		_blend = c_grey
	}
	draw_sprite_stretched(inner_healthbar_spr, 0, camera_get_view_x(view_get_camera(0)) + 40,  camera_get_view_y(view_get_camera(0)) + 40, (health/hp_max) * 57, 9)
	//show_debug_message(camera_get_view_x(view_get_camera(0)))
	draw_sprite(health_bar_spr, 0, camera_get_view_x(view_get_camera(0)) + 40, camera_get_view_y(view_get_camera(0)) + 40)
	draw_sprite_ext(sprint_indicator_spr, 0, camera_get_view_x(view_get_camera(0)) + 650 , camera_get_view_y(view_get_camera(0)) + 300 , 1, 1, 0, _blend,1)
}













