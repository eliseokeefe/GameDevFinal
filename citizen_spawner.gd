extends Node

@export var citizen : PackedScene
@export var spawn_frequency := 2
@onready var timer : Timer = $Timer
var citizen_side = -1
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(spawn_frequency)


func _on_timer_timeout():
	citizen_side = citizen_side * -1
	var instance = citizen.instantiate()
	get_parent().add_child(instance)
	if citizen_side > 0:
		instance.position = Vector2(-600,rng.randi_range(-120, 275))
	else:
		instance.go_the_other_direction()
		instance.position = Vector2(1100,rng.randi_range(-120, 275))
	# restart timer
	spawn_frequency = rng.randi_range(1, 2)
	timer.start(spawn_frequency)
