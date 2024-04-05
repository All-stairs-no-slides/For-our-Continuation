/// @description Insert description here
// You can write your code in this editor
// show_debug_message(type)



switch(type){
	case enemy_gun_gat_spr:
		direction = point_direction(x, y, player.x, player.y)
		sprite_index = gat_bul_spr
		damage = 2
	break;
	case en_gun_pea_spr:
		direction = point_direction(x, y, player.x, player.y)
		sprite_index = pea_bul_spr
		damage = 5
	break;
	case enemy_gun_sprayer_spr:
		for(var i = 0; i < 8; i++){
			damage = 0

			var bul = instance_create_layer(x , y, "bullets", bullet_obj, {
							sprite_index : spray_bul_spr,
							direction : ceil(random(360)),
							type : spray_bul_spr,
							speed : 5,
						})
		}
	break;
	case spray_bul_spr:
		sprite_index = spray_bul_spr
		damage = 1
	break;
}








