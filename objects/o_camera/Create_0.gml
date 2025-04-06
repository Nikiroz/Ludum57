target = o_player;
waterlineY = mcr_waterline;
offsetTargetX = 0;
offsetTargetY = 0;

depth = -1000;
var _x = target.x - gameWidth / 2 + target.sprite_width * 2;
var _y = target.y - gameHeight / 2 + target.sprite_height / 2 + offsetTargetY;
camera_set_view_pos(view_camera[0], _x, _y);

display_set_gui_size(gameWidth, gameHeight);

bg = layer_get_id("Background");

cameraX = 0;
cameraY = 0;
