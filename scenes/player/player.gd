class_name Player
extends CharacterBody3D


@onready var animation_player: AnimationPlayer = $"character-female-a2/AnimationPlayer"


const _JUMP_FORCE = 20.0
const _GRAVITY = 40.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta: float):
	handle_gravity(delta)
	handle_animation()
	move_and_slide()

func handle_gravity(delta: float):
	velocity.y -= _GRAVITY * delta
	if is_on_floor():
		velocity.y = _JUMP_FORCE

func handle_animation():
	if velocity.y > 0: animation_player.play("jump")
	else: animation_player.play("fall")
