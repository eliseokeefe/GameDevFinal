extends CanvasLayer

@onready var timer := 60 
@onready var new_score := 0
#signal shopPressed 
signal timeUp
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	pass


func _on_timer_timeout():   
	if timer == 0: 
		timeUp.emit() 
		get_tree().change_scene_to_file("res://end.tscn")
		return 
	timer -= 1
	$timer_label.text = str(timer) 

func update_Score():
	new_score -= 50
	

