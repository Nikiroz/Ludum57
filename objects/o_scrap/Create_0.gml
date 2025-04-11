event_inherited();

var _sizeArray = array_length(global.nonLootableObects);
for (var i = 0; i < _sizeArray; ++i) {
    if(global.nonLootableObects[i]==id){
		instance_destroy();
		exit;
	}
}

disassembled = false;

gravity_enabled = false;

var _size;

if (object_index == o_scrap_medium) {
	_size = 3;
}
else if (object_index == o_scrap_large) {
	_size = 5;
}
else {
	_size = 1;
}

var _delay = 60 + _size * 10;

scr_interactible_configure(
	_delay * random_range(1, 1.25), 20);

size = _size;

scr_interactible_set_text(
	"Scavenge", "Scavenging {0}%");
