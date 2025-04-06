if (global.isDebug) {
	draw_surface(application_surface, 0 , 0);
	exit
}

shader_set(shd_day_night);
var _minShading = 0.4
var _shadingTime = (max(hour - 6, _minShading));
if (hour > 15)
	_shadingTime = (max(21 - hour, _minShading));
else if (hour < 5)
	_shadingTime = _minShading
	
shader_set_uniform_f(shader_get_uniform(shd_day_night, "time"), _shadingTime * 4);
draw_surface(application_surface, 0 , 0);
shader_reset();