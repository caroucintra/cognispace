extends Logic
class_name TdMLogic

var selected_object = ""
var selected_place = ""
var num_of_objs
var objs_won = []
var game_over = false
var turn: bool = false
var error: bool = false

func _positive_feedback():
	call_dialog(1)

func _try_again():
	error = true
	call_dialog(0)

func _not_turn():
	call_dialog(2)

func call_dialog(a):
	var dialog = AcceptDialog.new()
	dialog.theme = load("res://ThemeEditor/menus_theme.tres")
	match a:
		2:
			dialog.dialog_text = "Calma... \nAgora é a vez do outro jogador"
		1:
			dialog.dialog_text = "Parabéns, vocês acertaram! \nMas ainda falta organizar alguma coisa..."
		0:
			dialog.dialog_text = "Tente novamente!"
	dialog.title = ""
	var scene_tree = Engine.get_main_loop()
	scene_tree.current_scene.add_child(dialog)
	dialog.popup_centered()
	await dialog.confirmed

func _change_turn():
	turn = !turn

func _points_won():
	objs_won += [selected_object]
	_check_end_of_game()
	if (not game_over):
		_positive_feedback()
	_change_turn()

func _check_end_of_game():
	if (objs_won.size() == num_of_objs):
		game_over = true
		Global.tdm_started = false
		if (help and not error): 
			Global.points+= 1
		else:
			Global.points+= 0.5
		Global.games += 1
		var dialog = AcceptDialog.new()
		dialog.theme = load("res://ThemeEditor/menus_theme.tres")
		var scene_tree = Engine.get_main_loop()
		if (Global.sound):
			$ConfettiPlayer.play("Confetti/confetti_feedback")
		else:
			$ConfettiPlayer.play("Confetti/confetti_feedback_no_sound")
		dialog.dialog_text = "Parabéns! \nVocês acertaram todos os sítios! \nProntos para o próximo desafio?"
		dialog.ok_button_text = "Sim"
		dialog.title = ""
		dialog.get_ok_button().pressed.connect(self.next_scene)
		scene_tree.current_scene.add_child(dialog)
		dialog.popup_centered()

func ajudar():
	if (Global.tdm_started):
		$BoxContainer2/Doctor.hide()
		if (help):
			help = false
			$Shadows.show()
