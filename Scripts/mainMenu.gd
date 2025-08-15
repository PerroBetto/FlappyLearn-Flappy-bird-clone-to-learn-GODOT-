extends Node

@onready var scoreBoard : Control = $ScoreBoardUI


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals._load_data()
	scoreBoard.call("process_point", Globals.High_Score)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
