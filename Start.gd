extends Control

func _on_ready():
	var viewportWidth = get_viewport().size.x
	var viewportHeight = get_viewport().size.y
	
	var screen_scale = viewportWidth / $"Screenshot2024-06-06At4_39_24 pm".texture.get_size().x
	$"Screenshot2024-06-06At4_39_24 pm".set_position(Vector2(viewportWidth/2, viewportHeight/2))
	$"Screenshot2024-06-06At4_39_24 pm".set_scale(Vector2(screen_scale, screen_scale))

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
