extends TPLogic


func _ready():
	$Control/P1HBoxContainer/P1A1Button.grab_focus()
	scene_num = 2
	answer_pairs = [[Vector2i(2, 4),Vector2i(4,1), Vector2i(3, 2), Vector2i(1, 3)], [false, false, false, false]]

