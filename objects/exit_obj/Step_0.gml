/// @description Insert description here
// You can write your code in this editor



if (sqrt((sqr(player.x - x)) + sqr(player.y - y)) < 200 ){
	d = true
	if(keyboard_check_pressed(ord("E"))){
		
		room_goto(fight_1_rm)
		
		player.x = 303
		player.y = 316

		main.spawn = true

	}
}
