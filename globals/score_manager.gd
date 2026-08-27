extends Node

var high_score = 0

func _ready():
	SignalHub.new_height.connect(func(height: int):
		if height > high_score: high_score = height
	)
