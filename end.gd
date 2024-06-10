extends Node2D

#@onready var score_label := $ScoreLabel

func _ready():
	$change1.text = str(ScoreManager.score)
	$change2.text = str(ScoreManager.score_1/100)
