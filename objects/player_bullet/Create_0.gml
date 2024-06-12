// adding bullet to the depth sorting
depth_sorter = instance_find(collider_depth_sorter_obj, 0);
depth_sorter.colliders[array_length(depth_sorter.colliders)] = self;
