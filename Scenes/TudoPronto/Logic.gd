extends Logic
class_name TPLogic
var game_over = false

var is_inside_p2a1:bool = false
var is_inside_p2a2:bool = false
var is_inside_p2a3:bool = false
var is_inside_p2a4:bool = false
var is_inside_p2a5:bool = false
var is_inside_p1hbox:bool = false

var p1_selected:bool = false
var p2_selected:bool = false

var p1_selection:int = 0
var p2_selection:int = 0

var p1_last_focus:int = 1

var answer_pairs
	
func _change_focus():
	match p1_last_focus:
		1:
			$Control/P1HBoxContainer/P1A1Button.grab_focus()
		2:
			$Control/P1HBoxContainer/P1A2Button.grab_focus()
		3:
			$Control/P1HBoxContainer/P1A3Button.grab_focus()
		4:
			$Control/P1HBoxContainer/P1A4Button.grab_focus()
		5:
			$Control/P1HBoxContainer/P1A5Button.grab_focus()
		_:
			push_warning("Botão não existente")

#interaction P2
func _on_p2_a1_button_mouse_entered():
	is_inside_p2a1 = true

func _on_p2_a1_button_mouse_exited():
	is_inside_p2a1 = false
	_change_focus()
	
func _on_p2_a2_button_mouse_entered():
	is_inside_p2a2 = true

func _on_p2_a2_button_mouse_exited():
	is_inside_p2a2 = false
	_change_focus()

func _on_p2_a3_button_mouse_entered():
	is_inside_p2a3 = true

func _on_p2_a3_button_mouse_exited():
	is_inside_p2a3 = false
	_change_focus()

func _on_p2_a4_button_mouse_entered():
	is_inside_p2a4 = true

func _on_p2_a4_button_mouse_exited():
	is_inside_p2a4 = false
	_change_focus()

func _on_p2_a5_button_mouse_entered():
	is_inside_p2a5 = true

func _on_p2_a5_button_mouse_exited():
	is_inside_p2a5 = false
	_change_focus()

func _on_p2_a1_button_toggled(toggled_on):
	if (toggled_on and !is_inside_p2a1):
		p2_selected = false
		p2_selection = 0
		$Control2/P2HBoxContainer/P2A1Button.button_pressed = false
		var dialog = AcceptDialog.new()
		dialog.dialog_text = "Player 2 deve jogar com o rato!"
		dialog.title = "Oops!"
		var scene_tree = Engine.get_main_loop()
		scene_tree.current_scene.add_child(dialog)
		dialog.popup_centered()
	elif (toggled_on):
		p2_selected = true
		p2_selection = 1
		_check_2_buttons_pressed()
	_change_focus()

func _on_p2_a2_button_toggled(toggled_on):
	if (toggled_on and !is_inside_p2a2):
		p2_selected = false
		p2_selection = 0
		$Control2/P2HBoxContainer/P2A2Button.button_pressed = false
		var dialog = AcceptDialog.new()
		dialog.dialog_text = "Player 2 deve jogar com o rato!"
		dialog.title = "Oops!"
		var scene_tree = Engine.get_main_loop()
		scene_tree.current_scene.add_child(dialog)
		dialog.popup_centered()
	elif (toggled_on):
		p2_selected = true
		p2_selection = 2
		_check_2_buttons_pressed()
	_change_focus()

func _on_p2_a3_button_toggled(toggled_on):
	if (toggled_on and !is_inside_p2a3):
		p2_selected = false
		p2_selection = 0
		$Control2/P2HBoxContainer/P2A3Button.button_pressed = false
		var dialog = AcceptDialog.new()
		dialog.dialog_text = "Player 2 deve jogar com o rato!"
		dialog.title = "Oops!"
		var scene_tree = Engine.get_main_loop()
		scene_tree.current_scene.add_child(dialog)
		dialog.popup_centered()
	elif (toggled_on):
		p2_selected = true
		p2_selection = 3
		_check_2_buttons_pressed()
	_change_focus()

