if (isBoatRender) exit;

event_inherited();

//if (instance_exists(interaction_object)) {
//	draw_arrow(bbox_center_x, bbox_center_y, interaction_object.x, interaction_object.y, 4)
//}

//if (interaction_time > 0) {
//	if (interaction_time_max > 0) {
//		draw_text(bbox_center_x, bbox_top - 10, $"{interaction_time / interaction_time_max}")
//	}
//	else {
//		draw_text(bbox_center_x, bbox_top - 10, $"{interaction_time}")
//	}
//}