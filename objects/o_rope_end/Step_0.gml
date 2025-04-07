event_inherited()

if (!is_grounded) {
	vsp += 0.05;
}
else if (is_submerged) {
	vsp += 0.01;
}
else vsp = 0;

var _rope = rope_instance

if (instance_exists(_rope)) {
	rope_instance.x = x;
	rope_instance.y = y;
}
else exit

with (target) {
	var _tx = x, _ty = bbox_bottom - 20,
		_is_player = (object_index == o_player);
	
	if (_is_player && instance_exists(o_rope_source) && input_pull_up) {
		if (bbox_top > mcr_waterline) {
			speed_add(point_direction(x, y, o_rope_source.x, o_rope_source.y), 1);
			speed_limit(rope_pull_speed);
		}
		else if (!climb_aboard_confirmation) {
			self.set_climb_aboard(true);
			
			if (has_carried_item() && instance_exists(o_collision_ship)) {
				var _cx;
				
				with (o_collision_ship) {
					_cx = bbox_center_x;
				}
				
				with (carried_instance) {
					hsp = sign(_cx - x) * 3;
					vsp = -5;
					
					y -= 50
				}
				
				set_carried_item(noone);
			}
		}
	}
	
	with (_rope) {
		if (stress > length && _is_player) {
			var _diff = stress - length,
				_vx = ((x + parent.x) * 0.5 - _tx) * 0.2,
				_vy = ((y + parent.y) * 0.5 - _ty) * 0.2;
			
			other.hsp += _vx;
			other.vsp += _vy;
			
			with (other) {
				if (sprite_index == s_player_aquasuit_idle
				|| sprite_index == s_player_aquasuit_swim
				|| sprite_index == s_player_aquasuit_scavenge_start
				|| sprite_index == s_player_aquasuit_scavenge_loop
				|| sprite_index == s_player_aquasuit_scavenge_end)
				{
					sprite_index = s_player_aquasuit_rope_end;
					image_index = 0;
				}
			}
		}
		
		x = _tx;
		
		if (_is_player) {
			
			y = _ty - 5;
		}
		else {
			y = _ty + 5;
		}
	}
	
	other.x = bbox_center_x;
	other.y = bbox_center_y;
}