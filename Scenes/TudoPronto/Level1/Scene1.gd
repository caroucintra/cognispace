extends Node3D
const scene_num = 1
const num_scenes = 2
var game_over = false

var is_inside_p2a1:bool = false
var is_inside_p2a2:bool = false
var is_inside_p2a3:bool = false
var is_inside_p1hbox:bool = false

var p1_selected:bool = false
var p2_selected:bool = false

var p1_selection:int = 0
var p2_selection:int = 0

var p1_last_focus:int = 1

var answer_pairs = [[Vector2i(1, 2),Vector2i(3,1), Vector2i(2, 3)], [false, false, false]]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/P1HBoxContainer/P1A1Button.grab_focus()

func _change_focus():
	match p1_last_focus:
		1:
			$Control/P1HBoxContainer/P1A1Button.grab_focus()
		2:
			$Control/P1HBoxContainer/P1A2Button.grab_focus()
		3:
			$Control/P1HBoxContainer/P1A3Button.grab_focus()
		_:
			push_warning("Botão não existenta")

#P2
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
		$Control2/P2HBoxContainer/P2A23utton.button_pressed = false
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

# P1
func _on_p1_a1_button_focus_entered():
	p1_last_focus = 1
	
func _on_p1_a2_button_focus_entered():
	p1_last_focus = 2
	
func _on_p1_a3_button_focus_entered():
	p1_last_focus = 3
	
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
	print(toggled_on)
	print(is_inside_p1hbox)
	if (toggled_on and !is_inside_p1hbox):
		p1_selected = true
		p1_selection = 3
		_check_2_buttons_pressed()
	elif (is_inside_p1hbox):
		_mouse_warning()
		$Control/P1HBoxContainer/P1A3Button.button_pressed = false

#Logic
func _check_2_buttons_pressed():
	if (p1_selected and p2_selected):
		_check_answer_pair(Vector2i(p1_selection, p2_selection))
	
func _check_answer_pair(v_answers):
	var dialog = AcceptDialog.new()
	dialog.theme = load("res://ThemeEditor/menus_theme.tres")
	var scene_tree = Engine.get_main_loop()
	for x in answer_pairs[0].size():
		if (v_answers == answer_pairs[0][x-1]):
			if (x == 1 or answer_pairs[1][x-2] == true):
				answer_pairs[1][x-1] = true
				_disable_buttons(v_answers)
				_check_end_of_game()
				if (not game_over):
					dialog.dialog_text = "Parabéns! \nVocês acertaram!"
					dialog.title = ""
					scene_tree.current_scene.add_child(dialog)
					dialog.popup_centered()
				break
			else:
				dialog.dialog_text = "Ainda não... \nEste par está correto, mas há algo antes..."
				dialog.title = ""
				scene_tree.current_scene.add_child(dialog)
				dialog.popup_centered()
	if (v_answers not in answer_pairs[0]):
		dialog.dialog_text = "Parece que não... \nTente outra vez!"
		dialog.title = ""
		scene_tree.current_scene.add_child(dialog)
		dialog.popup_centered()
	_unpress_buttons(v_answers)
	

func _unpress_buttons(buttons):
	match buttons[0]:
		1:
			$Control/P1HBoxContainer/P1A1Button.button_pressed = false
		2:
			$Control/P1HBoxContainer/P1A2Button.button_pressed = false
		3:
			$Control/P1HBoxContainer/P1A3Button.button_pressed = false
		_:
			push_warning("Botão não existente")
	match buttons[1]:
		1:
			$Control2/P2HBoxContainer/P2A1Button.button_pressed = false
		2:
			$Control2/P2HBoxContainer/P2A2Button.button_pressed = false
		3:
			$Control2/P2HBoxContainer/P2A3Button.button_pressed = false
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
		_:
			push_warning("Botão não existente")
	match buttons[1]:
		1:
			$Control2/P2HBoxContainer/P2A1Button.disabled = true
		2:
			$Control2/P2HBoxContainer/P2A2Button.disabled = true
		3:
			$Control2/P2HBoxContainer/P2A3Button.disabled = true
		_:
			push_warning("Botão não existente")
			
func _check_end_of_game():
	if (false not in answer_pairs[1]):
		game_over = true
		var dialog = AcceptDialog.new()
		dialog.theme = load("res://ThemeEditor/menus_theme.tres")
		var scene_tree = Engine.get_main_loop()
		dialog.dialog_text = "Parabéns! \nVocês acertaram todos os pares! \nProntos para o próximo desafio?"
		dialog.ok_button_text = "Sim"
		dialog.title = ""
		dialog.get_ok_button().pressed.connect(self.proxima_fase)
		scene_tree.current_scene.add_child(dialog)
		dialog.popup_centered()


#Warnings e redirects
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
	dialog.dialog_text = "Player 1 deve jogar com as setas!"
	dialog.title = "Oops!"
	var scene_tree = Engine.get_main_loop()
	scene_tree.current_scene.add_child(dialog)
	dialog.popup_centered()
	

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
	get_tree().change_scene_to_file("res://Menus/minigames_menu.tscn")
	
func proxima_fase():
	var rng = RandomNumberGenerator.new()
	var rnd = scene_num
	while (rnd == scene_num):
		rnd = rng.randi_range(1, num_scenes)
	get_tree().change_scene_to_file("res://Scenes/TudoPronto/Level1/Scene" + str(rnd) + ".tscn")
