extends CanvasLayer
signal megaphone 
signal newspaper 
signal phone 
@onready var newUpgradeLabel = $NewUpgradeLabel
@onready var inGameHUD = get_node("/root/main/InGameHUD") 
@onready var sound = $CashSFX 
# Called when the node enters the scene tree for the first time.
func _ready():
	hide() 
	newUpgradeLabel.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_megaphone_button_pressed():  
	if inGameHUD.money >= 500:
		$MegaphoneButton.disabled = true  
		inGameHUD.update_Money(500) 
		$MoneyLabel.text = "Donations: " + str(inGameHUD.money)  
		sound.play()
		megaphone.emit()
	


func _on_newspaper_button_pressed():  
	if inGameHUD.money >= 1500:
		$NewspaperButton.disabled = true  
		inGameHUD.update_Money(1500)
		$MoneyLabel.text = "Donations: " + str(inGameHUD.money) 
		sound.play()
		newspaper.emit()


func _on_phone_button_pressed(): 
	if inGameHUD.money >= 3000:	
		$PhoneButton.disabled = true  
		inGameHUD.update_Money(3000)
		$MoneyLabel.text = "Donations: " + str(inGameHUD.money) 
		sound.play()
		phone.emit()


func _on_in_game_hud_shop_pressed(): 
	show() 
	$MoneyLabel.text = "Donations: " + str(inGameHUD.money)
	get_tree().paused = true 
	


func _on_close_button_pressed():
	hide()  
	sound.stop() 
	newUpgradeLabel.set_visible(false)
	get_tree().paused = false


func _on_in_game_hud_auto_pressed():
	show() 
	newUpgradeLabel.set_visible(true)  
	$MoneyLabel.text = "Donations: " + str(inGameHUD.money)
	get_tree().paused = true 
	
