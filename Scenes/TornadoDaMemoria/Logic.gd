extends Logic
class_name TdMLogic

var selected_object = ""
var selected_place = ""
var num_of_objs
var objs_won = []
var game_over = false

func _positive_feedback():
	await call_dialog(1)

func _try_again():
	call_dialog(0)

func call_dialog(a):
	var dialog = AcceptDialog.new()
	dialog.theme = load("res://ThemeEditor/menus_theme.tres")
	if (a):
		dialog.dialog_text = "Parabéns, vocês acertaram! \nMas ainda falta organizar alguma coisa..."
	else:
		dialog.dialog_text = "Tente novamente!"
	dialog.title = ""
	var scene_tree = Engine.get_main_loop()
	scene_tree.current_scene.add_child(dialog)
	dialog.popup_centered()
	await dialog.confirmed

func _check_end_of_game():
	if (objs_won.size() == num_of_objs):
		game_over = true
		if (help): 
			Global.points+= 1
		else:
			Global.points+= 0.5
		Global.games += 1
		var dialog = AcceptDialog.new()
		dialog.theme = load("res://ThemeEditor/menus_theme.tres")
		var scene_tree = Engine.get_main_loop()
		$AnimationPlayer.play("play_feedback")
		dialog.dialog_text = "Parabéns! \nVocês acertaram todos os sítios! \nProntos para o próximo desafio?"
		dialog.ok_button_text = "Sim"
		dialog.title = ""
		dialog.get_ok_button().pressed.connect(self.next_scene)
		scene_tree.current_scene.add_child(dialog)
		dialog.popup_centered()

func ajudar():
	$BoxContainer2/Doctor.hide()
	if (help):
		help = false
		$Shadows.show()
