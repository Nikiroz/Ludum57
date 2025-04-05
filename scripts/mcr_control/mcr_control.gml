enum Locale{
	En,
	Ru,
	Ua
}

#macro upKey "W"
#macro downKey "S"
#macro leftKey "A"
#macro rightKey "D"
#macro actionKey "E"
#macro jumpKey vk_space

//Screen
#macro gameWidth 640
#macro gameHeight 360
#macro gameZoom 2

#macro gameSessionInMinute 2
#macro gameDayLenght (0.9 / ((gameSessionInMinute * 0.25) * 60)) / 60
#macro gameSpeed (1080 / (gameSessionInMinute * 60))