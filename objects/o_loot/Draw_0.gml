if (isBoatRender) exit;

if (instance_exists(o_player) && !o_player.aquasuit_equipped) {
	scr_interactible_delete_text(id);
	interaction_visible = false;
}



image_angle = rotation;

scr_interactible_draw_self_outlined(outline_full);

image_angle = 0;