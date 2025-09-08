extends Control

enum Menus
{
	MAIN,
	SETTINGS
}

var currMenu : Menus
var lastMenu : Menus

func _ready() -> void:
	currMenu = Menus.MAIN

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level.tscn")



func _on_settings_pressed() -> void:
	lastMenu = currMenu
	currMenu = Menus.SETTINGS
	_menu_transition()

func _menu_transition() -> void:
	pass


func _on_quit_pressed() -> void:
	get_tree().quit()
