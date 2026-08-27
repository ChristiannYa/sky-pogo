extends Control


@onready var game_over_color_rect: ColorRect = $GameOverColorRect
@onready var score_label: Label = $MarginContainer/ScoreLabel


func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()

func _enter_tree() -> void:
	get_tree().paused = false

func _ready():
	SignalHub.game_over.connect(on_game_over)
	SignalHub.new_height.connect(on_new_height)

func on_game_over():
	game_over_color_rect.show()
	get_tree().paused = true

func on_new_height(height: int):
	score_label.text = "%04d" % height
