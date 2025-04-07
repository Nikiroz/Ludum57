event_inherited();

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
	"Salvage", "Salvaging {0}%");
