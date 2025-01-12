if(room == start)
{
	if(!audio_is_playing(st_sd)){
		st_sd = audio_play_sound(start_screen_sd, 0, false)
	}
}

if(room != start && !audio_is_playing(st_sd) && !audio_is_playing(main_hub_sd))
{
	audio_play_sound(main_hub_sd , 0, true)
}








