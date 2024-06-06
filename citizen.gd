extends CharacterBody2D

var rng = RandomNumberGenerator.new()
var convinced = false

func _on_ready():
	var speed = randf_range(50.0,90.0)
	velocity.x = speed

func _physics_process(delta):
	move_and_slide()

func go_the_other_direction():
	var speed = randf_range(-50.0,-90.0)
	velocity.x = speed
	$AnimatedSprite2D.flip_h = true

func change_mind():
	convinced = true
	$AnimatedSprite2D.modulate = Color(1, 1, 0)

func _on_timer_timeout():
	queue_free()

func _on_hurt_box_area_entered(area):
	if area.is_in_group("projectiles"):
		change_mind()
