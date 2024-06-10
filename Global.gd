extends Node2D

var currentSpeech = preload("res://player sprites/speech.tscn")
var spriteColor = Color(1.0, 1.0, 0, 1.0)
var score_type = 1

func set_powerup(powerup_scene):
	currentSpeech = powerup_scene
	
func get_powerup():
	return currentSpeech

func set_color(color):
	spriteColor = color

func get_color(): 
	return spriteColor 
	

	
