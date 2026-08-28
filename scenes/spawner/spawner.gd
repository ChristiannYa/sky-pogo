extends Node


@export var platform_scenes: Array[PackedScene]

@onready var platform: Platform = $Platform


const _OFFSET_HOR = Vector2(2.0, 4.0)
const _OFFSET_VER = Vector2(2.7, 4.0)


func _ready():
	SignalHub.new_platform.connect(func(old_pos: Vector3):
		var new_platform: Platform = platform_scenes.pick_random().instantiate()
		new_platform.position = old_pos + Vector3(
			get_rand_offset(_OFFSET_HOR),
			randf_range(_OFFSET_VER.x, _OFFSET_VER.y),
			get_rand_offset(_OFFSET_HOR)
		)
		add_child(new_platform)
	)

func get_rand_offset(offset_range: Vector2) -> float:
	var mag = randf_range(offset_range.x, offset_range.y)
	return mag if randf() < 0.5 else -mag
