/// @description draw code text

draw_self();

draw_set_color(c_blue);
draw_set_font(VT323);
draw_set_alpha(global.switch_alpha);


var textx = x - 6.75;
var texty = y + 0.5;
var plusMinus = global.gravdir == "down" ? "-" : "+";
var text = "G="+plusMinus+"9.8";
draw_text_transformed(textx, texty, text, 0.25, 0.25, image_angle);

draw_set_alpha(1);