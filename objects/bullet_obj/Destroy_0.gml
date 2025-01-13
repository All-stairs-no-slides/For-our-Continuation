// delete from depth sorthing
var _sorter = instance_find(collider_depth_sorter_obj, 0)
array_delete(_sorter.colliders, array_get_index(_sorter.colliders, self), 1);

// add its closest distance 
if(instance_exists(legs)){
	show_debug_message(closest_point)
	legs.bullet_closeness[array_length(legs.bullet_closeness)] = [closest_point, type]
}
//show_debug_message(legs.bullet_closeness)

