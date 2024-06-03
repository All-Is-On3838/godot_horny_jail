class_name global
extends Node

var current_scene = null

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	
func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	print(String(path))

	# Load the new scene.
	var s = load(path)
	print(s)
	## Instance the new scene.
	#current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().change_scene_to_file(path)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene
