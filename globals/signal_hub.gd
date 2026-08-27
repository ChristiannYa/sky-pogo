extends Node


signal new_platform(pos: Vector3)
signal game_over

func emit_new_platform(pos: Vector3):
	new_platform.emit(pos)

func emit_game_over():
	game_over.emit()
