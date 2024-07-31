extends TPLogic


func _ready():
	$Control/P1HBoxContainer/P1A1Button.grab_focus()
	scene_num = 3
	answer_pairs = [[Vector2i(3, 2),Vector2i(1,3), Vector2i(2, 1)], [false, false, false]]

