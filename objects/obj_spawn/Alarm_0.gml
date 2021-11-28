/// @description spawn player and target camera at player

var inst = instance_create_layer(x, y, "Instances", obj_player);
camera_set_view_target(view_camera[0], inst);