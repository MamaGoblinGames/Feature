/// @description glitch

if (glitching > 0) {
	image_alpha = random_range(global.glitchAlphaMin,global.glitchAlphaMax);
	glitching--;
} else if (glitching == 0) {
	image_alpha = 1;
	glitching = -1;
	alarm_set(0, irandom_range(global.glitchDelayMin,global.glitchDelayMax)*room_speed);
}
