extends Control
var hours = 0
var minutes = 0
var time = Time.get_time_dict_from_system()
var voices = DisplayServer.tts_get_voices_for_language("pt")
var voice_id = voices[0]

func _ready():
	if (Global.tts):
		DisplayServer.tts_speak($VBoxContainer/Label.text, voice_id)
	$VBoxContainer/HBoxContainer3/VBoxContainer2/HBoxContainer2/Minutes.text = str(minutes)
	$VBoxContainer/HBoxContainer3/VBoxContainer/HBoxContainer/Hours.text = str(hours)


func _process(_delta):
	$VBoxContainer/HBoxContainer3/VBoxContainer2/HBoxContainer2/Minutes.text = str(minutes)
	$VBoxContainer/HBoxContainer3/VBoxContainer/HBoxContainer/Hours.text = str(hours)

func _on_minus_hours_button_pressed():
	if hours > 0:
		hours -= 1
	else:
		hours = 23

func _on_plus_hours_button_pressed():
	if hours < 23:
		hours += 1
	else:
		hours = 0

func _on_plus_minutes_button_pressed():
	if minutes < 59:
		minutes += 1
	else:
		minutes = 0

func _on_minus_minutes_button_pressed():
	if minutes > 0:
		minutes -= 1
	else:
		minutes = 59

func _on_continuar_button_pressed():
	DisplayServer.tts_stop()
	if ((time["hour"] == hours or hours == time["hour"]-12) and (time["minute"] == minutes or (minutes >= time["minute"]-3 and minutes <= time["minute"]+3))):
		var dialog = AcceptDialog.new()
		dialog.theme = load("res://ThemeEditor/menus_theme.tres")
		$AnimationPlayer.play("play_feedback")
		dialog.dialog_text = "Parabéns, você acertou! \nEstá pronto para começar?"
		dialog.title = ""
		var scene_tree = Engine.get_main_loop()
		scene_tree.current_scene.add_child(dialog)
		dialog.popup_centered()
		await dialog.confirmed
	get_tree().change_scene_to_file("res://Menus/MiniGamesMenu.tscn")

func _on_voltar_button_pressed():
	DisplayServer.tts_stop()
	get_tree().change_scene_to_file("res://Menus/Menu.tscn")
