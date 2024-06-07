extends Area2D

var speed = 300 #can be changed

func _ready():
	set_as_top_level(true)
	
func _process(delta):
	position += (Vector2.RIGHT*speed).rotated(rotation) * delta
	


func _on_visible_on_screen_enabler_2d_screen_exited():
	pass # Replace with function body.
