var inst = instance_create_layer(x, y + 5, "Instances", obj_player);
camera_set_view_target(view_camera[0], inst);
image_index = image_number - 1;
image_speed = 0;