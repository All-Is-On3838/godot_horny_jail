extends Node

var current_scene = null
var score = 0

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	
func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)

func _deferred_goto_scene(path):
	load(path)
	get_tree().change_scene_to_file(path)
	get_tree().current_scene = current_scene
