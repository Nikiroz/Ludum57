if (instance_exists(target)) {
	x = target.x;
	y = target.y + 16;
}

var _target = target

draw_reset_font();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _progress = 0, _hide = false,
	_text = text_key;

with (o_player) {
			
	_hide = interaction_release;
	
	if (interaction_time_max > 0 && interaction_time > 0) {
		_progress = interaction_time / interaction_time_max;
		
		other.image_xscale += _progress * 0.025;
		other.image_yscale -= _progress * 0.05;
		
		if (instance_exists(_target)) {
			_text = _target.interaction_text_progress;
		}
		
		break;
	}
	
	if (instance_exists(_target)) {
		if (!_target.interaction_visible)
			_hide = true;
		
		_text = $"[{actionKey}] {_target.interaction_text_hint}";
		slot1Text = _target.interaction_text_hint;
	}
	
}

if (instance_exists(_target) && _target.interaction2_active) {
	_text += $"\n[{action2Key}] {_target.interaction2_text_hint}"
	o_player.slot2Text = _target.interaction2_text_hint;
} 

text_key = _text;
/*
scr_text(x, y, string(_text, round(_progress * 100)),
	image_xscale * 0.5, image_yscale * 0.5, image_blend, image_alpha)
*/
draw_set_halign(fa_left);
draw_set_valign(fa_top);


if (!scr_interactible_check_selected(_target) || _hide) {
	
	o_player.showSlot1 = false;
	o_player.showSlot2 = false;
	
	image_alpha = approach(image_alpha, 0, 0.1);
	
	image_xscale = lerp(image_xscale, 1, 0.4);
	image_yscale = lerp(image_yscale, 1, 0.4);
	
	if (image_alpha <= 0) {
		image_alpha = 0;

		if (!_hide) {
			instance_destroy();
		
		}
	}
}
else {
	o_player.showSlot1 = true;
	o_player.showSlot2 = _target.interaction2_active;
	image_alpha = approach(image_alpha, 1, 0.1);
	image_xscale = lerp(image_xscale, 1, 0.2);
	image_yscale = lerp(image_yscale, 1, 0.2);
}


//o_player.showSlot3 = scr_interactible_check_selected(_target) || _hide;