extends Node


const SAVE_PATH = "user://sky.cfg"
const SECTION = "game"
const VALUE_KEY = "high_score"


var high_score = 0


func _enter_tree():
	load_score()

func _ready():
	SignalHub.new_height.connect(func(height: int):
		if height > high_score: high_score = height
	)
	SignalHub.game_over.connect(func(): save_score())

func save_score():
	var config := ConfigFile.new()
	config.set_value(SECTION, VALUE_KEY, high_score)
	config.save(SAVE_PATH)

func load_score():
	var config := ConfigFile.new()
	if config.load(SAVE_PATH) == OK:
		high_score = config.get_value(SECTION, VALUE_KEY, 0)
