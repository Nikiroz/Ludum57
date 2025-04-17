if(isStart){
	if(fade == 0){
		instance_destroy();
	}
	fade  = lerp(fade, 0, 0.1);
	alpha = lerp(alpha, 0, 0.15);
}