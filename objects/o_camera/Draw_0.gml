if(global.isDebug){
	draw_set_color(c_blue);
	draw_line(cameraX, mcr_waterline, cameraX + gameWidth, mcr_waterline);
	draw_set_color(c_red);
	var segmentX = gameWidth / 3;
	var segmentY = gameHeight / 3;
	draw_line(cameraX + (segmentX), cameraY, cameraX + (segmentX), cameraY + gameHeight);
	draw_line(cameraX + (segmentX * 2), cameraY, cameraX + (segmentX * 2), cameraY + gameHeight);
	draw_line(cameraX, cameraY + (segmentY), cameraX + gameWidth, cameraY + (segmentY));
	draw_line(cameraX, cameraY + (segmentY * 2), cameraX  + gameWidth, cameraY + (segmentY*2));
	draw_line(cameraX + (gameWidth / 2) - 10, cameraY + (gameHeight / 2), cameraX + (gameWidth / 2) + 10, cameraY + (gameHeight / 2));
	draw_line(cameraX + (gameWidth / 2),  cameraY + (gameHeight / 2) - 10, cameraX + (gameWidth / 2), cameraY + (gameHeight / 2) + 10);
	draw_set_color(c_white);
}