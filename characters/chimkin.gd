extends CharacterBody2D

@onready var bonker = get_node("/root/main/bonker")
@onready var chimkin_sprite = $chimkin_sprite
	
func _physics_process(_delta):
	#var horny_doge_direction = global_position.direction_to(horny_doge.global_position)
	#var horny_doge_distance = global_position.distance_to(horny_doge.global_position)
	var bonker_direction = global_position.direction_to(bonker.global_position)
	var bonker_distance = global_position.distance_to(bonker.global_position)
	
	if bonker_distance > 200:
		$AnimationPlayer.play("walk")
		velocity = bonker_direction * 100
		move_and_slide()
	else:
		$AnimationPlayer.stop()
		velocity = Vector2.ZERO
		
	#if horny_doge_distance > 200:
		#$AnimationPlayer.play("walk")
		#velocity = horny_doge_direction * -100
		#move_and_slide()
	#else:
		#$AnimationPlayer.stop()
		#velocity = Vector2.ZERO
		

