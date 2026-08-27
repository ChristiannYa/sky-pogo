extends Control


@onready var game_over_color_rect: ColorRect = $GameOverColorRect


func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()

func _enter_tree() -> void:
	get_tree().paused = false

func _ready():
	SignalHub.game_over.connect(on_game_over)

func on_game_over():
	game_over_color_rect.show()
	get_tree().paused = true
