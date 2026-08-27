extends Control


@onready var game_over_color_rect: ColorRect = $GameOverColorRect
@onready var score_label: Label = $MarginContainer/ScoreLabel
@onready var high_score_label: Label = $MarginContainer/HighScoreLabel


func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()

func _enter_tree() -> void:
	get_tree().paused = false

func _ready():
	SignalHub.game_over.connect(func():
		game_over_color_rect.show()
		get_tree().paused = true
	)
	SignalHub.new_height.connect(func(height: int):
		score_label.text = "%04d" % height
	)
	high_score_label.text = "%04d" % ScoreManager.high_score
