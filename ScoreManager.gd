extends Node

@onready var score = 0
var score_1
var score_2 

func set_first_score(new_score):
	score_1 = new_score 

func get_first_score(): 
	return score_1 
	
func set_second_score(new_score):
	score_2 = new_score 
	#print("score manager " + str(score_2))

func get_second_score(): 
	return score_2 
