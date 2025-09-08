extends Control
signal back

var PATH : String = "user://flappy.settings"

var WinMode : Window.Mode;
var Resolution : Vector2i;
var Volume : float;

func _ready():
	var values = Globals.load_settings()
	print(values)
	pass

func _on_back_pressed():
	back.emit()
