extends TPLogic


func _ready():
	$Control/P1HBoxContainer/P1A1Button.grab_focus()
	answer_pairs = [[Vector2i(4, 3),Vector2i(5,2), Vector2i(1, 4), Vector2i(3, 1), Vector2i(2, 5)], [false, false, false, false, false]]
	scene_num = 2
