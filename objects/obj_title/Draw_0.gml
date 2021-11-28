/// @description render subtitles

draw_self();

if (showSubtitle) {
	draw_set_color(make_color_rgb(25, 123, 48));
	draw_set_font(VT323);
	draw_text(x+2, y-12, "It's not a bug.");
}

draw_set_font(VT323);
draw_set_color(make_color_rgb(181, 237, 206));
draw_text(x+2, y+8, "a Mama Goblin Games puzzle platformer");
