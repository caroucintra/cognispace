extends TdMLogic

const jar_initial_position = Vector3(6.557, 6.961, 2.509)
const plate_initial_position = Vector3(1.951, 7.128, 6.303)
const burger_initial_position = Vector3(1.951, 7.128, -0.947)
const pan_initial_position = Vector3(-8.845, 7.137, -1.406)
const knife_initial_position = Vector3(-8.845, 8.07, -8.071)
const cuttingboard_initial_position = Vector3(-9.01, 7.033, -9.571)

func _ready():
	scene_num = 3
	num_of_objs = 6
	
#Interaction with objects
func _on_jar_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Jar":
			select_object("Jar")
		else:
			unselect_object("Jar")


func _on_burger_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Burger":
			select_object("Burger")
		else:
			unselect_object("Burger")


func _on_pan_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Pan":
			select_object("Pan")
		else:
			unselect_object("Pan")


func _on_knife_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Knife":
			select_object("Knife")
		else:
			unselect_object("Knife")


func _on_cutting_board_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "CuttingBoard":
			select_object("CuttingBoard")
		else:
			unselect_object("CuttingBoard")


func _on_plate_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Plate":
			select_object("Plate")
		else:
			unselect_object("Plate")

func select_object(obj):
	unselect_object(selected_object)
	match obj:
		"Plate":
			selected_object = "Plate"
			$Plate/plate_dirty2.add_highlight()
		"Pan":
			selected_object = "Pan"
			$Pan/pan_B2.add_highlight()
		"CuttingBoard":
			selected_object = "CuttingBoard"
			$CuttingBoard/cuttingboard2.add_highlight()
		"Burger":
			selected_object = "Burger"
			$Burger/food_burger2.add_highlight()
		"Knife":
			selected_object = "Knife"
			$Knife/knife2.add_highlight()
		"Jar":
			selected_object = "Jar"
			$Jar/jar_A_medium2.add_highlight()
			
func unselect_object(obj):
	selected_object = ""
	match obj:
		"Plate":	
			$Plate/plate_dirty2.remove_highlight()
		"Pan":
			$Pan/pan_B2.remove_highlight()
		"CuttingBoard":
			$CuttingBoard/cuttingboard2.remove_highlight()
		"Burger":
			$Burger/food_burger2.remove_highlight()
		"Knife":
			$Knife/knife2.remove_highlight()
		"Jar":
			$Jar/jar_A_medium2.remove_highlight()

#Interaction with locations
func _on_counter1_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if turn:
			_not_turn()
			unselect_object(selected_object)
			return
		match (selected_object):
			"Knife":
				$Knife.position = knife_initial_position
				$Knife/knife2.rotation = Vector3(0,0,0)
				$Shadows/knife2.visible = false
				_points_won()
				unselect_object(selected_object)
			"Pan":
				$Pan.position = pan_initial_position
				$Pan/pan_B2.rotation = Vector3(0,0,0)
				$Shadows/pan_B2.visible = false
				_points_won()
				unselect_object(selected_object)
			"CuttingBoard":
				$CuttingBoard.position = cuttingboard_initial_position
				$CuttingBoard/cuttingboard2.rotation = Vector3(0,0,0)
				$Shadows/cuttingboard2.visible = false
				_points_won()
				unselect_object(selected_object)
			"":
				pass
			_:
				_try_again()


func _on_counter2_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if not turn:
			_not_turn()
			unselect_object(selected_object)
			return
		match (selected_object):
			"Jar":
				$Jar.position = jar_initial_position
				$Jar/jar_A_medium2.rotation = Vector3(0,0,0)
				$Shadows/jar_A_medium_shadow.visible = false
				_points_won()
				unselect_object(selected_object)
			"Plate":
				$Plate.position = plate_initial_position
				$Plate/plate_dirty2.rotation = Vector3(0,0,0)
				$Shadows/plate_dirty_shadow.visible = false
				_points_won()
				unselect_object(selected_object)
			"Burger":
				$Burger.position = burger_initial_position
				$Burger/food_burger2.rotation = Vector3(0,0,0)
				$Shadows/food_burger2.visible = false
				_points_won()
				unselect_object(selected_object)
			"":
				pass
			_:
				_try_again()
