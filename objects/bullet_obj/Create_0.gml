// set the closest point to the largest number for future comparission
closest_point = infinity
// add to depth sorting
depth_sorter = instance_find(collider_depth_sorter_obj, 0);
depth_sorter.colliders[array_length(depth_sorter.colliders)] = self;

// the state machine 4 hat typ of bullte it is
// type refers to the ggun that shot the bullet
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
							legs: legs,
						})
		}
	break;
	case spray_bul_spr:
		sprite_index = spray_bul_spr
		damage = 1
	break;
}