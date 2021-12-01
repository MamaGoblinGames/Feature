/// @description draw code text

event_inherited();
var textx = x - 16;
var texty = y + 0.5;
var plusMinus = global.gravdir == "down" ? "-" : "+";
var text = "G="+plusMinus+"9.8";
draw_text_transformed(textx, texty, text, 1, 1, image_angle);
