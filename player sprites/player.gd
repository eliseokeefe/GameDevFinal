extends CharacterBody2D

var speed = 100 
var cooldown = true 
var speech = preload("res://player sprites/speech.tscn")

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
	
	if Input.is_action_just_pressed("left_mouse") and cooldown: 
		cooldown = false 
		var speech_instance = speech.instantiate()
		speech_instance.rotation = $Marker2D.rotation
		speech_instance.global_position = $Marker2D.global_position
		add_child(speech_instance)
		
		await get_tree().create_timer(0.4).timeout
		cooldown = true 
		
	
	

