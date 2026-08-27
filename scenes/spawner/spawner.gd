extends Node


@export var platform_scene: PackedScene


const _OFFSET_HOR = Vector2(1.7, 4.0)
const _OFFSET_VER = Vector2(2.7, 4.0)


func _ready():
	SignalHub.new_platform.connect(on_spawn_platform)

func get_rand_offset(range: Vector2) -> float:
	var mag = randf_range(range.x, range.y)
	return mag if randf() < 0.5 else -mag

func on_spawn_platform(old_pos: Vector3):
	var new_platform: Platform = platform_scene.instantiate()
	new_platform.position = old_pos + Vector3(
		get_rand_offset(_OFFSET_HOR),
		randf_range(_OFFSET_VER.x, _OFFSET_VER.y),
		get_rand_offset(_OFFSET_HOR)
	)
	add_child(new_platform)
