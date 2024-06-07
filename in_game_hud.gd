extends CanvasLayer

@onready var timer := 120

@onready var score := 0
signal shopPressed 
signal timeUp
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	pass


func _on_shop_button_pressed():
	shopPressed.emit()


func _on_timer_timeout():   
	if timer == 0: 
		timeUp.emit() 
		return
	timer -= 1
	$TimerLabel.text = str(timer) 

func update_Score():
	score += 100
	ScoreManager.score += 1
	$ScoreLabel.text = str(score)

func _on_citizen_spawner_change_score():
	update_Score()
