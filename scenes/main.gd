extends Node2D

var horny_doge_scene = preload("res://characters/horny_doge.tscn")

func spawn_mob():
	var new_doge = horny_doge_scene.instantiate()
	new_doge.connect("chimkin_got", _on_chimkin_got)
	%PathFollow2D.progress_ratio = randf()
	new_doge.global_position = %PathFollow2D.global_position
	add_child(new_doge)

func _on_timer_timeout():
	spawn_mob()

func _on_chimkin_got():
	%GameOver.visible = true
	get_tree().paused = true
