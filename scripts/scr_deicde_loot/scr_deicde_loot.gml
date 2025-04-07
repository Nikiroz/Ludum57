function scr_deicde_loot() {
	
	var _large = choose(o_loot_circutboard, o_loot_oldcomputer),
		_medium = choose(o_loot_casingfragment, o_loot_machinerypart, o_loot_circutboard),
		_small = choose(o_loot_cable, o_loot_oldpipe, o_loot_casingfragment);
				
	
	switch(object_index) {
		
		case o_scrap_small:
		
			if (irandom(100) < 5) {
				return _large;
			}
			else if (irandom(100) < 15) {
				return _medium;
			}
			else if (irandom(100) < 80) {
				return _small;
			}
		
		break;
			 
		
		case o_scrap_medium:
		
			if (irandom(100) < 15) {
				return _large;
			}
			else if (irandom(100) < 60) {
				return _medium;
			}
			else if (irandom(100) < 25) {
				return _small;
			}
		break;
		
		case o_scrap_large:
		
		if (irandom(100) < 50) {
				return _large;
			}
			else if (irandom(100) < 40) {
				return _medium;
			}
			else if (irandom(100) < 10) {
				return _small;
			}
			
		break;
			
	}
}