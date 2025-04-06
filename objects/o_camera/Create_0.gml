target = o_player;
waterlineY = o_game_controller.waterlineY;

var _x = target.x - gameWidth / 2 + target.sprite_width * 2;
var _y = target.y - gameHeight / 2 + target.sprite_height / 2;
camera_set_view_pos(view_camera[0], _x, _y);

bg = layer_get_id("Background");

cameraX = 0;
cameraY = 0;
