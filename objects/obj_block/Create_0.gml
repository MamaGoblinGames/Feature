/// @description start glitch timer

glitching = -1;
text = "";
pickedEdges = false;

image_yscale = 10/24;
image_xscale = 10/24;
alarm_set(0, irandom_range(global.glitchDelayMin,global.glitchDelayMax)*room_speed);