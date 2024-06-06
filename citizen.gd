extends CharacterBody2D

var rng = RandomNumberGenerator.new()
var convinced = false

func _on_ready():
	var speed = randf_range(75.0,150.0)
	velocity.x = speed

func _physics_process(delta):
	move_and_slide()
