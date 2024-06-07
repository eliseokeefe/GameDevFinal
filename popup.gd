extends Control
@onready var score_label := $ScoreLabel


func _on_button_pressed():
	get_tree().change_scene_to_file("res://part_2.tscn")
	pass
