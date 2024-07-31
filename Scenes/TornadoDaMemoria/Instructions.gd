extends Control
var voices = DisplayServer.tts_get_voices_for_language("pt")
var voice_id = voices[0]

func _ready():
	if (Global.tts):
		DisplayServer.tts_speak($VBoxContainer/Label.text, voice_id)
		$AnimationPlayer.play("text_player_no_sound")
	else:
		$AnimationPlayer.play("text_player")


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
	get_tree().change_scene_to_file("res://Menus/MiniGamesMenu.tscn")


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:
			$AnimationPlayer.seek(20, true)
