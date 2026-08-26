class_name Player
extends CharacterBody3D

const _JUMP_FORCE = 20.0
const _GRAVITY = 40.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float):
	handle_gravity(delta)
	move_and_slide()

func handle_gravity(delta: float):
	velocity.y -= _GRAVITY * delta
	if is_on_floor():
		velocity.y = _JUMP_FORCE
