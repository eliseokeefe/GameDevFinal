extends CharacterBody2D

var speed = 100 
var cooldown = true 
var speech = preload("res://player sprites/speech.tscn")
var megaphone = preload("res://megaphone.tscn")
var newspaper = preload("res://newspaper.tscn")
var phone = preload("res://phone.tscn") 

var currentSpeech = speech;

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

	
	if Input.is_action_just_pressed("left_mouse") and cooldown: 
		shoot()

	
func shoot():
		cooldown = false 
		var newSpeech = currentSpeech.instantiate()
		get_parent().add_child(newSpeech)
		var mouse_pos = get_global_mouse_position()
		newSpeech.direction = mouse_pos - global_position 
		newSpeech.global_position = global_position 
		await get_tree().create_timer(0.4).timeout
		cooldown = true 



func _on_in_game_hud_time_up():
	$AnimatedSprite2D.modulate = Color(1, 1, 1)


func _on_shop_gui_megaphone():
	currentSpeech = megaphone 


func _on_shop_gui_newspaper():
	currentSpeech = newspaper


func _on_shop_gui_phone():
	currentSpeech = phone 
