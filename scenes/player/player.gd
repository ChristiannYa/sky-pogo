class_name Player
extends CharacterBody3D

var _gv = ProjectSettings.get_setting("physics/3d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	velocity.y -= _gv * delta
	move_and_slide()
