extends Control
var voices = DisplayServer.tts_get_voices_for_language("pt")
var voice_id = voices[0]

func _ready():
	if (Global.tts):
		DisplayServer.tts_speak($VBoxContainer/Label.text, voice_id)


func _on_back_button_pressed():
	DisplayServer.tts_stop()
	get_tree().change_scene_to_file("res://Menus/MiniGamesMenu.tscn")


func _on_ok_button_pressed():
	Global.start_minigame()
	Global.game_name = "ParPerfeito"
	Global.num_of_scenes = 6
	DisplayServer.tts_stop()
	var rng = RandomNumberGenerator.new()
	var rnd = rng.randi_range(1, Global.num_of_scenes)
	get_tree().change_scene_to_file("res://Scenes/ParPerfeito/Level1/Scene" + str(rnd) + ".tscn")


func _on_voltar_button_pressed():
	DisplayServer.tts_stop()
	get_tree().change_scene_to_file("res://Menus/MiniGamesMenu.tscn")

