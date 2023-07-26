extends TextureRect


const SMALL_SCALE = Vector2(0.1, 0.1)
const NORMAL_SCALE = Vector2(1, 1)
const ANIMATION_SPEED = Vector2(0.5, 1)


func _ready() -> void:
	run_tween()


func set_random_texture() -> void:
	texture = ImageManager.get_random_image().item_texture


func get_animation_time() -> float:
	return randf_range(ANIMATION_SPEED.x, ANIMATION_SPEED.y)


func get_rotation_angle() -> float:
	return deg_to_rad(randf_range(-360, 360))


func run_tween() -> void:
	var tween = create_tween()
	tween.set_loops()
	tween.tween_callback(set_random_texture)
	tween.tween_property(self, "scale", SMALL_SCALE, get_animation_time())
	tween.tween_property(self, "rotation", get_rotation_angle(), get_animation_time())
	tween.tween_property(self, "scale", NORMAL_SCALE, get_animation_time())
	tween.tween_property(self, "rotation", get_rotation_angle(), get_animation_time())
