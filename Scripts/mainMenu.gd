extends Node

@onready var scoreBoard : Control = $ScoreBoardUI
@onready var bird : CharacterBody2D = $bird

var _windowSize : Vector2i

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals._load_data()
	scoreBoard.call("process_point", Globals.High_Score)

	_windowSize = self.get_window().size
	bird.call("set_title_min_height", _windowSize.y/2.5)
	bird.position = Vector2(_windowSize.x/2.0, _windowSize.y/2.5)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
