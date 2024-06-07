extends Control


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
	pass


func _on_ready():
	$Label.text = "Congratulations on convincing " + str(ScoreManager.score) +" people! 
You now realize your information was incorrect and you need to alert all the people you previously convinced. Can you revert their opinions back?"
