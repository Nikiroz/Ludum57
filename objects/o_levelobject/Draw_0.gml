draw_self();

if (!global.isDebug) exit

var _x = bbox_right,
	_y = y - 100,
	_gap = 6;

draw_text_transformed(_x, _y,              "oxygen: " +         string(status.oxygen), 0.5,0.5, image_angle);
draw_text_transformed(_x, _y + (_gap * 1), "hp: " +				string(status.hp), 0.5,0.5, image_angle);
draw_text_transformed(_x, _y + (_gap * 2), "speed: " +			string(status.speed), 0.5,0.5, image_angle);
draw_text_transformed(_x, _y + (_gap * 3), "cable: " +			string(status.cable), 0.5,0.5, image_angle);
draw_text_transformed(_x, _y + (_gap * 4), "lightter: " +		string(status.lightter), 0.5,0.5, image_angle);
draw_text_transformed(_x, _y + (_gap * 5), "impulceForce: " +	string(status.impulceForce), 0.5,0.5, image_angle);
draw_text_transformed(_x, _y + (_gap * 6), "inCostume: " +		string(status.inCostume), 0.5,0.5, image_angle);
draw_text_transformed(_x, _y + (_gap * 7), "inWater: " +		string(status.inWater), 0.5,0.5, image_angle);
draw_text_transformed(_x, _y + (_gap * 8), "isFreeze: " +		string(status.isFreeze), 0.5,0.5, image_angle);
draw_text_transformed(_x, _y + (_gap * 9), "isWalk: " +			string(status.isWalk), 0.5,0.5, image_angle);
draw_text_transformed(_x, _y + (_gap * 10), "hsp: " +			string(hsp), 0.5,0.5, image_angle);
draw_text_transformed(_x, _y + (_gap * 11), "vsp: " +			string(vsp), 0.5,0.5, image_angle);

