//Check for blocks
blockbelow = place_meeting(x, y + 1, solid);
blockabove = place_meeting(x, y - 1, solid);
blockright = place_meeting(x + 1, y, solid);
blockleft = place_meeting(x - 1, y, solid);
inblock = place_meeting(x, y, solid);

if (gravdir == "down") {
	
	//Fall
	vspeed += grav;
	
	//Move left or right
	hspeed = 0;
	if (keyboard_check(vk_right) and !blockright) {
		hspeed += spd;
		dir = "right";
	}
	if (keyboard_check(vk_left) and !blockleft) {
		hspeed -= spd;
		dir = "left";
	}
	
	//Jump
	if (keyboard_check(vk_up) and blockbelow) {
		vspeed -= jump;
	}
	
	//Slam
	else if (keyboard_check(vk_down) and !blockbelow and !slamming) {
		vspeed += slam;
		slamming = true;
	}
	
	//Stop falling
	else if (blockbelow){
		if (!keyboard_check(vk_up)) {
			vspeed = 0;
		}
		if (slamming == true and place_meeting(x, y + 1, obj_gswitch)) {
			gravdir = "up";
		}
		slamming = false;
	}
	
	//Get out of blocks
	while (inblock) {
		y -= 1;
		inblock = place_meeting(x, y, solid);
	}
	
	//Don't get stuck in the bottom of blocks
	if (blockabove and vspeed < 0) {
		vspeed = 0;
	}
}
else if (gravdir == "up") {
	
	//Fall
	vspeed -= grav;
	
	//Move left or right
	hspeed = 0;
	if (keyboard_check(vk_right) and !blockright) {
		hspeed += spd;
		dir = "right";
	}
	if (keyboard_check(vk_left) and !blockleft) {
		hspeed -= spd;
		dir = "left";
	}
	
	//Jump
	if (keyboard_check(vk_up) and blockabove) {
		vspeed += jump;
	}
	
	//Slam
	else if (keyboard_check(vk_down) and !blockabove and !slamming) {
		vspeed -= slam;
		slamming = true;
	}
	
	//Stop falling
	else if (blockabove){
		if (!keyboard_check(vk_up)) {
			vspeed = 0;
		}
		if (slamming == true and place_meeting(x, y - 1, obj_gswitch)) {
			gravdir = "down";
		}
		slamming = false;
	}
	
	//Get out of blocks
	while (inblock) {
		y += 1;
		inblock = place_meeting(x, y, solid);
	}
	
	//Don't get stuck in the bottom of blocks
	if (blockbelow and vspeed > 0) {
		vspeed = 0;
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