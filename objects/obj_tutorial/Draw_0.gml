/// @description show text

if (global.showTutorials) {
	
	draw_set_font(fnt_tutorial);
	draw_set_color(make_color_rgb(181, 237, 206));

	textScale = 0.5;

	draw_text_ext_transformed(x, y, text, -1, 110/textScale, textScale, textScale, image_angle);
}