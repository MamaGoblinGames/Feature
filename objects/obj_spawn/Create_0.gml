global.spawnx = x;
global.spawny = y;
image_yscale = -1;
image_xscale = -1;

var folder = instance_create_layer(x, y, "Level", obj_folderback);
folder.image_yscale = -1;
image_index = 3;

camera_set_view_target(view_camera[0], folder);

alarm_set(0, spawnDelay*room_speed);