extends Node

signal level_selected


const LEVELS = {
	1: { "rows": 2, "cols": 2 },
	2: { "rows": 3, "cols": 4 },
	3: { "rows": 4, "cols": 4 },
	4: { "rows": 4, "cols": 6 },
	5: { "rows": 5, "cols": 6 },
	6: { "rows": 6, "cols": 6 },
}


var _selected_level: Dictionary
var _images: Array[Dictionary]
var _attempts: int


func setup_level(level: int) -> void:
	_selected_level = LEVELS[level]
	_attempts = 0
	_images = []
	while _images.size() < _selected_level.rows * _selected_level.cols:
		var image = ImageManager.get_random_image()
		if image not in _images:
			_images.append(image)
			_images.append(image)
	_images.shuffle()


func select_level(level: int) -> void:
	if level not in LEVELS:
		return
	
	setup_level(level)
	
	level_selected.emit()
	NavigationManager.navigate(NavigationManager.Routes.GAME)


func game_exit() -> void:
	for mt in get_tree().get_nodes_in_group("memory_tile"):
		mt.queue_free()
	NavigationManager.navigate(NavigationManager.Routes.MENU)
