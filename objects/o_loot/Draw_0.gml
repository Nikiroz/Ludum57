if (isBoatRender) exit;

if (instance_exists(o_player) && !o_player.aquasuit_equipped) {
	interaction_visible = false;
	
	with (o_interaction_text) {
		if (target == other.id) instance_destroy();
	}
}



image_angle = rotation;

scr_interactible_draw_self_outlined(outline_full);

image_angle = 0;