extends Node2D

var horny_doge_scene = preload("res://characters/horny_doge.tscn")
@onready var score_label = $PlayerUI/TextureRect/Label

func spawn_mob():
	var new_doge = horny_doge_scene.instantiate()
	new_doge.connect("chimkin_got", _on_chimkin_got)
	new_doge.connect("doge_down", _on_doge_down)
	%PathFollow2D.progress_ratio = randf()
	new_doge.global_position = %PathFollow2D.global_position
	add_child(new_doge)

func _on_timer_timeout():
	spawn_mob()

func _on_chimkin_got():
	get_tree().change_scene_to_file("res://scenes/UI/pause_menu.tscn")

func _on_doge_down():
	Globals.score += 1
	score_label.text = "%s" % Globals.score
