extends CharacterBody2D

signal facing_direction_changed(facing_right : bool)

@export var move_speed : float = 400
@onready var bonker_sprite = $bonker_sprite
@onready var bat_node = $bonker_sprite/bat
var facing_direction = Vector2.RIGHT  # Initialize facing direction to right
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(_delta):
	# prevent player going out of screen
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
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
		emit_signal("facing_direction_changed", false)
	else:
		bonker_sprite.flip_h = facing_direction.x < 0
		emit_signal("facing_direction_changed", true)
