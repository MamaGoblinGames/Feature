/// @description init

innerRoomSize = 10;
innerRoomIndex = 1
focalPointX = 0;
focalPointY = 0;
innerRoomTriggered = false;
innerRoomFullSize = view_get_wport(innerRoomIndex);
view_set_hport(innerRoomIndex, innerRoomSize);
view_set_wport(innerRoomIndex, innerRoomSize);