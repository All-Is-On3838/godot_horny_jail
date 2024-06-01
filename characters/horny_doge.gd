extends CharacterBody2D

@onready var chimkin = get_node("/root/main/chimkin")
@onready var animation_player = $AnimationPlayer

func _physics_process(_delta):
	var direction = global_position.direction_to(chimkin.global_position)
	var distance = global_position.distance_to(chimkin.global_position)
	
	if distance > 50:
		velocity = direction * 150
		move_and_slide()
	else:
		velocity = Vector2.ZERO
	
func take_damage():
	velocity = Vector2.ZERO
	animation_player.play("bonked")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "bonked":
		queue_free()
