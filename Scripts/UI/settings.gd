extends Control
signal back

@onready var _win_mode : OptionButton = $VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/WinMode/OptionButton

var PATH : String = "user://flappy.settings"

var WinMode : Window.Mode;
var Resolution : Vector2i;
var Volume : float;

func _ready():
	set_settings(Globals.get_settings())

func set_settings(values : Dictionary):
	WinMode = values["Window_Mode"]
	match WinMode:
		0:
			_win_mode.select(0)
			
		3:
			_win_mode.select(1)
		_:
			_win_mode.select(0)

	

func _on_back_pressed():
	back.emit()


func _on_apply_pressed():
	var new_settings = {
	"Window_Mode" : WinMode,
	"Resolution" : "1280x720",
	"Volume" : 1.0
	}
	Globals.save_settings(new_settings)
	Globals.load_settings()


func _on_reset_save_pressed():
	Globals._save_score(0)


func _on_option_button_item_selected(index:int):
	match index:
		0:
			WinMode = Window.MODE_WINDOWED
			return
		1: 
			WinMode = Window.MODE_FULLSCREEN
			return
		_:
			WinMode = Window.MODE_WINDOWED
		
