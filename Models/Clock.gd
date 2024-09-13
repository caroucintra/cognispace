extends Node2D
var time = null
var radian_minutes  = null
var radian_hours = null

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time = Time.get_time_dict_from_system()
	radian_minutes = time["minute"] * PI/30
	radian_hours = (time["hour"] * PI/6) + radian_minutes/12
	$face/pivot_minutes.rotation = radian_minutes
	$face/pivot_hours.rotation = radian_hours
