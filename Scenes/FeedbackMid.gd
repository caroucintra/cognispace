extends Control
var voices = DisplayServer.tts_get_voices_for_language("pt")
var voice_id = voices[0]

# 3 answers correct = "Bom"
# 4 answers correct = "Muito Bom"
# 5 answers correct = "Excelente"

func _ready():
	Global.level += 1
	var score = "Bom"
	if (Global.game_name == "ContandoTrocos" or Global.game_name == "ParPerfeito"):
		if (Global.points >= 5.0):
			score = "Excelente"
		elif (Global.points >= 4.0):
			score = "Muito Bom"
	else:
		if (Global.points >= 3.0):
			score = "Excelente"
		elif (Global.points >= 2.0):
			score = "Muito Bom"

	$VBoxContainer/Label.text = "Parabéns!\nVocê avançou para o nível " + str(Global.level) + "! A sua pontuação neste nível foi '" + score + "'!"
	if (Global.tts):
		DisplayServer.tts_speak($VBoxContainer/Label.text, voice_id)
		$AnimationPlayer.play("text_player_no_sound")
	else:
		$AnimationPlayer.play("text_player")

func _on_continuar_button_pressed():
	Global.points = 0
	Global.games = 0
	DisplayServer.tts_stop()
	var rng = RandomNumberGenerator.new()
	var rnd = rng.randi_range(1, Global.num_of_scenes)
	get_tree().change_scene_to_file("res://Scenes/" + Global.game_name + "/Level" + str(Global.level)+ "/Scene" + str(rnd) + ".tscn")

func _on_voltar_button_pressed():
	DisplayServer.tts_stop()
	get_tree().change_scene_to_file("res://Menus/MiniGamesMenu.tscn")


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:
			$AnimationPlayer.seek(10, true)
