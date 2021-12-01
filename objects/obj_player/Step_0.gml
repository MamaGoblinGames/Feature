//Check for blocks
blockbelow = place_meeting(x, y + 1, obj_block);
blockabove = place_meeting(x, y - 1, obj_block);
blockright = place_meeting(x + 1, y, obj_block);
blockleft = place_meeting(x - 1, y, obj_block);
inblock = place_meeting(x, y, obj_block);

//Check for gswitches
gswitchbelow = place_meeting(x, y + 1, obj_gswitch);
gswitchabove = place_meeting(x, y - 1, obj_gswitch);

//Check for spdswitches
spdswitchbelow = place_meeting(x, y + 1, obj_spdswitch);
spdswitchabove = place_meeting(x, y - 1, obj_spdswitch);

//Check for jumpswitches
jumpswitchbelow = place_meeting(x, y + 1, obj_jumpswitch);
jumpswitchabove = place_meeting(x, y - 1, obj_jumpswitch);

//Check for blockswitches
blockswitchbelow = place_meeting(x, y + 1, obj_blockswitch);
blockswitchabove = place_meeting(x, y - 1, obj_blockswitch);

//Check for fireswitches
fireswitchbelow = place_meeting(x, y + 1, obj_fireswitch);
fireswitchabove = place_meeting(x, y - 1, obj_fireswitch);

//Check for firewalls
if (global.fire_on){
	infirewall = place_meeting(x, y, obj_firewall) or place_meeting(x, y, obj_fire);
}

//Check for flag
inflag = place_meeting(x, y, obj_flag);

//Check for buttons pressed
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_space);
down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(vk_space);

var switchhit = false;

//Check if dead
if (infirewall or x < 0 or y < 0 or x > room_width or y > room_height or keyboard_check_pressed(ord("R"))) {
	global.spd = 1;
	grav = 0.1;
	global.gravdir = "down";
	global.jump = 3;
	slamming = false;
	dir = "right";
	right = false;
	left = false;
	up = false;
	down = false;
	x = global.spawnx;
	y = global.spawny;
	vspeed = 0;
	hspeed = 0;
	global.block_red = true;
	global.fire_on = true;
	audio_play_sound(snd_death, 2, false);
}

//Check if win
else if (inflag) {
	room_goto_next();
}

