/// @desc Draw

for (var i = 0; i < seg_count - 1; i ++) {
	var _seg1 = seg_array[i],
		_seg2 = seg_array[i + 1];
	draw_circle(
		_seg1.x, _seg1.y,
		1, false
	)
	draw_line_width(
		_seg1.x, _seg1.y,
		_seg2.x, _seg2.y,
		2
	)
}