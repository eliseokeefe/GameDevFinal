extends CanvasLayer
<<<<<<< HEAD
@onready var timer := 120 
@onready var score := 0 
@onready var money := 0
=======
@onready var timer := 120
@onready var score := 0
>>>>>>> 800f1c602e2871a4ede34342e9639f71fea9ec49
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
	money += 100
	$ScoreLabel.text = str(score)

