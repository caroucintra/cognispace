extends TdMLogic

const jar_initial_position = Vector3(3.563, 6.961, 0.343)
const cactus_initial_position = Vector3(-1.552, 15.673, -9.765)
const picture_initial_position = Vector3(-6.003, 15.854, -13.281)
const plate_initial_position = Vector3(1.951, 7.128, 6.303)

func _ready():
	scene_num = 3
	num_of_objs = 4
	
#Interaction with objects
func _on_jar_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Jar":
			select_object("Jar")
		else:
			unselect_object("Jar")

func _on_cactus_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Cactus":
			select_object("Cactus")
		else:
			unselect_object("Cactus")

func _on_plate_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Plate":
			select_object("Plate")
		else:
			unselect_object("Plate")
			
func _on_picture_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected_object != "Picture":
			select_object("Picture")
		else:
			unselect_object("Picture")

func select_object(obj):
	unselect_object(selected_object)
	match obj:
		"Plate":
			selected_object = "Plate"
			$Plate/plate_dirty2.add_highlight()
		"Cactus":
			selected_object = "Cactus"
			$Cactus/cactus_small_A2.add_highlight()
		"Picture":
			selected_object = "Picture"
			$Picture/pictureframe_standing_B2.add_highlight()
		"Jar":
			selected_object = "Jar"
			$Jar/jar_A_medium2.add_highlight()
			
func unselect_object(obj):
	selected_object = ""
	match obj:
		"Plate":	
			$Plate/plate_dirty2.remove_highlight()
		"Cactus":
			$Cactus/cactus_small_A2.remove_highlight()
		"Picture":
			$Picture/pictureframe_standing_B2.remove_highlight()
		"Jar":
			$Jar/jar_A_medium2.remove_highlight()

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
			"Picture":
				$Picture.position = picture_initial_position
				$Picture/pictureframe_standing_B2.rotation = Vector3(0,0,0)
				$Shadows/pictureframe_standing_shadow.visible = false
				_points_won()
				unselect_object(selected_object)
			"":
				pass
			_:
				_try_again()


func _on_counter_input_event(camera, event, position, normal, shape_idx):
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
			"":
				pass
			_:
				_try_again()

