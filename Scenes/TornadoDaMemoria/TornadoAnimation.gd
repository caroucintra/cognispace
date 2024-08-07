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
	if (Global.sound):
		play("Tornado/tornado_passing")
	else:
		play("Tornado/tornado_passing_no_sound")
	Global.tdm_started = true
