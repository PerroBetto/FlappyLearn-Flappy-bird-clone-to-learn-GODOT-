extends Control
signal menuTransish

var settingsBoxPreload : PackedScene = preload("res://Scenes/UI/settings.tscn")
var settingsBox : Control;

@onready var mainMenu : VBoxContainer = $mainMenu

enum Menus
{
	MAIN,
	SETTINGS
}

var currMenu : Menus

func _ready() -> void:
	currMenu = Menus.MAIN

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level.tscn")

func _on_settings_pressed() -> void:
	currMenu = Menus.SETTINGS

	settingsBox = settingsBoxPreload.instantiate()
	add_child(settingsBox)
	settingsBox.back.connect(_close_settings)

	_menu_transition()

func _menu_transition() -> void:
	menuTransish.emit()
	if(currMenu == Menus.SETTINGS):
		mainMenu.hide()
	elif(currMenu == Menus.MAIN):
		mainMenu.show()


func _on_quit_pressed() -> void:
	get_tree().quit()

func _close_settings():
	settingsBox.back.disconnect(_close_settings)
	settingsBox.queue_free()
	settingsBox = null
	currMenu = Menus.MAIN

	_menu_transition()

func get_current_menu() -> Menus:
	return currMenu
