/// @description start glitch timer

glitching = -1;
text = "";
pickedEdges = false;
emptysprite = noone;

alarm_set(0, irandom_range(global.glitchDelayMin,global.glitchDelayMax)*room_speed);