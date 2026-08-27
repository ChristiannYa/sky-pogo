extends Node


signal new_platform(pos: Vector3)


func emit_new_platform(pos: Vector3):
	new_platform.emit(pos)
