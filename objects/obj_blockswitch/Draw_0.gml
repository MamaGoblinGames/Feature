/// @description draw code text

draw_set_color(c_blue);
draw_set_font(VT323);
draw_self();

var textx = x - 26;
var texty = y + 0.5;
var color = global.block_red ? "r" : "b";
var text = "BL="+color;
draw_text_transformed(textx, texty, text, 1, 1, image_angle);