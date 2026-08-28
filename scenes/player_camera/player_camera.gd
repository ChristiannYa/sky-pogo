extends Camera3D


@export var buffer = Vector3(0, 10, 8)
@export var smooth_speed = 2.0


var _base_pos: Vector3


func _ready():
	SignalHub.new_platform.connect(func(old_pos: Vector3):
		_base_pos = old_pos + buffer	
	)
	_base_pos = position
	
func _physics_process(delta: float):
	position = position.lerp(_base_pos, smooth_speed * delta)
