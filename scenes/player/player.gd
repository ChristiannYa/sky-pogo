class_name Player
extends CharacterBody3D

const JUMP_FORCE = 20.0

var _gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float):
	handle_gravity(delta)
	move_and_slide()

func handle_gravity(delta: float):
	velocity.y -= _gravity * delta
	if is_on_floor():
		velocity.y = JUMP_FORCE
