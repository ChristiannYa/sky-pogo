extends Node


signal new_platform(pos: Vector3)
signal game_over
signal new_height(height: int)

func emit_new_platform(pos: Vector3):
	new_platform.emit(pos)

func emit_game_over():
	game_over.emit()

func emit_new_height(height: int):
	new_height.emit(height)
