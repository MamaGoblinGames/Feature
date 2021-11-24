/// @description show glitchy bits

if (glitching > -1) {
	if (glitching % 4 == 0 || text == "") {
		var chars = "01";
		var charsLength = string_length(chars);
		var length = 8;
		text = "";
		for (var i=0; i<length; i++) {
			text += string_char_at(chars, irandom_range(0,charsLength));
			if (i % 4 == 3) {
				text += "\n";
			}
		}
	}
	draw_set_color(c_lime);
	draw_set_font(VT323);
	draw_set_alpha(1-image_alpha);

	draw_text_transformed(x, y, text, 0.6, 0.5, image_angle);

	draw_set_alpha(1);
}

if (sprite_index == noone) {
	draw_sprite(emptysprite,0,x,y);
} else {
	draw_self();
}