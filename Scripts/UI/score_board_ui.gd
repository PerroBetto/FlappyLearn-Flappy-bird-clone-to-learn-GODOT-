extends Control

@onready var Score:Label = $PanelContainer/MarginContainer/CenterContainer/Score

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Score.text = str(0)

func process_point(point: int) -> void:
	Score.text = str(point)
