/// @description scale canvas

if (browser_width != width || browser_height != height) {
    width = min(base_width, browser_width);
    height = min(base_height, browser_height);
	
	var aspect = (base_width / base_height);

	if ((width / aspect) > height) {
	    window_set_size((height * aspect), height);
	}
	else {
	    window_set_size(width, (width / aspect));
	}
	window_center();

	view_wport[0] = min(window_get_width(), base_width);
	view_hport[0] = min(window_get_height(), base_height);
	surface_resize(application_surface, view_wport[0], view_hport[0]);
}