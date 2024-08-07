extends Node

var start: bool = false
#tempo: 10 min = 10*60 = 600
var max_time: int = 600
var my_timer: float = 0.0
var tts: bool = false
var sound: bool = true

var points: float
var games: int
var game_over: bool
var level: int
var game_name: String
var num_of_scenes: int = 3
var tdm_started: bool = false

func _process(delta):
	if start:
		my_timer += delta
	if my_timer >= max_time:
		end_minigame()

func start_minigame():
	game_over = false
	points = 0
	games = 0
	level = 1
	start = true
	my_timer = 0.0
	
func end_minigame():
	game_over = true
	start = false
	game_name = ""
	tdm_started = false

