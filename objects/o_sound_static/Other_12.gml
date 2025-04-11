/// @description start


audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_falloff(emmiter, ref_amount, max_amount, factor_amount);


var _sound_params =
{
    sound: soundLoop,
    priority: 1,
    gain: 1,
	loop: true,
    emitter: emmiter,

};

audio_play_sound_ext(_sound_params);