if (global.gravdir == "down") {
	
	//Fall
	vspeed += grav*global.movementMultplier;
	
	//Move left or right
	hspeed = 0;
	if (right and !blockright) {
		hspeed += global.spd*global.movementMultplier;
		dir = "right";
	}
	if (left and !blockleft) {
		hspeed -= global.spd*global.movementMultplier;
		dir = "left";
	}
	
	//Jump
	if (up and blockbelow) {
		vspeed -= global.jump*global.movementMultplier;
	}
	
	//Slam
	else if (down and !blockbelow and !slamming) {
		vspeed += global.jump*global.movementMultplier;
		slamming = true;
	}
	
	//Don't get stuck in the bottom of blocks
	else if (blockabove and vspeed < 0) {
		vspeed = 0;
		audio_play_sound(snd_land, 9, false);
		
		if (gswitchabove) {
			global.gravdir = "up";
			switchhit = true;
		}
		if (spdswitchabove and global.spd < 3) {
			global.spd += 0.2;
			switchhit = true;
		}
		if (jumpswitchabove and global.jump < 5.5) {
			global.jump += 0.5;
			switchhit = true;
		}
		if (blockswitchabove) {
			global.block_red = !global.block_red;
			switchhit = true;
		}
		if (fireswitchabove) {
			alarm[0] = 3 * room_speed;
			global.fire_on = false;
			switchhit = true;
		}

		while (inblock) {
			y += 1;
			inblock = place_meeting(x, y, obj_block);
			if (!inblock) {
				if (global.block_red) {
					inblock = place_meeting(x, y, obj_redblock);
				}
				else {
					inblock = place_meeting(x, y, obj_blueblock);
				}
			}
		}	
		blockabove = place_meeting(x, y - 1, obj_block);
		if (!blockabove) {
			if (global.block_red) {
				blockabove = place_meeting(x, y - 1, obj_redblock);
			}
			else {
				blockabove = place_meeting(x, y - 1, obj_blueblock);
			}
		}
	}
	
	//Stop falling
	else if (blockbelow){
		if (vspeed > 1 && !slamming) {
			audio_play_sound(snd_land, 9, false);
		}
		if (!up) {
			vspeed = 0;
		}
		if (slamming == true) {
			if (gswitchbelow) {
				global.gravdir = "up";
				switchhit = true;
			}
			if (spdswitchbelow and global.spd > 0.4) {
				global.spd -= 0.2;
				switchhit = true;
			}
			if (jumpswitchbelow and global.jump > 1.5) {
				global.jump -= 0.5;
				switchhit = true;
			}
			if (blockswitchbelow) {
				global.block_red = !global.block_red;
				switchhit = true;
			}
			if (fireswitchbelow) {
				alarm[0] = 2 * room_speed;
				global.fire_on = false;
				switchhit = true;
			}
			audio_play_sound(snd_slam, 10, false);
		}
		while (inblock) {
			y -= 1;
			inblock = place_meeting(x, y, obj_block);
			if (!inblock) {
				if (global.block_red) {
					inblock = place_meeting(x, y, obj_redblock);
				}
				else {
					inblock = place_meeting(x, y, obj_blueblock);
				}
			}
		}
		slamming = false;
	}
}
else if (global.gravdir == "up") {
	
	//Fall
	vspeed -= grav*global.movementMultplier;
	
	//Move left or right
	hspeed = 0;
	if (right and !blockright) {
		hspeed += global.spd*global.movementMultplier;
		dir = "right";
	}
	if (left and !blockleft) {
		hspeed -= global.spd*global.movementMultplier;
		dir = "left";
	}
	
	//Jump
	if (up and blockabove) {
		vspeed += global.jump*global.movementMultplier;
	}
	
	//Slam
	else if (down and !blockabove and !slamming) {
		vspeed -= global.jump*global.movementMultplier;
		slamming = true;
	}
	
	//Don't get stuck in the bottom of blocks
	else if (blockbelow and vspeed > 0) {
		vspeed = 0;
		audio_play_sound(snd_land, 9, false);
		if (gswitchbelow) {
			global.gravdir = "down";
			switchhit = true;
		}
		if (spdswitchbelow and global.spd > 0.4) {
			global.spd -= 0.2;
			switchhit = true;
		}
		if (jumpswitchbelow and global.jump > 1.5) {
			global.jump -= 0.5;
			switchhit = true;
		}
		if (blockswitchbelow) {
			global.block_red = !global.block_red;
			switchhit = true;
		}
		if (fireswitchbelow) {
			alarm[0] = 2 * room_speed;
			global.fire_on = false;
			switchhit = true;
		}
		while (inblock) {
			y -= 1;
			inblock = place_meeting(x, y, obj_block);
			if (!inblock) {
				if (global.block_red) {
					inblock = place_meeting(x, y, obj_redblock);
				}
				else {
					inblock = place_meeting(x, y, obj_blueblock);
				}
			}
		}	
		blockbelow = place_meeting(x, y + 1, obj_block);
		if (!inblock) {
			if (global.block_red) {
				blockbelow = place_meeting(x, y + 1, obj_redblock);
			}
			else {
				blockbelow = place_meeting(x, y + 1, obj_blueblock);
			}
		}
	}
	
	//Stop falling
	else if (blockabove){
		if (vspeed < -1 && !slamming) {
			audio_play_sound(snd_land, 9, false);
		}
		if (!up) {
			vspeed = 0;
		}
		if (slamming == true) {
			if (gswitchabove) {
				global.gravdir = "down";
				switchhit = true;
			}
			if (spdswitchabove and global.spd < 3) {
				global.spd += 0.2;
				switchhit = true;
			}
			if (jumpswitchabove and global.jump < 5.5) {
				global.jump += 0.5;
				switchhit = true;
			}
			if (blockswitchabove) {
				global.block_red = !global.block_red;
				switchhit = true;
			}
			if (fireswitchabove) {
				alarm[0] = 3 * room_speed;
				global.fire_on = false;
				switchhit = true;
			}
			audio_play_sound(snd_slam, 10, false);
		}
		while (inblock) {
			y += 1;
			inblock = place_meeting(x, y, obj_block);
			if (!inblock) {
				if (global.block_red) {
					inblock = place_meeting(x, y, obj_redblock);
				}
				else {
					inblock = place_meeting(x, y, obj_blueblock);
				}
			}
		}
		slamming = false;
	}
}

//Flip image
if (dir == "right") {
	image_xscale = 1;
}
else if (dir == "left") {
	image_xscale = -1;
}
if (global.gravdir == "up") {
	image_yscale = -1;
}
else if (global.gravdir == "down") {
	image_yscale = 1;
}

//Change sprites
if (vspeed == 0) {
	if (hspeed != 0) {
		sprite_index = spr_newwalk;
	}
	else {
		sprite_index = spr_newidle;
	}
}
else {
	sprite_index = spr_newfall;
}

// play sounds
if (switchhit) {
	audio_play_sound(snd_switch_glitch, 7, false);
}