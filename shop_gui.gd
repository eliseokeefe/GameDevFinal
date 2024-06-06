extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_megaphone_button_pressed():
	$MegaphoneButton.disabled = true 
	


func _on_newspaper_button_pressed():
	$NewspaperButton.disabled = true


func _on_phone_button_pressed():
	$PhoneButton.disabled = true
	
