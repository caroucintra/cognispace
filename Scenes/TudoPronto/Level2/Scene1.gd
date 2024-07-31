extends TPLogic


func _ready():
	$Control/P1HBoxContainer/P1A1Button.grab_focus()
	scene_num = 1
	answer_pairs = [[Vector2i(1, 2), Vector2i(4,4), Vector2i(3, 1), Vector2i(2, 3)], [false, false, false, false]]

