#macro isBoatRender (is_boated && global.__rendermode != Rendermode.Boat)

enum Rendermode {
	None,
	Boat
}

global.__rendermode = Rendermode.None

function rendermode_set(_mode) {
	global.__rendermode = _mode
}

function rendermode_get() {
	return global.__rendermode
}

function rendermode_reset() {
	global.__rendermode = Rendermode.None
}