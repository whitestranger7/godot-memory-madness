extends Node

signal level_selected
signal tile_selected
signal game_won


const LEVELS = {
	1: { "rows": 2, "cols": 2 },
	2: { "rows": 3, "cols": 4 },
	3: { "rows": 4, "cols": 4 },
	4: { "rows": 4, "cols": 6 },
	5: { "rows": 5, "cols": 6 },
	6: { "rows": 6, "cols": 6 },
}


var _grid_disabled: bool = false
var _selected_level: Dictionary
var _images: Array[Dictionary]
var _attempts: int
var _selected_tiles: Array[MemoryTile]
var _revealed_tiles: Array[int]
var timer: Timer


func setup_level(level: int) -> void:
	_selected_level = LEVELS[level]
	_attempts = 0
	_images = []
	timer = Timer.new()
	while _images.size() < _selected_level.rows * _selected_level.cols:
		var image = ImageManager.get_random_image()
		if image not in _images:
			_images.append(image)
			_images.append(image)
	_images.shuffle()


func check_if_won() -> void:
	if _revealed_tiles.size() >= _images.size():
		game_won.emit()


func select_level(level: int) -> void:
	if level not in LEVELS:
		return
	
	setup_level(level)
	
	level_selected.emit()
	NavigationManager.navigate(NavigationManager.Routes.GAME)


func game_exit() -> void:
	_images = []
	_revealed_tiles = []
	_attempts = 0
	for scene in get_tree().get_nodes_in_group("won_scene"):
		scene.queue_free()
	for mt in get_tree().get_nodes_in_group("memory_tile"):
		mt.queue_free()
	NavigationManager.navigate(NavigationManager.Routes.MENU)


func hide_selected_tiles() -> void:
	for tl in _selected_tiles:
		tl.hide_tile()
	_selected_tiles = []
	_grid_disabled = false


func select_tile(tile: MemoryTile) -> void:
	_selected_tiles.append(tile)
	tile.reveal_tile()
	if _selected_tiles.size() >= 2:
		if _attempts <= 0:
			_attempts += 1
		if _selected_tiles[0]._image_name == _selected_tiles[1]._image_name:
			for tl in _selected_tiles:
				_revealed_tiles.append(tl._index)
			_selected_tiles = []
		else:
			_attempts += 1
			_grid_disabled = true
			pass
	tile_selected.emit()
	check_if_won()
