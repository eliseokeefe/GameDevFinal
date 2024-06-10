extends Node2D

@onready var score_label := $ScoreLabel

func _on_ready():
	$change1.text = str(ScoreManager.score)
	$change2.text = "0"
