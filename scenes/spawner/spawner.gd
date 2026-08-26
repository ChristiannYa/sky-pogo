extends Node


@export var platform_scene: PackedScene
@onready var platform: Platform = $Platform


func _ready():
	platform.new.connect(on_spawn_platform)

func on_spawn_platform(old_pos: Vector3):
	var new_platform: Platform = platform_scene.instantiate()
	new_platform.new.connect(on_spawn_platform)
	new_platform.position = old_pos + Vector3(2, 2, -2)
	add_child(new_platform)
