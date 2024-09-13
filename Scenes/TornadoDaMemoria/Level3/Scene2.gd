extends TdMLogic

const cactus_initial_position = Vector3(0.919, 14.369, -8.501)
const cactus2_initial_position = Vector3(3.558, 6.952, 0.994)
const books_initial_position = Vector3(-4.992, 15.55, -13.336)
const picture_initial_position = Vector3(4.993, 8.384, -3.517)
const candle_initial_position = Vector3(-2.465, 14.381, -10.997)
const lamp_initial_position = Vector3(8.659,7.275, 2.141)

func _ready():
	scene_num = 2
	num_of_objs = 6
	
#Interaction with objects
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


func _on_cactus2_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Cactus2":
			select_object("Cactus2")
		else:
			unselect_object("Cactus2")


func _on_picture_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Picture":
			select_object("Picture")
		else:
			unselect_object("Picture")


func _on_candle_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Candle":
			select_object("Candle")
		else:
			unselect_object("Candle")


func select_object(obj):
	unselect_object(selected_object)
	match obj:
		"Cactus":
			selected_object = "Cactus"
			$Cactus/cactus_small_A2.add_highlight()
		"Books":
			selected_object = "Books"
			$Books/book_set2.add_highlight()
		"Lamp":
			selected_object = "Lamp"
			$Lamp/lamp_table2.add_highlight()
		"Picture":
			selected_object = "Picture"
			$Picture/pictureframe_small_C2.add_highlight()
		"Cactus2":
			selected_object = "Cactus2"
			$Cactus2/cactus_medium_A2.add_highlight()
		"Candle":
			selected_object = "Candle"
			$Candle/candle_triple2.add_highlight()

func unselect_object(obj):
	selected_object = ""
	match obj:
		"Cactus":
			$Cactus/cactus_small_A2.remove_highlight()
		"Books":
			$Books/book_set2.remove_highlight()
		"Lamp":
			$Lamp/lamp_table2.remove_highlight()
		"Picture":
			$Picture/pictureframe_small_C2.remove_highlight()
		"Cactus2":
			$Cactus2/cactus_medium_A2.remove_highlight()
		"Candle":
			$Candle/candle_triple2.remove_highlight()

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
			"Books":
				$Books.position = books_initial_position
				$Books/book_set2.rotation = Vector3(0,0,0)
				$Shadows/book_set2_shadow.visible = false
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
				_points_won()
				$Shadows/lamp_table2_shadow.visible = false
				unselect_object(selected_object)
			"Cactus2":
				$Cactus2.position = cactus2_initial_position
				$Cactus2/cactus_medium_A2.rotation = Vector3(0,0,0)
				_points_won()
				$Shadows/cactus_medium_A2.visible = false
				unselect_object(selected_object)
			"Picture":
				$Picture.position = picture_initial_position
				$Picture/pictureframe_small_C2.rotation = Vector3(0,0,0)
				_points_won()
				$Shadows/pictureframe_small_C2.visible = false
				unselect_object(selected_object)
			"":
				pass
			_:
				_try_again()

