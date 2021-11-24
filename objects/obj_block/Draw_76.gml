/// @description draw edges

if (!pickedEdges) {
	pickedEdges = true;
	blockbelow = place_meeting(x, y + 1, obj_block);
	blockabove = place_meeting(x, y - 1, obj_block);
	blockright = place_meeting(x + 1, y, obj_block);
	blockleft = place_meeting(x - 1, y, obj_block);

	if (!blockabove && !blockbelow && !blockleft && !blockright) {
		sprite_index = spr_block_cage_all;
	} else if (blockabove && !blockbelow && blockleft && blockright) {
		sprite_index = spr_block_cage_b;
	} else if (blockabove && !blockbelow && !blockleft && blockright) {
		sprite_index = spr_block_cage_bl;
	} else if (blockabove && !blockbelow && blockleft && !blockright) {
		sprite_index = spr_block_cage_br;
	} else if (blockabove && !blockbelow && !blockleft && !blockright) {
		sprite_index = spr_block_cage_brl;
	}  else if (blockabove && blockbelow && !blockleft && blockright) {
		sprite_index = spr_block_cage_l;
	} else if(blockabove && blockbelow && blockright && blockleft) {
		sprite_index = spr_block_cage_none;
	} else if (blockabove && blockbelow && blockleft && !blockright) {
		sprite_index = spr_block_cage_r;
	} else if (blockabove && blockbelow && !blockleft && !blockright) {
		sprite_index = spr_block_cage_rl;
	} else if (!blockabove && blockbelow && blockleft && blockright) {
		sprite_index = spr_block_cage_t;
	} else if (!blockabove && !blockbelow && blockleft && blockright) {
		sprite_index = spr_block_cage_tb;
	} else if (!blockabove && !blockbelow && !blockleft && blockright) {
		sprite_index = spr_block_cage_tbl;
	} else if (!blockabove && !blockbelow && blockleft && !blockright) {
		sprite_index = spr_block_cage_tbr;
	} else if (!blockabove && blockbelow && !blockleft && blockright) {
		sprite_index = spr_block_cage_tl;
	} else if (!blockabove && blockbelow && blockleft && !blockright) {
		sprite_index = spr_block_cage_tr;
	} else if (!blockabove && blockbelow && !blockleft && !blockright) {
		sprite_index = spr_block_cage_trl;
	}
}