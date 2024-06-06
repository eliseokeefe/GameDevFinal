extends Area2D


var speed = 350 #can be changed
var damage = 50 
var direction: Vector2 

	
func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

 
func _ready():
	add_to_group("projectiles")
	set_as_top_level(true)
	
func _process(delta):
	var angle = atan2(direction.y, direction.x)
	if direction.x > 0:
		$Sprite2D.flip_h = false 
		rotation = angle 
	else: 
		$Sprite2D.flip_h = true
		rotation = angle + 2*PI 
		
	position += (direction.normalized() *speed) * delta
	
