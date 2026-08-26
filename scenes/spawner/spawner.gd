extends Node


@export var platform_scene: PackedScene


func on_spawn_platform(old_pos: Vector3):
	var new_platform: Platform = platform_scene.instantiate()
	new_platform.position = old_pos + Vector3(2, 2, -2)
	add_child(new_platform)
