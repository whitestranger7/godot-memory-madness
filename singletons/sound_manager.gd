extends Node


enum SongsType {
	SOUND_MAIN_MENU,
	SOUND_IN_GAME,
	SOUND_SUCCESS,
	SOUND_GAME_OVER,
	SOUND_SELECT_TITLE,
	SOUND_SELECT_BUTTON,
}


const SOUNDS = {
	SongsType.SOUND_MAIN_MENU: preload("res://assets/sounds/bgm_action_3.mp3"),
	SongsType.SOUND_IN_GAME: preload("res://assets/sounds/bgm_action_4.mp3"),
	SongsType.SOUND_SUCCESS: preload("res://assets/sounds/sfx_sounds_fanfare3.wav"),
	SongsType.SOUND_GAME_OVER: preload("res://assets/sounds/sfx_sounds_powerup12.wav"),
	SongsType.SOUND_SELECT_TITLE: preload("res://assets/sounds/sfx_sounds_impact1.wav"),
	SongsType.SOUND_SELECT_BUTTON: preload("res://assets/sounds/sfx_sounds_impact7.wav"),
}


func play_sound(player: AudioStreamPlayer, key: SongsType) -> void:
	if SOUNDS.has(key) == false: 
		return
	
	player.stop()
	player.stream = SOUNDS[key]
	player.play()


func play_button_sound(player: AudioStreamPlayer) -> void:
	play_sound(player, SongsType.SOUND_SELECT_BUTTON)
