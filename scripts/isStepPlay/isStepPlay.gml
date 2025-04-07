function isStepPlay(_array){
var size = array_length(_array);
var isPlay = !audio_is_playing(_array[0]);

for (var i = 1; i < size; i++) {
	isPlay &= !audio_is_playing(_array[i]);
}

return isPlay;

}