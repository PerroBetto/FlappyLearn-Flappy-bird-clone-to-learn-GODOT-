extends Control

@onready var retryButton : Button = $VBoxContainer/startOver
@onready var menuButton : Button = $VBoxContainer/quitToMenu

var gameStatus : bool = true #true if player is alive, false if dead
var isDisabled : bool = true

func _ready():
	_visibilityProcess()

func _process(_delta):
	_visibilityProcess()

	if(Globals.Paused || !(gameStatus)):
		isDisabled = false
	else:
		isDisabled = true

	retryButton.disabled = isDisabled
	menuButton.disabled = isDisabled
		


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
	
	self.modulate = Color(1, 1, 1, alpha)
	pass

func setGameStatus(status : bool) -> void:
	gameStatus = status