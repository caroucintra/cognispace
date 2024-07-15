extends Control
var rng = RandomNumberGenerator.new()


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Menus/menu.tscn")

func _on_tdm_button_pressed():
		get_tree().change_scene_to_file("res://Scenes/TornadoDaMemoria/Level1/Scene" + str(rng.randi_range(1,1)) + ".tscn")

func _on_pp_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/ParPerfeito/Level1/Scene" + str(rng.randi_range(1,3)) + ".tscn")

func _on_ct_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/ContandoTrocos/Level1/Scene" + str(rng.randi_range(1,2)) + ".tscn")

func _on_tp_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/TudoPronto/Level1/Scene" + str(rng.randi_range(1,1)) + ".tscn")
