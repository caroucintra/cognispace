extends AnimationPlayer
var memorization_time: int

func _ready():
	match (Global.level):
		1:
			memorization_time = 10
		2:
			memorization_time = 15
		3:
			memorization_time = 20
	await get_tree().create_timer(memorization_time).timeout
	play("objects_moving")
