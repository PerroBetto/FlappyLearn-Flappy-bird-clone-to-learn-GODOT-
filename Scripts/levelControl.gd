extends Node

var dead_bird = preload("res://Scenes/bird/dead_bird.tscn")

@onready var BIRD : CharacterBody2D = $bird
@onready var wallControl : Node2D = $WallController
@onready var wallTimer : Timer = $wallTimer
@onready var ScoreBoard : Control = $ScoreBoardUI

var Score : int = 0
var maxTimer : float = 3
var minTimer : float = 1
var time : float = maxTimer

var PlayerXPos : float = 256
var PlayerAlive : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	BIRD.position = Vector2(PlayerXPos, 200) #200 == center
	BIRD.pointUP.connect(incrementPoints)
	BIRD.killed.connect(endGame)
	wallTimer.start(0.1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func incrementPoints():
	if(PlayerAlive):
		Score+=1
		if(ScoreBoard.has_method("process_point")):
			ScoreBoard.process_point(Score)
		print(Score)

func endGame():
	print("gameOver")
	PlayerAlive = false
	var birdBody = dead_bird.instantiate()
	birdBody.position = BIRD.position     
	BIRD.queue_free()
	call_deferred("add_child", birdBody) 
	if(Globals.High_Score == null || Globals.High_Score < Score):
		setHighScore()


func _on_wall_timer_timeout():
	if(PlayerAlive):
		if(wallControl.has_method("create_wall")):
			wallControl.create_wall(200)
			if(time > minTimer):
				time-=0.05
		wallTimer.start(time)

func setHighScore():
	Globals._save_score(Score)
	
