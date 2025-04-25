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
#macro action3Key "G"
#macro jumpKey vk_space

//Screen
#macro gameWidth (global.isLudumBuild ? 474 : 640)
#macro gameHeight (global.isLudumBuild ? 266 : 360)
#macro gameZoom 2

#macro gameSessionInMinute 2
#macro gameDayLenght (0.9 / ((gameSessionInMinute * 0.25) * 60)) / 60
#macro gameSpeed (1080 / (gameSessionInMinute * 60))

global.musicGameplayArray = [
	snd_mus_scavenger_deep_gameplay_1, snd_mus_scavenger_deep_gameplay_2, snd_mus_scavenger_deep_gameplay_3,
	snd_mus_scavenger_deep_gameplay_4, snd_mus_scavenger_deep_gameplay_5, snd_mus_scavenger_deep_gameplay_6
]
global.soundBoatArray = [
	snd_boat_creak_1, snd_boat_creak_2, snd_boat_creak_3,
	snd_boat_creak_4, snd_boat_creak_5
]

global.soundSeagulArray = [
	snd_seagull_2, snd_seagull_3, snd_seagull_4, snd_seagull_5,
	snd_seagull_6, snd_seagull_7
]
enum size
{
    S,
    M,
    L
}

global.soundStepArray = 
[	
	snd_footsteps_boat_1, snd_footsteps_boat_2, snd_footsteps_boat_3,
	snd_footsteps_boat_4, snd_footsteps_boat_5, snd_footsteps_boat_6,
	snd_footsteps_boat_7, snd_footsteps_boat_8
];

