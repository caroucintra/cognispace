extends Node3D


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
