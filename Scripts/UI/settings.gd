extends Control
signal back

@onready var _win_mode : OptionButton = $VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/WinMode/OptionButton
@onready var _resolution : OptionButton = $VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/WinResolution/resolutionButton
@onready var _volume : HSlider = $VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/Volume/HSlider
@onready var _jump : Button = $VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/Jump/Button

var PATH : String = "user://flappy.settings"

var WinMode : Window.Mode;
var Resolution : Vector2i;
var Volume : float;
var Jump;

var resolutions_values = {
	"2560x1440" : Vector2i(2560, 1440),
	"1920x1080" : Vector2i(1920, 1080),
	"1280x720" : Vector2(1280, 720),
	"640x360" : Vector2i(640, 360)
}

var resolutions_index = {
	"2560x1440" : 0,
	"1920x1080" : 1,
	"1280x720" : 2,
	"640x360" : 3
}

func _ready():
	set_settings(Globals.get_settings())
	print(Jump)

func set_settings(values : Dictionary):
	WinMode = values["Window_Mode"]
	match WinMode:
		0:
			_win_mode.select(0)
			
		3:
			_win_mode.select(1)
		_:
			_win_mode.select(0)
		
	Resolution = Vector2i(values["Resolution_x"], values["Resolution_y"])
	var res_key : String = str(Resolution.x) + "x" + str(Resolution.y)
	_resolution.select(resolutions_index[res_key])

	Volume = values["Volume"]
	_volume.value = Volume
		
	Jump = values["Jump"]


func _on_back_pressed():
	back.emit()


func _on_apply_pressed():
	var new_settings = {
	"Window_Mode" : WinMode,
	"Resolution_x" : Resolution.x,
	"Resolution_y" : Resolution.y,
	"Volume" : Volume,
	"Jump" : Jump
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


func _on_resolution_button_item_selected(index:int) -> void:
	Resolution = resolutions_values[resolutions_index.find_key(index)]
	print(Resolution)


func _on_h_slider_drag_ended(_value_changed:bool):
	Volume = _volume.value
