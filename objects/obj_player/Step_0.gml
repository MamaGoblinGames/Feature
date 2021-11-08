//Check for blocks
blockbelow = place_meeting(x, y + 1, solid);
blockabove = place_meeting(x, y - 1, solid);
blockright = place_meeting(x + 1, y, solid);
blockleft = place_meeting(x - 1, y, solid);
inblock = place_meeting(x, y, solid);

//Check for buttons pressed
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check_pressed(vk_up);
down = keyboard_check_pressed(vk_down);

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
		vspeed += slam;
		slamming = true;
	}
	
	//Don't get stuck in the bottom of blocks
	else if (blockabove and vspeed < 0) {
		vspeed = 0;
		while (inblock) {
			y += 1;
			inblock = place_meeting(x, y, solid);
		}	
		blockabove = place_meeting(x, y - 1, solid);
	}
	
	//Stop falling
	else if (blockbelow){
		if (!up) {
			vspeed = 0;
		}
		if (slamming == true and place_meeting(x, y + 1, obj_gswitch)) {
			gravdir = "up";
		}
		while (inblock) {
			y -= 1;
			inblock = place_meeting(x, y, solid);
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
		vspeed -= slam;
		slamming = true;
	}
	
	//Don't get stuck in the bottom of blocks
	else if (blockbelow and vspeed > 0) {
		vspeed = 0;
		while (inblock) {
			y -= 1;
			inblock = place_meeting(x, y, solid);
		}	
		blockbelow = place_meeting(x, y + 1, solid);
	}
	
	//Stop falling
	else if (blockabove){
		if (!up) {
			vspeed = 0;
		}
		if (slamming == true and place_meeting(x, y - 1, obj_gswitch)) {
			gravdir = "down";
		}
		while (inblock) {
			y += 1;
			inblock = place_meeting(x, y, solid);
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