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
#macro action2Key "F"
#macro jumpKey vk_space

//Screen
#macro gameWidth 640
#macro gameHeight 360
#macro gameZoom 2

#macro gameSessionInMinute 2
#macro gameDayLenght (0.9 / ((gameSessionInMinute * 0.25) * 60)) / 60
#macro gameSpeed (1080 / (gameSessionInMinute * 60))

global.soundStepArray = 
[	
	snd_footsteps_boat_1, snd_footsteps_boat_2, snd_footsteps_boat_3,
	snd_footsteps_boat_4, snd_footsteps_boat_5, snd_footsteps_boat_6,
	snd_footsteps_boat_7, snd_footsteps_boat_8
];