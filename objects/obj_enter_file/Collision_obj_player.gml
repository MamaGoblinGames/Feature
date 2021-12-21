/// @description show inside of file

if (not innerRoomTriggered) {
	innerRoomTriggered = true;
	view_set_visible(innerRoomIndex, true);
	with(other) {
		x = global.innerFileSpawnX;
		y = global.innerFileSpawnY;
		camera_set_view_target(view_camera[0], noone);
		camera_set_view_target(view_camera[1], id);
	}
	focalPointX = x - camera_get_view_x(view_camera[0])*(camera_get_view_width(view_camera[0])/view_wport[0]);
	focalPointY = y - camera_get_view_y(view_camera[0])*(camera_get_view_height(view_camera[0])/view_hport[0]);
	alarm_set(0, 1);
}