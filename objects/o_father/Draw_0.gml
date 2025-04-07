if (isBoatRender) exit;

scr_interactible_draw_self_outlined(outline_nobottom);

if (boatControl) {
	with (o_player) {
		draw_sprite(hand_sprite, image_index, x + 1, y + 1)
	}
}