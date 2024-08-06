extends TdMLogic

const cactus_initial_position = Vector3(-4.6, 7.01, -10.0)
const books_initial_position = Vector3(4.80, 13.5, -4.7)

func _ready():
	scene_num = 1
	num_of_objs = 2

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

func select_object(obj):
	unselect_object(selected_object)
	match obj:
		"Cactus":
			selected_object = "Cactus"
			$Cactus/cactus_small_A2.add_highlight()
		"Books":
			selected_object = "Books"
			$Books/book_set2.add_highlight()
			
func unselect_object(obj):
	selected_object = ""
	match obj:
		"Cactus":
			$Cactus/cactus_small_A2.remove_highlight()
		"Books":
			$Books/book_set2.remove_highlight()

#Interaction with locations
func _on_cabinet_input_event(camera, event, position, normal, shape_idx):
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
			"":
				pass
			_:
				_try_again()

func _on_shelf_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if not turn:
			_not_turn()
			unselect_object(selected_object)
			return
		match (selected_object):
			"Books":
				$Books.position = books_initial_position
				$Books/book_set2.rotation = Vector3(0,0,0)
				_points_won()
				$Shadows/book_set2_shadow.visible = false
				unselect_object(selected_object)
			"":
				pass
			_:
				_try_again()
