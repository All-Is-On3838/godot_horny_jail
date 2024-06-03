extends CharacterBody2D

@onready var bonker = get_node("/root/main/bonker")
@onready var chimkin_sprite = $chimkin_sprite
	
func _physics_process(_delta):
	var bonker_direction = global_position.direction_to(bonker.global_position)
	var bonker_distance = global_position.distance_to(bonker.global_position)
	
	if bonker_distance > 50:
		$AnimationPlayer.play("walk")
		velocity = bonker_direction * 100
		move_and_slide()
	else:
		$AnimationPlayer.stop()
		velocity = Vector2.ZERO

	
