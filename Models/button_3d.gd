extends StaticBody3D
@export_multiline var new_text : String

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Label3D").set_text(new_text)
