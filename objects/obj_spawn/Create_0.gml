global.spawnx = x;
global.spawny = y;
image_yscale = -1;
image_xscale = -1;
instance_create_layer(x, y, "Instances", obj_player);
var folder = instance_create_layer(x, y, "Level", obj_folderback);
folder.image_yscale = -1;
image_index = 3;