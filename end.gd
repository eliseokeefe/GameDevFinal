extends Node2D


#@onready var inGameHUD = get_node("/root/end/InGameHUD")
#@onready var score_label := $ScoreLabel

func _ready():
	var viewportWidth = get_viewport().size.x
	var viewportHeight = get_viewport().size.y
	
	var screen_scale = viewportWidth / $background.texture.get_size().x
	$background.set_position(Vector2(viewportWidth/2, viewportHeight/2))
	$background.set_scale(Vector2(screen_scale, screen_scale))
	
	$Button.visible = false 
	$change1.text = str(ScoreManager.get_first_score()/100)
	$change2.text = str(ScoreManager.get_second_score()/100)
	await get_tree().create_timer(3).timeout
	$Button.visible = true 


func _on_button_pressed():
	get_tree().change_scene_to_file("res://start.tscn")
