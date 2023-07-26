extends TextureButton
class_name MemoryTile


var _image_name: String


func init(image_data: Dictionary) -> void:
	var image: TextureRect = $Image
	image.texture = image_data.item_texture
	_image_name = image_data.item_name
