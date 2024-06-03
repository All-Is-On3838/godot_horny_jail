extends Area2D

class_name bat

@onready var bat_sprite = $bat_sprite
@onready var animation_player = $AnimationPlayer
@onready var body_collision_shape = $BodyCollisionShape

var input_direction : Vector2 = Vector2.ZERO
var facing_direction = Vector2.RIGHT  # Initialize facing direction to right

func _physics_process(_delta):
	#change x direction
	if input_direction.x != 0:
		facing_direction.x = input_direction.x
		bat_sprite.flip_h = input_direction.x < 0
		bat_sprite.position.x = -120.0 if bat_sprite.flip_h else 45.5
		body_collision_shape.position.x = -120.0 if bat_sprite.flip_h else 45.5
		
	else:
		bat_sprite.flip_h = facing_direction.x < 0
		bat_sprite.position.x = -120.0 if bat_sprite.flip_h else 45.5
		body_collision_shape.position.x = -120.0 if bat_sprite.flip_h else 45.5

func _input(event):
	if event.is_action_pressed("attack"):
		animation_player.play("bonk")
		
func _on_body_entered(body):
	print("on body entered")
	if body.has_method("take_damage"):
		body.take_damage()
