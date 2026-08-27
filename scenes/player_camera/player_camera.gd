extends Camera3D


@export var buffer = Vector3(0, 10, 8)


func _ready():
	SignalHub.new_platform.connect(on_spawn_platform)

func on_spawn_platform(old_pos: Vector3):
	position = old_pos + buffer
