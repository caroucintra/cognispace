extends TdMLogic

const lamp_initial_position = Vector3(5.901, 7.264, 0.442)
const cactus_initial_position = Vector3(0.928, 13.052, -8.432)
const candle_initial_position = Vector3(-2.465, 13.012, -10.997)
const books_initial_position = Vector3(12.035, 8.068, 2.233)

func _ready():
	scene_num = 2
	num_of_objs = 4
	
#Interaction with objects
func _on_candle_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Candle":
			select_object("Candle")
		else:
			unselect_object("Candle")

func _on_cactus_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Cactus":
			select_object("Cactus")
		else:
			unselect_object("Cactus")

func _on_books_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Books":
			select_object("Books")
		else:
			unselect_object("Books")
			
func _on_lamp_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Lamp":
			select_object("Lamp")
		else:
			unselect_object("Lamp")

func select_object(obj):
	unselect_object(selected_object)
	match obj:
		"Lamp":	
			selected_object = "Lamp"
			$Lamp/lamp_table2.add_highlight()
		"Cactus":
			selected_object = "Cactus"
			$Cactus/cactus_small_A2.add_highlight()
		"Books":
			selected_object = "Books"
			$Books/book_set2.add_highlight()
		"Candle":
			selected_object = "Candle"
			$Candle/candle_triple2.add_highlight()
			
func unselect_object(obj):
	selected_object = ""
	match obj:
		"Lamp":	
			$Lamp/lamp_table2.remove_highlight()
		"Cactus":
			$Cactus/cactus_small_A2.remove_highlight()
		"Candle":
			$Candle/candle_triple2.remove_highlight()
		"Books":
			$Books/book_set2.remove_highlight()

#Interaction with locations
func _on_shelf_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if turn:
			_not_turn()
			unselect_object(selected_object)
			return
		match (selected_object):
			"Cactus":
				$Cactus.position = cactus_initial_position
				$Cactus/cactus_small_A2.rotation = Vector3(0,0,0)
				$Shadows/cactus_small_A2_shadow.visible = false
				_points_won()
				unselect_object(selected_object)
			"Candle":
				$Candle.position = candle_initial_position
				$Candle/candle_triple2.rotation = Vector3(0,0,0)
				$Shadows/candle_triple2_shadow.visible = false
				_points_won()
				unselect_object(selected_object)
			"":
				pass
			_:
				_try_again()

func _on_cabinet_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if not turn:
			_not_turn()
			unselect_object(selected_object)
			return
		match (selected_object):
			"Lamp":
				$Lamp.position = lamp_initial_position
				$Lamp/lamp_table2.rotation = Vector3(0,0,0)
				$Shadows/lamp_table2_shadow.visible = false
				_points_won()
				unselect_object(selected_object)
			"Books":
				$Books.position = books_initial_position
				$Books/book_set2.rotation = Vector3(0,0,0)
				$Shadows/book_set2_shadow.visible = false
				_points_won()
				unselect_object(selected_object)
			"":
				pass
			_:
				_try_again()
