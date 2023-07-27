extends Control

@export var won_scene: PackedScene
@export var memory_tile: PackedScene


@onready var grid: GridContainer = $HB/MCGame/Grid
@onready var attempts_value: Label = $HB/MCMenu/VBMenu/HBoxContainer/AttemptsValue
@onready var timer: Timer = $Timer


func _ready() -> void:
	GameManager.level_selected.connect(game_init)
	GameManager.tile_selected.connect(_on_tile_selected)
	GameManager.game_won.connect(_on_game_won)


func _on_exit_button_pressed() -> void:
	attempts_value.text = "0"
	GameManager.game_exit()


func _on_tile_selected() -> void:
	attempts_value.text = str(GameManager._attempts)
	if GameManager._grid_disabled:
		timer.start()


func game_init() -> void:
	var selected_level = GameManager._selected_level
	var images = GameManager._images
	grid.columns = selected_level.cols
	for i in range(selected_level.rows * selected_level.cols):
		var memory_tile_instance = memory_tile.instantiate() as MemoryTile
		memory_tile_instance.init(i, images[i])
		grid.add_child(memory_tile_instance)


func _on_timer_timeout() -> void:
	GameManager.hide_selected_tiles()


func _on_game_won() -> void:
	var game_won_instance = won_scene.instantiate()
	add_child(game_won_instance)
