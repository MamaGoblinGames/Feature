/// @description start glitch timer

glitching = -1;
text = "";
pickedEdges = false;

alarm_set(0, irandom_range(global.glitchDelayMin,global.glitchDelayMax)*room_speed);