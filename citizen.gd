extends CharacterBody2D

var rng = RandomNumberGenerator.new()
var convinced = false
var evil = false
var health = 50
signal mind_changed

func _on_ready():
	var speed = randf_range(50.0,90.0)
	velocity.x = speed

func _physics_process(delta):
	move_and_slide()

func go_the_other_direction():
	var speed = randf_range(-50.0,-90.0)
	velocity.x = speed
	$AnimatedSprite2D.flip_h = true

func flash():
	var tween: Tween = create_tween()
	tween.tween_property($AnimatedSprite2D, "modulate:v", 1, 0.25).from(300)

func change_mind():
	convinced = true
	mind_changed.emit()
	$AnimatedSprite2D.modulate = Color(1, 1, 0)

func change_mind_back():
	evil = false
	mind_changed.emit()
	$AnimatedSprite2D.modulate = Color(1, 1, 1)

func citizen_evil_now():
	change_mind()
	health = 200
	evil = true

func _on_timer_timeout():
	queue_free()

func _on_hurt_box_area_entered(area):
	if area.is_in_group("projectiles") and !convinced:
		health -= area.damage;
		flash()
		$PixelHitSound.play()
		if health <= 0:
			$HmmHitSound.play()
			change_mind()
		else:
			$PixelHitSound.play()
	elif area.is_in_group("projectiles") and evil:
		health -= area.damage;
		flash()
		if health <= 0:
			$HmmHitSound.play()
			change_mind_back()
		else:
			$PixelHitSound.play()
