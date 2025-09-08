extends Save_Settings

@onready var scoreBoard : Control = $ScoreBoardUI
@onready var bird : CharacterBody2D = $bird

var _windowSize : Vector2i

# Called when the node enters the scene tree for the first time.
func _ready():
	_load_data()
	save_settings()
	scoreBoard.call("process_point", High_Score)

	_windowSize = self.get_window().size
	bird.call("set_title_min_height", 720/2.5)
	bird.position = Vector2(1280/2.0, 720/2.5)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# if(Input.is_action_just_pressed("ui_up")):
	# 	get_viewport().size = Vector2i(get_viewport().size.x + 16, get_viewport().size.y + 9)
	# if(Input.is_action_just_pressed("ui_down")):
	# 	get_viewport().size = Vector2i(get_viewport().size.x - 16, get_viewport().size.y - 9)
	
	# if(Input.is_action_just_pressed("ui_accept")):
	# 	get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN
	# 	get_viewport().size = Vector2i(1920, 1080)
	# print(get_viewport().size)
	pass

