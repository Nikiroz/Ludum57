/// @desc Draw

draw_set_color(mcr_ropeRenderColor)
for (var i = 0; i < seg_count - 1; i ++) {
	var _seg1 = seg_array[i],
		_seg2 = seg_array[i + 1];
	draw_circle(
		_seg1.x, _seg1.y,
		mcr_ropeRenderThickness / 2, false
	)
	draw_line_width(
		_seg1.x, _seg1.y,
		_seg2.x, _seg2.y,
		mcr_ropeRenderThickness
	)
}
draw_set_color(c_white)