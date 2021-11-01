//Move
if (keyboard_check(vk_right)) {
	sprite_index = spr_walkright;
	x += 1;
}
else if (keyboard_check(vk_left)) {
	sprite_index = spr_walkright;
	x -= 1;
}
else {
	sprite_index = spr_idleright;
}