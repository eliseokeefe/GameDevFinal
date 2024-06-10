extends Node

@export var citizen : PackedScene
@export var spawn_frequency := 2
@onready var timer : Timer = $Timer
var citizen_side = -1
var rng = RandomNumberGenerator.new()
var end_game = false
signal change_score

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(spawn_frequency)

func end_game_mode():
	end_game = true


func _on_timer_timeout():
	citizen_side = citizen_side * -1
	var instance = citizen.instantiate()
	get_parent().add_child(instance)
	instance.mind_changed.connect(_on_mind_changed)
	if citizen_side > 0:
		instance.position = Vector2(-700,rng.randi_range(-120, 275))
	else:
		instance.go_the_other_direction()
		instance.position = Vector2(1100,rng.randi_range(-120, 275))
	if end_game:
		instance.citizen_evil_now()
	# restart timer
	spawn_frequency = rng.randi_range(1, 2)
	timer.start(spawn_frequency)

func _on_mind_changed():
	change_score.emit()
