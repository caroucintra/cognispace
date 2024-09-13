extends Control

var voices = DisplayServer.tts_get_voices_for_language("pt")
var voice_id = voices[0]

# got to the medium level = "Muito Bom"
# got to the highest level = "Excelente"
# else = "Bom"

func _ready():
	var time_minutes = str(Global.my_timer/60).pad_decimals(0)
	var time_seconds = str(fmod(Global.my_timer, 60)).pad_decimals(0)
	var score = ""
	match (Global.level):
		3:
			score = "Excelente"
		2:
			score = "Muito Bom"
		1:
			score = "Bom"
		_:
			pass
	if (score == "Excelente"):
		$VBoxContainer/HBoxContainer/star1.visible = true
		$VBoxContainer/HBoxContainer/star2.visible = true
		$VBoxContainer/HBoxContainer/star3.visible = true
	elif (score == "Muito Bom"):
		$VBoxContainer/HBoxContainer/star1.visible = true
		$VBoxContainer/HBoxContainer/star3.visible = true
	else:
		$VBoxContainer/HBoxContainer/star2.visible = true
	
	$VBoxContainer/Label.text = "Parabéns!\nVocê terminou este jogo em " + time_minutes + " minutos e " + time_seconds + " segundos. A sua pontuação foi '" + score + "'!"
	if (Global.tts):
		DisplayServer.tts_speak($VBoxContainer/Label.text, voice_id)
	elif (Global.sound):
		$CheerPlayer.play("Cheer/cheer_feedback")
	Global.end_minigame()

func _on_voltar_button_pressed():
	DisplayServer.tts_stop()
	get_tree().change_scene_to_file("res://Menus/MiniGamesMenu.tscn")
