extends TdMLogic

const jar_initial_position = Vector3(-12.361, 6.661, -13.627)
const pan1_initial_position = Vector3(-14.405, 6.99, -7.697)
const lid_initial_position = Vector3(-1.84, 8.965, 2.473)
const pot_initial_position = Vector3(7.685, 8.077, 1.348)
const pan2_initial_position = Vector3(-1.84, 8.077, 2.473)
const knife_initial_position = Vector3(-6.609, 8.07, -4.085)

func _ready():
	scene_num = 1
	num_of_objs = 6
	
#Interaction with objects
func _on_jar_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Jar":
			select_object("Jar")
		else:
			unselect_object("Jar")

func _on_pan1_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Pan1":
			select_object("Pan1")
		else:
			unselect_object("Pan1")

func _on_lid_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Lid":
			select_object("Lid")
		else:
			unselect_object("Lid")
			
func _on_pot_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Pot":
			select_object("Pot")
		else:
			unselect_object("Pot")
			
func _on_pan2_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Pan2":
			select_object("Pan2")
		else:
			unselect_object("Pan2")
			
func _on_knife_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Knife":
			select_object("Knife")
		else:
			unselect_object("Knife")

func select_object(obj):
	unselect_object(selected_object)
	match obj:
		"Pot":
			selected_object = "Pot"
			$Pot/pot_stew/pot_large2.add_highlight()
		"Pan1":
			selected_object = "Pan1"
			$Pan1/pan_0062.add_highlight()		
		"Pan2":
			selected_object = "Pan2"
			$Pan2/pan_B2.add_highlight()
		"Knife":
			selected_object = "Knife"
			$Knife/knife2.add_highlight()
		"Jar":
			selected_object = "Jar"
			$Jar/jar_A_medium2.add_highlight()
		"Lid":
			selected_object = "Lid"
			$Lid/lid_B2.add_highlight()

func unselect_object(obj):
	selected_object = ""
	match obj:
		"Pot":	
			$Pot/pot_stew/pot_large2.remove_highlight()
		"Pan1":
			$Pan1/pan_0062.remove_highlight()
		"Pan2":
			$Pan2/pan_B2.remove_highlight()
		"Jar":
			$Jar/jar_A_medium2.remove_highlight()
		"Knife":
			$Knife/knife2.remove_highlight()
		"Lid":
			$Lid/lid_B2.remove_highlight()

#Interaction with locations
func _on_counter1_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		match (selected_object):
			"Jar":
				$Jar.position = jar_initial_position
				$Jar/jar_A_medium2.rotation = Vector3(0,0,0)
				$Shadows/jar_A_medium_shadow.visible = false
				objs_won += ["Jar"]
				_check_end_of_game()
				if (not game_over):
					_positive_feedback()
				unselect_object("Jar")
			"Knife":
				$Knife.position = knife_initial_position
				$Knife/knife2.rotation = Vector3(0,0,0)
				$Shadows/knife2_shadow.visible = false
				objs_won += ["Knife"]
				_check_end_of_game()
				if (not game_over):
					_positive_feedback()
				unselect_object("Knife")
			"Pan1":
				$Pan1.position = pan1_initial_position
				$Pan1/pan_0062.rotation = Vector3(0,0,0)
				$Shadows/pan_0062_shadow.visible = false
				objs_won += ["Pan1"]
				_check_end_of_game()
				if (not game_over):
					_positive_feedback()
				unselect_object("Pan1")
			"":
				pass
			_:
				_try_again()

func _on_counter2_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		match (selected_object):
			"Pan2":
				$Pan2.position = pan2_initial_position
				$Pan2/pan_B2.rotation = Vector3(0,0,0)
				$Shadows/pan_B2_shadow.visible = false
				objs_won += ["Pan2"]
				_check_end_of_game()
				if (not game_over):
					_positive_feedback()
				unselect_object("Pan2")
			"Pot":
				$Pot.position = pot_initial_position
				$Pot/pot_stew/pot_large2.rotation = Vector3(0,0,0)
				objs_won += ["Pot"]
				$Shadows/pot_large2_shadow.visible = false
				_check_end_of_game()
				if (not game_over):
					_positive_feedback()
				unselect_object("Pot")
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

