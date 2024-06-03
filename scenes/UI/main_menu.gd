class_name MainMenu
extends Control

func _on_start_button_down():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
func _on_options_button_down():
	pass # Replace with function body.

func _on_quit_button_down():
	get_tree().quit()
