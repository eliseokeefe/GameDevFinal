extends Node2D

@onready var score_label := $ScoreLabel

func _on_ready():
	$change.text = "You convinced " + str(ScoreManager.score) + " people of your original message, but could only change ____ minds back towards the factual information."