func _on_p2_a4_button_toggled(toggled_on):
	if (toggled_on and !is_inside_p2a4):
		p2_selected = false
		p2_selection = 0
		$Control2/P2HBoxContainer/P2A4Button.button_pressed = false
		var dialog = AcceptDialog.new()
		dialog.dialog_text = "Player 2 deve jogar com o rato!"
		dialog.title = "Oops!"
		var scene_tree = Engine.get_main_loop()
		scene_tree.current_scene.add_child(dialog)
		dialog.popup_centered()
	elif (toggled_on):
		p2_selected = true
		p2_selection = 4
		_check_2_buttons_pressed()
	_change_focus()

func _on_p2_a5_button_toggled(toggled_on):
	if (toggled_on and !is_inside_p2a5):
		p2_selected = false
		p2_selection = 0
		$Control2/P2HBoxContainer/P2A5Button.button_pressed = false
		var dialog = AcceptDialog.new()
		dialog.dialog_text = "Player 2 deve jogar com o rato!"
		dialog.title = "Oops!"
		var scene_tree = Engine.get_main_loop()
		scene_tree.current_scene.add_child(dialog)
		dialog.popup_centered()
	elif (toggled_on):
		p2_selected = true
		p2_selection = 5
		_check_2_buttons_pressed()
	_change_focus()
	
# interaction P1
func _on_p1_a1_button_focus_entered():
	p1_last_focus = 1
	
func _on_p1_a2_button_focus_entered():
	p1_last_focus = 2
	
func _on_p1_a3_button_focus_entered():
	p1_last_focus = 3

func _on_p1_a4_button_focus_entered():
	p1_last_focus = 4
	
func _on_p1_a5_button_focus_entered():
	p1_last_focus = 5
	
func _on_p1_a1_button_toggled(toggled_on):
	if (toggled_on and !is_inside_p1hbox):
		p1_selected = true
		p1_selection = 1
		_check_2_buttons_pressed()
	elif (is_inside_p1hbox):
		_mouse_warning()
		$Control/P1HBoxContainer/P1A1Button.button_pressed = false
	
func _on_p1_a2_button_toggled(toggled_on):
	if (toggled_on and !is_inside_p1hbox):
		p1_selected = true
		p1_selection = 2
		_check_2_buttons_pressed()
	elif (is_inside_p1hbox):
		_mouse_warning()
		$Control/P1HBoxContainer/P1A2Button.button_pressed = false
	
func _on_p1_a3_button_toggled(toggled_on):
	if (toggled_on and !is_inside_p1hbox):
		p1_selected = true
		p1_selection = 3
		_check_2_buttons_pressed()
	elif (is_inside_p1hbox):
		_mouse_warning()
		$Control/P1HBoxContainer/P1A3Button.button_pressed = false
		
func _on_p1_a4_button_toggled(toggled_on):
	if (toggled_on and !is_inside_p1hbox):
		p1_selected = true
		p1_selection = 4
		_check_2_buttons_pressed()
	elif (is_inside_p1hbox):
		_mouse_warning()
		$Control/P1HBoxContainer/P1A4Button.button_pressed = false

func _on_p1_a5_button_toggled(toggled_on):
	if (toggled_on and !is_inside_p1hbox):
		p1_selected = true
		p1_selection = 5
		_check_2_buttons_pressed()
	elif (is_inside_p1hbox):
		_mouse_warning()
		$Control/P1HBoxContainer/P1A5Button.button_pressed = false

#Logic
func _check_2_buttons_pressed():
	if (p1_selected and p2_selected):
		_check_answer_pair(Vector2i(p1_selection, p2_selection))

func _positive_feedback():
	call_dialog(1)

func _try_again():
	call_dialog(0)
	
func _almost_there():
	call_dialog(2)

func call_dialog(a):
	var dialog = AcceptDialog.new()
	dialog.theme = load("res://ThemeEditor/menus_theme.tres")
	match (a):
		0:
			dialog.dialog_text = "Tente novamente!"
		1:
			dialog.dialog_text = "Parabéns, vocês acertaram! \nContinuem assim!"
		2:
			dialog.dialog_text = "Ainda não... \nEste par está correto, mas há algo antes..."
		_:
			pass
	dialog.title = ""
	var scene_tree = Engine.get_main_loop()
	scene_tree.current_scene.add_child(dialog)
	dialog.popup_centered()
	await dialog.confirmed

