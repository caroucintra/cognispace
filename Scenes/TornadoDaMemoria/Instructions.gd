extends Control
var voices = DisplayServer.tts_get_voices_for_language("pt")
var voice_id = voices[0]

func _ready():
	if (Global.tts):
		DisplayServer.tts_speak($VBoxContainer/Label1.text, voice_id)
		DisplayServer.tts_speak($VBoxContainer/HBoxContainer2/ColorRect/VBoxContainer/Label2.text, voice_id)
		DisplayServer.tts_speak($VBoxContainer/HBoxContainer2/ColorRect2/VBoxContainer/Label3.text, voice_id)
		DisplayServer.tts_speak($VBoxContainer/HBoxContainer2/ColorRect3/VBoxContainer/Label4.text, voice_id)
		DisplayServer.tts_speak($VBoxContainer/Label5.text, voice_id)


func _on_back_button_pressed():
	DisplayServer.tts_stop()
	get_tree().change_scene_to_file("res://Menus/MiniGamesMenu.tscn")


func _on_ok_button_pressed():
	DisplayServer.tts_stop()
	var rng = RandomNumberGenerator.new()
	var rnd = rng.randi_range(1, Global.num_of_scenes)
	Global.start_minigame()
	Global.game_name = "TornadoDaMemoria"
	get_tree().change_scene_to_file("res://Scenes/TornadoDaMemoria/Level1/Scene" + str(rnd) + ".tscn")


func _on_voltar_button_pressed():
	DisplayServer.tts_stop()
	get_tree().change_scene_to_file("res://Menus/MiniGamesMenu.tscn")
