/// @description start glitch timer

glitching = -1;
text = "";
alarm_set(0, irandom_range(global.glitchDelayMin,global.glitchDelayMax)*room_speed);
