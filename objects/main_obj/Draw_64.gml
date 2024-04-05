/// @description Insert description here
// You can write your code in this editor

if (room != es){
	draw_set_halign(fa_left)
	draw_set_color(c_red)
	draw_text(32, 32, "HEALTH: ")
	draw_set_color(c_grey)
	draw_text_transformed(32, 48, health, 2, 2, 0)
} else {
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(c_red)
	draw_text(room_width/2, room_height/2 - 50, "Thanks for playing my game")
	draw_set_color(c_grey)
	draw_text_transformed(room_width/2, room_height/2, "sorry it was so bad, I was on holiday with my family while making it \n and had to cut quite a few ideas :)", 2, 2, 0)
}







