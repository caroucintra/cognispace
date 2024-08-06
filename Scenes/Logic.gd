extends Node3D
class_name Logic

var help = true
var scene_num

func _process(_delta):
	$ProgressBar.set_value(Global.points)
	if (Global.game_over):
		get_tree().change_scene_to_file("res://Scenes/FeedbackFinal.tscn")

func next_scene():
	if (Global.game_name == "ContandoTrocos" or Global.game_name == "ParPerfeito"):
		if (Global.games == 5):
			if (Global.points < 3.0):
				Global.points = 0
				Global.games = 0
				var rng = RandomNumberGenerator.new()
				var rnd = scene_num
				while (rnd == scene_num):
					rnd = rng.randi_range(1, Global.num_of_scenes)
				get_tree().change_scene_to_file("res://Scenes/" + Global.game_name + "/Level"+ str(Global.level) + "/Scene" + str(rnd) + ".tscn")
			else:
				if (Global.level != 3):
					Global.num_of_scenes = 3
					get_tree().change_scene_to_file("res://Scenes/FeedbackMid.tscn")
				else:
					Global.game_over = true
		else:
			var rng = RandomNumberGenerator.new()
			var rnd = scene_num
			while (rnd == scene_num):
				rnd = rng.randi_range(1, Global.num_of_scenes)
			get_tree().change_scene_to_file("res://Scenes/" + Global.game_name + "/Level"+ str(Global.level) + "/Scene" + str(rnd) + ".tscn")
	else:
		if (Global.games == 3):
			if (Global.points < 2.0):
				Global.points = 0
				Global.games = 0
				var rng = RandomNumberGenerator.new()
				var rnd = scene_num
				while (rnd == scene_num):
					rnd = rng.randi_range(1, Global.num_of_scenes)
				get_tree().change_scene_to_file("res://Scenes/" + Global.game_name + "/Level"+ str(Global.level) + "/Scene" + str(rnd) + ".tscn")
			else:
				if (Global.level != 3):
					get_tree().change_scene_to_file("res://Scenes/FeedbackMid.tscn")
				else:
					Global.game_over = true
		else:
			var rng = RandomNumberGenerator.new()
			var rnd = scene_num
			while (rnd == scene_num):
				rnd = rng.randi_range(1, Global.num_of_scenes)
			get_tree().change_scene_to_file("res://Scenes/" + Global.game_name + "/Level"+ str(Global.level) + "/Scene" + str(rnd) + ".tscn")

func _on_voltar_button_pressed():
	var dialog = AcceptDialog.new()
	dialog.theme = load("res://ThemeEditor/menus_theme.tres")
	dialog.add_cancel_button("Não")
	dialog.ok_button_text = "Sim"
	dialog.get_ok_button().pressed.connect(self.voltar)
	dialog.dialog_text = "Agora estava a correr bem! \nTem certeza que quer sair?"
	dialog.title = ""
	var scene_tree = Engine.get_main_loop()
	scene_tree.current_scene.add_child(dialog)
	dialog.popup_centered()
	
func voltar():
	Global.game_over = true

func _on_ajuda_button_pressed():
	if Global.game_name == "TornadoDaMemoria" and Global.tdm_started == false:
		return
	var dialog = AcceptDialog.new()
	dialog.theme = load("res://ThemeEditor/menus_theme.tres")
	if (help):
		$BoxContainer2/Doctor.show()
		dialog.add_cancel_button("Não")
		dialog.ok_button_text = "Sim"
		dialog.get_ok_button().pressed.connect(self.ajudar)
		dialog.dialog_text = "Precisa de ajuda? \nEu posso lhe dar uma pista!"
		dialog.title = ""
	else:
		dialog.dialog_text = "Já usou a sua pista... \nVocê consegue!"
		dialog.title = ""
	var scene_tree = Engine.get_main_loop()
	scene_tree.current_scene.add_child(dialog)
	dialog.popup_centered()
	await dialog.canceled
	$BoxContainer2/Doctor.hide()
