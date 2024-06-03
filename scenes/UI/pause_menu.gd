class_name PauseMenu
extends Control

func _on_retry_button_down():
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_menu_button_down():
	Global.goto_scene("res://scenes/UI/main_menu.tscn")

func _on_options_button_down():
	pass # Replace with function body.

func _on_quit_button_down():
	get_tree().quit()
