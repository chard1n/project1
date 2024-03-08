if (fade_volume > 0) {
    fade_volume -= fade_speed;
    if (fade_volume < 0) {
        fade_volume = 0;
    }
    audio_sound_gain(menuMusic, fade_volume, 0);
} else {
    audio_stop_sound(menuMusic);
    instance_destroy(); 
}