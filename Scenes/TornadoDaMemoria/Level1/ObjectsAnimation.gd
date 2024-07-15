extends AnimationPlayer
const memorization_time = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(memorization_time).timeout
	play("objects_moving")
