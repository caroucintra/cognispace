extends Logic
class_name CTLogic

var selected = 0
var answer

func _on_a1_button_pressed():
	selected = 1
	_check_answer()

func _on_a2_button_pressed():
	selected = 2
	_check_answer()

func _on_a3_button_pressed():
	selected = 3
	_check_answer()

func _check_answer():
	if (selected == answer):
		_positive_feedback()
	else:
		_try_again()
		
func _positive_feedback():
	if (help): 
		Global.points+=1
	else:
		Global.points+=0.5
	Global.games += 1
	await call_dialog(1)
	next_scene()

func _try_again():
	call_dialog(0)

func call_dialog(a):
	var dialog = AcceptDialog.new()
	dialog.theme = load("res://ThemeEditor/menus_theme.tres")
	if (a):
		$AnimationPlayer.play("play_feedback")
		dialog.dialog_text = "Parabéns, você acertou! \nEstá pronto para a próxima?"
	else:
		dialog.dialog_text = "Tente novamente!"
	dialog.title = ""
	var scene_tree = Engine.get_main_loop()
	scene_tree.current_scene.add_child(dialog)
	dialog.popup_centered()
	await dialog.confirmed

func ajudar():
	$BoxContainer2/Doctor.hide()
	if (help):
		help = false
		var rng = RandomNumberGenerator.new()
		var rnd = answer
		while (rnd == answer):
			rnd = rng.randi_range(1, 3)
		match rnd:
			1:
				$VBoxContainer/BoxContainer/A1Button.disabled = true
			2:
				$VBoxContainer/BoxContainer/A2Button.disabled = true
			3:
				$VBoxContainer/BoxContainer/A3Button.disabled = true
			_:
				push_warning("Botão não existente")
