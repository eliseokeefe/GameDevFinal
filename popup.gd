extends Control
@onready var score_label := $ScoreLabel


func set_score(value):
	score_label.text = "Final Score: " + str(value)
