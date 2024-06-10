extends Node2D


#@onready var inGameHUD = get_node("/root/end/InGameHUD")
#@onready var score_label := $ScoreLabel

func _ready():
	$Button.visible = false 
	$change1.text = str(ScoreManager.get_first_score()/100)
	$change2.text = str(ScoreManager.get_second_score()/100)
	await get_tree().create_timer(3).timeout
	$Button.visible = true 
	
