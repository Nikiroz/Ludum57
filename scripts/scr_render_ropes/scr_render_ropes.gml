#macro mcr_ropeRenderThickness 2
#macro mcr_ropeRenderColor #696757

function scr_draw_ropes() {
	if (global.isDebug) {
		draw_set_font(fnt_debug_small);
		
		with (o_rope_simple) {
			if (instance_exists(parent)) {
				draw_set_color(c_blue);
				draw_text(x, y, stress);
			
				draw_set_color(c_white);
				draw_line_width(x, y, parent.x, parent.y, mcr_ropeRenderThickness);
			}
		}
		
		exit
	}
	
	//
	draw_set_color(mcr_ropeRenderColor);
	
	with (o_rope_simple) {
		if (instance_exists(parent)) {
			draw_line_width(x, y, parent.x, parent.y, mcr_ropeRenderThickness);
		}
	}
	
	draw_set_color(c_white);
}