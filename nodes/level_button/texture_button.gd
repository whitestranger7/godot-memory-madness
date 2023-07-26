extends TextureButton


@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


var _level: int


func init(level_number: int) -> void:
	var l_data = GameManager.LEVELS[level_number]
	
	if not l_data:
		return
	
	$Label.text = "%sx%s" % [l_data.rows, l_data.cols]
	_level = level_number


func _on_pressed() -> void:
	if _level:
		GameManager.select_level(_level)
		SoundManager.play_button_sound(audio_stream_player)
