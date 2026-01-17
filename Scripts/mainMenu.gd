extends Node

@onready var scoreBoard : Control = $ScoreBoardUI
@onready var menu : Control = $MenuOptions
@onready var bird : CharacterBody2D = $bird

var _windowSize : Vector2i

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals._load_data()
	Globals.load_settings()
	scoreBoard.call("process_point", Globals.High_Score)
	menu.menuTransish.connect(score_transition)

	_windowSize = self.get_window().size
	bird.call("set_title_min_height", 720/2.5)
	bird.position = Vector2(1280/2.0, 720/2.5)
	
func score_transition():
	if(menu.call("get_current_menu") == menu.Menus.SETTINGS):
		scoreBoard.hide()
	elif(menu.call("get_current_menu") == menu.Menus.MAIN):
		Globals._load_data()
		scoreBoard.call("process_point", Globals.High_Score)
		scoreBoard.show()
