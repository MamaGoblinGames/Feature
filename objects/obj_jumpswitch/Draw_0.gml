/// @description draw code text

event_inherited();

draw_set_color(c_blue);
draw_set_font(VT323);
draw_set_alpha(global.switch_alpha);

var textx = x - 16;
var texty = y + 0.5;
var text = "J="+string((global.jump * 2) - 2);
draw_text_transformed(textx, texty, text, 1, 1, image_angle);
