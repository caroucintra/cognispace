extends TdMLogic

const keys_initial_position = Vector3(-7.0, 7.4, -7.4)
const cactus_initial_position = Vector3(-4.6, 7.01, -10.0)
const picture_initial_position = Vector3(12.0, 13.6,0.0)
const books_initial_position = Vector3(4.80, 13.5, -4.7)

func _ready():
	scene_num = 2
	num_of_objs = 4
	
#Interaction with objects
func _on_keys_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Keys":
			select_object("Keys")
		else:
			unselect_object("Keys")

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
			
func _on_picture_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Picture":
			select_object("Picture")
		else:
			unselect_object("Picture")

func select_object(obj):
	unselect_object(selected_object)
	match obj:
		"Keys":	
			selected_object = "Keys"
			$Keys/keyring2.add_highlight()
		"Cactus":
			selected_object = "Cactus"
			$Cactus/cactus_small_A2.add_highlight()
		"Picture":
			selected_object = "Picture"
			$Picture/pictureframe_small_A2.add_highlight()
		"Books":
			selected_object = "Books"
			$Books/book_set2.add_highlight()
			
func unselect_object(obj):
	selected_object = ""
	match obj:
		"Keys":	
			$Keys/keyring2.remove_highlight()
		"Cactus":
			$Cactus/cactus_small_A2.remove_highlight()
		"Picture":
			$Picture/pictureframe_small_A2.remove_highlight()
		"Books":
			$Books/book_set2.remove_highlight()

#Interaction with locations
func _on_cabinet_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		match (selected_object):
			"Keys":
				$Keys.position = keys_initial_position
				$Keys/keyring2.rotation = Vector3(0,0,0)
				$Shadows/keyring2_shadow.visible = false
				objs_won += ["Keys"]
				_check_end_of_game()
				if (not game_over):
					_positive_feedback()
				unselect_object("Keys")
			"Cactus":
				$Cactus.position = cactus_initial_position
				$Cactus/cactus_small_A2.rotation = Vector3(0,0,0)
				$Shadows/cactus_small_A2_shadow.visible = false
				objs_won += ["Cactus"]
				_check_end_of_game()
				if (not game_over):
					_positive_feedback()
				unselect_object("Cactus")
			"":
				pass
			_:
				_try_again()

func _on_shelf_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		match (selected_object):
			"Books":
				$Books.position = books_initial_position
				$Books/book_set2.rotation = Vector3(0,0,0)
				objs_won += ["Books"]
				$Shadows/book_set2_shadow.visible = false
				_check_end_of_game()
				if (not game_over):
					_positive_feedback()
				unselect_object("Books")
			"Picture":
				$Picture.position = picture_initial_position
				$Picture/pictureframe_small_A2.rotation = Vector3(0,0,0)
				objs_won += ["Picture"]
				$Shadows/pictureframe_small_shadow.visible = false
				_check_end_of_game()
				if (not game_over):
					_positive_feedback()
				unselect_object("Picture")
			"":
				pass
			_:
				_try_again()

