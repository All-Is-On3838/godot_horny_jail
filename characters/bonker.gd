extends CharacterBody2D

@export var move_speed : float = 400
@onready var bonker_sprite = $bonker_sprite
@onready var bat_node = $bonker_sprite/bat
var facing_direction = Vector2.RIGHT  # Initialize facing direction to right

func _physics_process(_delta):
	# get input direction
	var input_direction = Input.get_vector("left","right","up","down")
	
	# Set input_direction in the child node
	bat_node.input_direction = input_direction
	
	# update velocity
	velocity = input_direction * move_speed
	
	# move and slide function uses velocity of character body to move character on map
	move_and_slide()
	
	# Change x direction
	if input_direction.x != 0:
		facing_direction.x = input_direction.x
		bonker_sprite.flip_h = input_direction.x < 0
	else:
		bonker_sprite.flip_h = facing_direction.x < 0
