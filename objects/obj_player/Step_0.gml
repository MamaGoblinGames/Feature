//Check for blocks
blockbelow = place_meeting(x, y + 1, global.solid_objs);
blockabove = place_meeting(x, y - 1, global.solid_objs);
blockright = place_meeting(x + 1, y, global.solid_objs);
blockleft = place_meeting(x - 1, y, global.solid_objs);
inblock = place_meeting(x, y, global.solid_objs);

//Check for gswitches
gswitchbelow = place_meeting(x, y + 1, obj_gswitch);
gswitchabove = place_meeting(x, y - 1, obj_gswitch);
gswitchright = place_meeting(x + 1, y, obj_gswitch);
gswitchleft = place_meeting(x - 1, y, obj_gswitch);

//Check for spdswitches
spdswitchbelow = place_meeting(x, y + 1, obj_spdswitch);
spdswitchabove = place_meeting(x, y - 1, obj_spdswitch);
spdswitchright = place_meeting(x + 1, y, obj_spdswitch);
spdswitchleft = place_meeting(x - 1, y, obj_spdswitch);

//Check for jumpswitches
jumpswitchbelow = place_meeting(x, y + 1, obj_jumpswitch);
jumpswitchabove = place_meeting(x, y - 1, obj_jumpswitch);
jumpswitchright = place_meeting(x + 1, y, obj_jumpswitch);
jumpswitchleft = place_meeting(x - 1, y, obj_jumpswitch);

//Check for firewalls
infirewall = place_meeting(x, y, obj_firewall);

//Check for flag
inflag = place_meeting(x, y, obj_flag);

//Check for buttons pressed
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check_pressed(vk_up);
down = keyboard_check_pressed(vk_down);

//Check if dead
if (infirewall or x < 0 or y < 0 or x > room_width or y > room_height) {
	spd = 1;
	grav = 0.1;
	gravdir = "down";
	jump = 3;
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
}

//Check if win
else if (inflag) {
	room_next(room);
}

if (gravdir == "down") {
	
	//Fall
	vspeed += grav;
	
	//Move left or right
	hspeed = 0;
	if (right and !blockright) {
		hspeed += spd;
		dir = "right";
	}
	if (left and !blockleft) {
		hspeed -= spd;
		dir = "left";
	}
	
	//Jump
	if (up and blockbelow) {
		vspeed -= jump;
	}
	
	//Slam
	else if (down and !blockbelow and !slamming) {
		vspeed += jump;
		slamming = true;
	}
	
	//Don't get stuck in the bottom of blocks
	else if (blockabove and vspeed < 0) {
		vspeed = 0;
		if (gswitchabove) {
			gravdir = "up";
		}
		if (spdswitchabove and spd < 3) {
			spd += 0.2;
		}
		if (jumpswitchabove and jump < 6) {
			jump += 0.5;
		}
		while (inblock) {
			y += 1;
			inblock = place_meeting(x, y, global.solid_objs);
		}	
		blockabove = place_meeting(x, y - 1, global.solid_objs);
	}
	
	//Stop falling
	else if (blockbelow){
		if (!up) {
			vspeed = 0;
		}
		if (slamming == true) {
			if (gswitchbelow) {
				gravdir = "up";
			}
			if (spdswitchbelow and spd > 0.4) {
				spd -= 0.2;
			}
			if (jumpswitchbelow and jump > 1.5) {
				jump -= 0.5;
			}
		}
		while (inblock) {
			y -= 1;
			inblock = place_meeting(x, y, global.solid_objs);
		}
		slamming = false;
	}
}
else if (gravdir == "up") {
	
	//Fall
	vspeed -= grav;
	
	//Move left or right
	hspeed = 0;
	if (right and !blockright) {
		hspeed += spd;
		dir = "right";
	}
	if (left and !blockleft) {
		hspeed -= spd;
		dir = "left";
	}
	
	//Jump
	if (up and blockabove) {
		vspeed += jump;
	}
	
	//Slam
	else if (down and !blockabove and !slamming) {
		vspeed -= jump;
		slamming = true;
	}
	
	//Don't get stuck in the bottom of blocks
	else if (blockbelow and vspeed > 0) {
		vspeed = 0;
		if (gswitchbelow) {
			gravdir = "down";
		}
		if (spdswitchbelow and spd > 0.4) {
			spd -= 0.2;
		}
		if (jumpswitchbelow and jump > 1.5) {
			jump -= 0.5;
		}
		while (inblock) {
			y -= 1;
			inblock = place_meeting(x, y, global.solid_objs);
		}	
		blockbelow = place_meeting(x, y + 1, global.solid_objs);
	}
	
	//Stop falling
	else if (blockabove){
		if (!up) {
			vspeed = 0;
		}
		if (slamming == true) {
			if (gswitchabove) {
				gravdir = "down";
			}
			if (spdswitchabove and spd < 3) {
				spd += 0.2;
			}
			if (jumpswitchabove and jump < 6) {
				jump += 0.5;
			}
		}
		while (inblock) {
			y += 1;
			inblock = place_meeting(x, y, global.solid_objs);
		}
		slamming = false;
	}
}
else if (gravdir == "right") {
	hspeed += grav;
}
else if (gravdir == "left") {
	hspeed -= grav;
}

//Change sprites
if (dir == "right") {
	if (vspeed == 0) {
		if (hspeed != 0) {
			sprite_index = spr_walkright;
		}
		else {
			sprite_index = spr_idleright;
		}
	}
	else {
		sprite_index = spr_fallright;
	}
}
else if (dir == "left") {
	if (vspeed == 0) {
		if (hspeed != 0) {
			sprite_index = spr_walkleft;
		}
		else {
			sprite_index = spr_idleleft;
		}
	}
	else {
		sprite_index = spr_fallleft;
	}
}

//Flip image
if (gravdir == "up") {
	image_yscale = -1;
}
else if (gravdir == "down") {
	image_yscale = 1;
}