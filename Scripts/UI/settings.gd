extends Control
signal back

var PATH : String = "user://flappy.settings"

var WinMode : Window.Mode;
var Resolution : Vector2i;
var Volume : float;

func _ready():
	var values = Globals.get_settings()
	print(values)
	pass

func _on_back_pressed():
	back.emit()


func _on_apply_pressed():
	var dogs = [1, 2, 3]
	Globals.save_settings(dogs)


func _on_reset_save_pressed():
	Globals._save_score(0)
