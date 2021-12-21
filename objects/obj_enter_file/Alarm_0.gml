/// @description animate viewport

if (innerRoomSize < innerRoomFullSize) {
	//innerRoomSize += 10;
	innerRoomSize *= 1.1;
	if (innerRoomSize > innerRoomFullSize) {
		innerRoomSize = innerRoomFullSize;
	}
	view_set_hport(innerRoomIndex, innerRoomSize);
	view_set_wport(innerRoomIndex, innerRoomSize);
	view_set_xport(innerRoomIndex, focalPointX - innerRoomSize/2);
	view_set_yport(innerRoomIndex, focalPointY - innerRoomSize/2);
	alarm_set(0,1);
}