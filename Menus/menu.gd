extends Control

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Introduction.tscn")


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Menus/OptionsMenu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
