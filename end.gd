extends Node2D


@onready var inGameHUD = get_node("/root//in_game_hud")
#@onready var score_label := $ScoreLabel

func _ready():
	$change1.text = str(ScoreManager.score)
	$change2.text = str(inGameHUD.score)
