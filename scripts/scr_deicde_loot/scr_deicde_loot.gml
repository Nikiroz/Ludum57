function scr_deicde_loot() {
	
	switch(object_index) {
		
		case o_scrap_small:
			return choose(
				o_loot_cable, o_loot_oldpipe, o_loot_casingfragment);
		
		case o_scrap_medium:
			return choose(
				o_loot_casingfragment, o_loot_machinerypart, o_loot_circutboard);
		
		case o_scrap_large:
			return choose(
				o_loot_circutboard, o_loot_oldcomputer);
	}
}