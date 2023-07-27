extends TextureButton
class_name MemoryTile


@onready var frame_image: TextureRect = $FrameImage
@onready var image: TextureRect = $Image


var _visible: bool = false
var _index: int
var _image_name: String


func init(index: int, image_data: Dictionary) -> void:
	var image: TextureRect = $Image
	image.texture = image_data.item_texture
	_image_name = image_data.item_name
	_index = index


func set_visibility(value: bool) -> void:
	frame_image.set_visible(value)
	image.set_visible(value)
	_visible = value


func reveal_tile() -> void:
	set_visibility(true)


func hide_tile() -> void:
	set_visibility(false)


func can_be_selected() -> bool:
	if _index is int and _visible == false and !GameManager._grid_disabled:
		return true
	return false


func _on_pressed() -> void:
	if can_be_selected():
		GameManager.select_tile(self)
