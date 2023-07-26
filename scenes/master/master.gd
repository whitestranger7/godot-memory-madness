extends CanvasLayer

@onready var game_scene: Control = $GameScene
@onready var main_scene: Control = $MainScene


func _ready() -> void:
	NavigationManager.route_changed.connect(on_route_changed)
	on_route_changed()


func on_route_changed() -> void:
	if NavigationManager.selected_route == NavigationManager.Routes.MENU:
		game_scene.set_visible(false)
		main_scene.set_visible(true)
	else:
		game_scene.set_visible(true)
		main_scene.set_visible(false)
