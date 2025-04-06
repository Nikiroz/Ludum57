var _direction = angle_lerp(
	point_direction(interactor.x, interactor.y, x, y), 90, 0.2)

hsp += ldrx(6, _direction)
vsp += ldry(6, _direction)

if (is_submerged) {
	hsp *= 3
	vsp *= 3
}
