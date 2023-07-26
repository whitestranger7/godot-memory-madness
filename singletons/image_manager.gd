extends Node


const IMAGES_PATH = "res://assets/glitch/"
var images_list: Array[Dictionary] = []


func _ready() -> void:
	load_images()


func add_to_images_list(fn: String) -> void:
	var image_object = {
		"item_name": fn.rstrip(".png"),
		"item_texture": load(IMAGES_PATH + fn)
	}
	images_list.append(image_object)


func load_images() -> void:
	var dir = DirAccess.open(IMAGES_PATH)
	
	if not dir:
		print("Error with images path")
		return
	
	var file_names = dir.get_files()
	for fn in file_names:
		if ".import" not in fn:
			add_to_images_list(fn)


func get_random_image() -> Dictionary:
	return images_list.pick_random()
