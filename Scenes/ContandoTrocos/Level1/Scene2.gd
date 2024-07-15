extends Node3D
var selected
const answer = 3
const scene_num = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	selected = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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
	await call_dialog(1)
	var rng = RandomNumberGenerator.new()
	var rnd = scene_num
	while (rnd == scene_num):
		rnd = rng.randi_range(1,2)
	get_tree().change_scene_to_file("res://Scenes/ContandoTrocos/Level1/Scene" + str(rnd) + ".tscn")

func _try_again():
	call_dialog(0)

func call_dialog(a):
	var dialog = AcceptDialog.new()
	dialog.theme = load("res://ThemeEditor/menus_theme.tres")
	if (a):
		dialog.dialog_text = "Parabéns, você acertou! \nEstá pronto para a próxima?"
	else:
		dialog.dialog_text = "Não acertou esta pergunta. \nTente novamente!"
	dialog.title = ""
	var scene_tree = Engine.get_main_loop()
	scene_tree.current_scene.add_child(dialog)
	dialog.popup_centered()
	await dialog.confirmed

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
	
