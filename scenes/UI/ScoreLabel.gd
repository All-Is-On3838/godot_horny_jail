extends Label

@onready var doge = get_node("res://characters/horny_doge.tscn")
@onready var score = Global.score
func _ready():
	doge.connect("doge_down", _on_doge_down)
	print(score)

func _on_doge_down():
	print("score update")
	$Label.text = "Score: %s" % score


#func update_score_label(score: int) -> void:
	#$Label.text = "Score: %d" % score
	#print("text: ", text)
