extends Node

@onready var score = 0
var score_1 = 0

func set_first_score(new_score):
	score_1 = new_score 

func get_first_score(): 
	return score_1 
