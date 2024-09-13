extends Control

func _ready():
	if Global.tts:
		$VBoxContainer/TextToSpeechCheckbox.button_pressed = true
	if Global.sound:
		$VBoxContainer/SoundCheckbox.button_pressed = true

func _on_voltar_button_pressed():
	get_tree().change_scene_to_file("res://Menus/Menu.tscn")


func _on_text_to_speech_checkbox_toggled(toggled_on):
	if (toggled_on):
		Global.tts = true
	else:
		Global.tts = false

func _on_sound_checkbox_toggled(toggled_on):
	if (toggled_on):
		Global.sound = true
	else:
		Global.sound = false
