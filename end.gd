extends Node2D


#@onready var inGameHUD = get_node("/root/end/InGameHUD")
#@onready var score_label := $ScoreLabel

func _ready():
	$change1.text = str(ScoreManager.score_1/100)
	$change2.text = str(ScoreManager.score)
