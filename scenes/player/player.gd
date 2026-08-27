class_name Player
extends CharacterBody3D


@onready var animation_player: AnimationPlayer = $"character-female-a2/AnimationPlayer"


const _JUMP_FORCE = 20.0
const _GRAVITY = 40.0
const _ROTATION_SPEED = 4.0
const _MOVE_SPEED = 4.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta: float):
	handle_gravity(delta)
	handle_rotation(delta)
	handle_movement()
	handle_air_hop()
	handle_animation()
	move_and_slide()

func handle_gravity(delta: float):
	velocity.y -= _GRAVITY * delta
	if is_on_floor(): velocity.y = _JUMP_FORCE

func handle_rotation(delta: float):
	var base: float = _ROTATION_SPEED * delta
	if Input.is_action_pressed("ui_left"):
		rotate_y(base)
	if Input.is_action_pressed("ui_right"):
		rotate_y(-base)

func handle_movement():
	var forward: Vector3 = transform.basis.z * Input.get_action_strength("ui_up")
	velocity.x = forward.x * _MOVE_SPEED
	velocity.z = forward.z * _MOVE_SPEED
	
var can_air_hop = false
func handle_air_hop():
	if is_on_floor(): can_air_hop = true
	if Input.is_action_just_pressed("space") and can_air_hop:
		can_air_hop = false
		velocity.y = _JUMP_FORCE * 0.6

func handle_animation():
	if velocity.y > 0: animation_player.play("jump")
	else: animation_player.play("fall")
