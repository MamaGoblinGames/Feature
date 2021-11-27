if (collision_circle(x, y, 2 * block, obj_player, false, false)) {
	image_index = 3;
}
else if (collision_circle(x, y, 4 * block, obj_player, false, false)) {
	image_index = 2;
}
else if (collision_circle(x, y, 6 * block, obj_player, false, false)) {
	image_index = 1;
}
else {
	image_index = 0;
}