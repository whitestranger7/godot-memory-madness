extends Control

@export var level_button: PackedScene
@onready var hb_levels: HBoxContainer = $VB/HBLevels


func _ready() -> void:
	load_levels()


func load_levels() -> void:
	for level in GameManager.LEVELS:
		var level_instance = level_button.instantiate()
		level_instance.init(level)
		hb_levels.add_child(level_instance)
