extends CharacterBody2D

var speed = 100 
var cooldown = true 
var speech = preload("res://player sprites/speech.tscn")
var megaphone = preload("res://player sprites/Image (8).jpeg")
var newspaper = preload("res://player sprites/IMG_8149.PNG")
var phone = preload("res://player sprites/IMG_8159.PNG")
var powerup = speech.instantiate()


func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		$AnimatedSprite2D.play("idle")
	elif direction.x < 0:
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = true 
	else: 
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = false
	
	velocity = direction * speed 
	move_and_slide() 
	
	var mouse_pos = get_global_mouse_position()
	$Marker2D.look_at(mouse_pos)
	
	_play_anim(powerup)
	
	
func _on_shop_gui_megaphone():
	powerup = megaphone.instantiate() 
	
func _play_anim(powerup):
	if Input.is_action_just_pressed("left_mouse") and cooldown: 
		cooldown = false 
		#var direction = Input.get_vector("left", "right", "up", "down")
		#if direction.x < 0: 
		#	powerup.flip_h = true 
		#elif direction.x >= 0: 
	#		powerup.flip_h = false 
		powerup.rotation = $Marker2D.rotation
		powerup.global_position = $Marker2D.global_position
		add_child(powerup)
		
		await get_tree().create_timer(0.4).timeout
		cooldown = true 

func _on_shop_gui_newspaper():
	powerup = newspaper.instantiate() 

func _on_shop_gui_phone():
	powerup = phone.instantiate() 
