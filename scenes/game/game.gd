extends Control

@export var memory_tile: PackedScene
@onready var grid: GridContainer = $HB/MCGame/Grid


func _ready() -> void:
	GameManager.level_selected.connect(_on_level_selected)


func _on_exit_button_pressed() -> void:
	GameManager.game_exit()


func _on_level_selected() -> void:
	var selected_level = GameManager._selected_level
	var images = GameManager._images
	grid.columns = selected_level.cols
	for i in range(selected_level.rows * selected_level.cols):
		var memory_tile_instance = memory_tile.instantiate() as MemoryTile
		memory_tile_instance.init(images[i])
		grid.add_child(memory_tile_instance)
