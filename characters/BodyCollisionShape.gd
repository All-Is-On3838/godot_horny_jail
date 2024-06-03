extends CollisionShape2D

@onready var bonker = get_node("res://characters/bonker.tscn")
@onready var direction = bonker.connect("facing_direction_changed", on_facing_right)
	
func on_facing_right():
	if direction == false:
		self.position.x = -48
	else:
		self.position.x = 48
