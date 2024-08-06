extends Control
var voices = DisplayServer.tts_get_voices_for_language("pt")
var voice_id = voices[0]

func _ready():
	if (Global.tts):
		DisplayServer.tts_speak($VBoxContainer/Label.text, voice_id)


func _on_back_button_pressed():
	DisplayServer.tts_stop()
	get_tree().change_scene_to_file("res://Menus/Menu.tscn")


func _on_ok_button_pressed():
	DisplayServer.tts_stop()
	get_tree().change_scene_to_file("res://Scenes/Clock.tscn")


func _on_voltar_button_pressed():
	DisplayServer.tts_stop()
	get_tree().change_scene_to_file("res://Menus/Menu.tscn")
