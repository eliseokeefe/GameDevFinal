extends CanvasLayer
signal megaphone 
signal newspaper 
signal phone 

@onready var inGameHUD = get_node("/root/main/InGameHUD")
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_megaphone_button_pressed():  
	if inGameHUD.score > 1000:
		$MegaphoneButton.disabled = true  
		megaphone.emit()
	


func _on_newspaper_button_pressed():  
	if inGameHUD.score > 50000:
		$NewspaperButton.disabled = true 
		newspaper.emit()


func _on_phone_button_pressed(): 
	if inGameHUD.score > 100000:	
		$PhoneButton.disabled = true
		phone.emit()


func _on_in_game_hud_shop_pressed(): 
	show()
	get_tree().paused = true


func _on_close_button_pressed():
	hide() 
	get_tree().paused = false
