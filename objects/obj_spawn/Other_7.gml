var inst = instance_create_layer(x, y, "Instances", obj_player);
inst.y += 5;
camera_set_view_target(view_camera[0], inst);
image_index = image_number - 1;
image_speed = 0;
alarm_set(1, 1*room_speed);