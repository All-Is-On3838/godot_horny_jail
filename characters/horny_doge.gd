extends CharacterBody2D

var health = 1
@onready var chimkin = get_node("/root/main/chimkin")

func _physics_process(_delta):
	var direction = global_position.direction_to(chimkin.global_position)
	var distance = global_position.distance_to(chimkin.global_position)
	
	if distance > 50:
		velocity = direction * 150
		move_and_slide()
	else:
		velocity = Vector2.ZERO

func take_damage():
	print("take damage")
	health -= 1
	
	if health == 0:
		queue_free()
