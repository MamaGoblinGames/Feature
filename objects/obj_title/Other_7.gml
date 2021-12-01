/// @description stop animation

image_speed = 0;
image_index = image_number - 1;

alarm_set(1, 0.6*room_speed);
audio_stop_sound(sound);
