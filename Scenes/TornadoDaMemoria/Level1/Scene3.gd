extends TdMLogic

const lid_initial_position = Vector3(-1.84, 8.965, 2.473)
const knife_initial_position = Vector3(-6.609, 8.07, -4.085)

func _ready():
	scene_num = 3
	num_of_objs = 2
	
#Interaction with objects
func _on_lid_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Lid":
			select_object("Lid")
		else:
			unselect_object("Lid")

func _on_knife_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Knife":
			select_object("Knife")
		else:
			unselect_object("Knife")

func select_object(obj):
	unselect_object(selected_object)
	match obj:
		"Knife":
			selected_object = "Knife"
			$Knife/knife2.add_highlight()
		"Lid":
			selected_object = "Lid"
			$Lid/lid_B2.add_highlight()

func unselect_object(obj):
	selected_object = ""
	match obj:
		"Knife":
			$Knife/knife2.remove_highlight()
		"Lid":
			$Lid/lid_B2.remove_highlight()

#Interaction with locations
func _on_counter1_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		match (selected_object):
			"Knife":
				$Knife.position = knife_initial_position
				$Knife/knife2.rotation = Vector3(0,0,0)
				$Shadows/knife2_shadow.visible = false
				objs_won += ["Knife"]
				_check_end_of_game()
				if (not game_over):
					_positive_feedback()
				unselect_object("Knife")
			"":
				pass
			_:
				_try_again()

func _on_counter2_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		match (selected_object):
			"Lid":
				$Lid.position = lid_initial_position
				$Lid/lid_B2.rotation = Vector3(0,0,0)
				objs_won += ["Lid"]
				$Shadows/lid_B2_shadow.visible = false
				_check_end_of_game()
				if (not game_over):
					_positive_feedback()
				unselect_object("Lid")
			"":
				pass
			_:
				_try_again()

