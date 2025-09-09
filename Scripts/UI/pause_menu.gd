extends Control
signal transition

var settingsBoxPreload : PackedScene = preload("res://Scenes/UI/settings.tscn")
var settingsBox : Control;

@onready var retryButton : Button = $VBoxContainer/startOver
@onready var menuButton : Button = $VBoxContainer/quitToMenu
@onready var settingsButton : Button = $VBoxContainer/Settings
@onready var menu : VBoxContainer = $VBoxContainer

var gameStatus : bool = true #true if player is alive, false if dead
var isDisabled : bool = true


enum Menus
{
	MAIN,
	SETTINGS
}

var currMenu : Menus

func _ready():
	currMenu = Menus.MAIN
	_visibilityProcess()

func _process(_delta):
	_visibilityProcess()

	if(Globals.Paused || !(gameStatus) || currMenu == Menus.SETTINGS):
		isDisabled = false
	else:
		isDisabled = true

	retryButton.disabled = isDisabled
	menuButton.disabled = isDisabled
	settingsButton.disabled = isDisabled
		


func _on_retry_pressed():
	Globals.Paused = false
	get_tree().change_scene_to_file("res://Scenes/level.tscn")


func _on_menu_pressed():
	Globals.Paused = false
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func _visibilityProcess():
	var alpha = 0
	if(Globals.Paused && gameStatus):
		alpha = 1
	elif!(gameStatus):
		alpha = 1
	else:
		alpha = 0
	
	if(currMenu == Menus.SETTINGS):
		alpha = 0
	
	menu.modulate = Color(1, 1, 1, alpha)

func setGameStatus(status : bool) -> void:
	gameStatus = status

func _on_settings_pressed():
	currMenu = Menus.SETTINGS

	settingsBox = settingsBoxPreload.instantiate()
	add_child(settingsBox)
	settingsBox.back.connect(_close_settings)
	transition.emit()

func _close_settings():
	settingsBox.back.disconnect(_close_settings)
	settingsBox.queue_free()
	settingsBox = null
	currMenu = Menus.MAIN
	transition.emit()

	
func get_current_menu() -> Menus:
	return currMenu