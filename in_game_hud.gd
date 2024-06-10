extends CanvasLayer
@onready var timer
@onready var score := 0 
@onready var money := 0 
signal shopPressed 
signal timeUp
# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().name == "part_2": 
		timer = 60 
		$ShopButton.set_visible(false) 
		$AnimatedSprite2D.set_visible(false) 
		$DonationLabel.set_visible(false) 
	else: 
		timer = 120


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	pass


func _on_shop_button_pressed():
	shopPressed.emit()


func _on_timer_timeout():   
	if timer == 0 && get_parent().name != "part_2": 
		timeUp.emit() 
		ScoreManager.set_first_score(score)
		get_tree().change_scene_to_file("res://popup.tscn")  
		return 
	elif timer == 0 && get_parent().name == "part_2":
		#print("game hud " + str(score))
		ScoreManager.set_second_score(score)
		get_tree().change_scene_to_file("res://end.tscn") 
		return
	timer -= 1
	$TimerLabel.text = str(timer) 

func update_Score():
	score += 100
	money += 100 
	ScoreManager.score += 1
	$ScoreLabel.text = str(score) 
	$DonationLabel.text = "Donations: " + str(money) 

func update_Money(num): 
	money -= num 
	$DonationLabel.text = "Donations: " + str(money)

func _on_citizen_spawner_change_score():
	update_Score()
