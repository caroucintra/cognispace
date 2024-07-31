extends Control

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Menus/Menu.tscn")

func _on_tdm_button_pressed():
		get_tree().change_scene_to_file("res://Scenes/TornadoDaMemoria/Instructions.tscn")

func _on_pp_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/ParPerfeito/Instructions.tscn")

func _on_ct_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/ContandoTrocos/Instructions.tscn")

func _on_tp_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/TudoPronto/Instructions.tscn")
