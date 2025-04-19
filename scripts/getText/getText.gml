function getText(key){
	var text = "";
	
	if(!is_undefined(global.translation[? key])){
		text = global.locData[# 1 + global.locale, global.translation[? key]];	
	} else {
		text = key;	
	}
	
	return text;
}