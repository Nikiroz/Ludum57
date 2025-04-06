function createButton(_x, _y, _width = 280, _height = 80, _text = "button", _sprite = noone, _textColor = c_white, _script = noone, _scriptArg = []){
	
	var _button = instance_create_layer(_x, _y, "service", o_button);

	with (_button){
		width = _width;
		height = _height;
		text = _text;
		sprite = _sprite;
		textColor = _textColor;
		runScript = _script;
		scriptArg = _scriptArg;
		event_user(0);
	}
	
	return _button;
	
}