/// @description draw code text

draw_set_color(c_blue);
draw_set_font(VT323);
draw_self();

var textx = x - 14.5;
var texty = y + 0.5;
var plusMinus = global.gravdir == "down" ? "-" : "+";
var text = "G = "+plusMinus+"9.8;";
draw_text_transformed(textx, texty, text, 0.25, 0.25, image_angle);