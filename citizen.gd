extends CharacterBody2D

var rng = RandomNumberGenerator.new()
var convinced = false

func _on_ready():
	var speed = randf_range(50.0,90.0)
	print(speed)
	velocity.x = speed

func _physics_process(delta):
	move_and_slide()

func change_mind():
	convinced = true
	$AnimatedSprite2D.modulate = Color(1, 1, 0)

func _on_hurt_box_body_entered(body):
	if body.is_in_group("projectiles"):
		change_mind()
