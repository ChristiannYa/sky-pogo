extends Control

@onready var game_over_color_rect: ColorRect = $GameOverColorRect


func _ready() -> void:
	SignalHub.game_over.connect(on_game_over)

func on_game_over():
	game_over_color_rect.show()
