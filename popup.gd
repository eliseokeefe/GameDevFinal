extends Control


func _on_button_pressed():
	get_tree().change_scene_to_file("res://part_2.tscn")
	pass


func _on_ready():
	if (ScoreManager.score == 1):
		$Label.text = "Congratulations on convincing " + str(ScoreManager.score) + " person!
		You now learn your information was incorrect and you need to alert all the people you convinced. Can you revert their opinions?"
	else: 
		$Label.text = "Congratulations on convincing " + str(ScoreManager.score) + " people!
		You now learn your information was incorrect and you need to alert all the people you convinced. Can you revert their opinions?"
