extends TPLogic


func _ready():
	$Control/P1HBoxContainer/P1A1Button.grab_focus()
	answer_pairs = [[Vector2i(1, 2),Vector2i(4,5), Vector2i(3, 3), Vector2i(5, 1), Vector2i(2, 4)], [false, false, false, false, false]]
	scene_num = 3
