class_name Platform
extends Node3D

@export var wait_time = 4.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer


var _is_hit = false


func _on_timer_timeout():
	animation_player.play("vanish")

func _on_animation_player_animation_finished(anim_name: StringName):
	if anim_name == "vanish": queue_free()

func _on_area_3d_body_entered(body: Node3D):
	if body is Player:
		#
		if not _is_hit:
			_is_hit = true
			timer.start(wait_time * randf_range(0.75, 1.2))
			SignalHub.emit_new_platform(position)