func _check_answer_pair(v_answers):
	for x in answer_pairs[0].size():
		if (v_answers == answer_pairs[0][x-1]):
			if (x == 1 or answer_pairs[1][x-2] == true):
				answer_pairs[1][x-1] = true
				_disable_buttons(v_answers)
				_check_end_of_game()
				if (not game_over):
					_positive_feedback()
				break
			else:
				_almost_there()
	if (v_answers not in answer_pairs[0]):
		_try_again()
	_unpress_buttons(v_answers)
	

func _unpress_buttons(buttons):
	match buttons[0]:
		1:
			$Control/P1HBoxContainer/P1A1Button.button_pressed = false
		2:
			$Control/P1HBoxContainer/P1A2Button.button_pressed = false
		3:
			$Control/P1HBoxContainer/P1A3Button.button_pressed = false
		4:
			$Control/P1HBoxContainer/P1A4Button.button_pressed = false
		5:
			$Control/P1HBoxContainer/P1A5Button.button_pressed = false
		_:
			push_warning("Botão não existente")
	match buttons[1]:
		1:
			$Control2/P2HBoxContainer/P2A1Button.button_pressed = false
		2:
			$Control2/P2HBoxContainer/P2A2Button.button_pressed = false
		3:
			$Control2/P2HBoxContainer/P2A3Button.button_pressed = false
		4:
			$Control2/P2HBoxContainer/P2A4Button.button_pressed = false
		5:
			$Control2/P2HBoxContainer/P2A5Button.button_pressed = false
		_:
			push_warning("Botão não existente")
	p1_selected = false
	p2_selected = false
	p1_selection = 0
	p1_selection = 0
	
func _disable_buttons(buttons):
	match buttons[0]:
		1:
			$Control/P1HBoxContainer/P1A1Button.disabled = true
		2:
			$Control/P1HBoxContainer/P1A2Button.disabled = true
		3:
			$Control/P1HBoxContainer/P1A3Button.disabled = true
		4:
			$Control/P1HBoxContainer/P1A4Button.disabled = true
		5:
			$Control/P1HBoxContainer/P1A5Button.disabled = true
		_:
			push_warning("Botão não existente")
	match buttons[1]:
		1:
			$Control2/P2HBoxContainer/P2A1Button.disabled = true
		2:
			$Control2/P2HBoxContainer/P2A2Button.disabled = true
		3:
			$Control2/P2HBoxContainer/P2A3Button.disabled = true
		4:
			$Control2/P2HBoxContainer/P2A4Button.disabled = true
		5:
			$Control2/P2HBoxContainer/P2A5Button.disabled = true
		_:
			push_warning("Botão não existente")
			
func _check_end_of_game():
	if (false not in answer_pairs[1]):
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
		dialog.dialog_text = "Parabéns! \nVocês acertaram todos os pares! \nProntos para o próximo desafio?"
		dialog.ok_button_text = "Sim"
		dialog.title = ""
		dialog.get_ok_button().pressed.connect(self.next_scene)
		scene_tree.current_scene.add_child(dialog)
		dialog.popup_centered()

#Warnings
func _on_p1_hbox_container_mouse_entered():
	is_inside_p1hbox = true
	_trigger_mouse_warning()

func _on_p1_hbox_container_mouse_exited():
	is_inside_p1hbox = false
	
func _trigger_mouse_warning():
	await get_tree().create_timer(5).timeout
	if(is_inside_p1hbox):
		_mouse_warning()
	
func _mouse_warning():
	var dialog = AcceptDialog.new()
	dialog.theme = load("res://ThemeEditor/menus_theme.tres")
	dialog.dialog_text = "Player 1 deve jogar com as setas!"
	dialog.title = "Oops!"
	var scene_tree = Engine.get_main_loop()
	scene_tree.current_scene.add_child(dialog)
	dialog.popup_centered()

func ajudar():
	$BoxContainer2/Doctor.hide()
	if (help):
		help = false
		var x = 0
		while (answer_pairs[1][x] == true):
			x+=1
		_check_answer_pair(answer_pairs[0][x])
