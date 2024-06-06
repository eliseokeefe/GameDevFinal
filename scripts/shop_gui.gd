extends CanvasLayer
@onready var open := false 
signal megaphone 
signal newspaper 
signal phone

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_megaphone_button_pressed():
	$MegaphoneButton.disabled = true  
	megaphone.emit()
	


func _on_newspaper_button_pressed():
	$NewspaperButton.disabled = true 
	newspaper.emit()


func _on_phone_button_pressed():
	$PhoneButton.disabled = true
	phone.emit()
