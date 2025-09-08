extends Save_Settings

var dead_bird = preload("res://Scenes/bird/dead_bird.tscn")

@onready var BIRD : CharacterBody2D = $bird
@onready var wallControl : Node2D = $WallController
@onready var wallTimer : Timer = $wallTimer
@onready var ScoreBoard : Control = $ScoreBoardUI
@onready var PauseMenu : Control = $PauseMenu

var Score : int = 0
var maxTimer : float = 3
var minTimer : float = 1
var time : float = maxTimer

var PlayerXPos : float = 256
var PlayerAlive : bool = true

func _ready():
	BIRD.position = Vector2(PlayerXPos, 200) #200 == center
	BIRD.pointUP.connect(incrementPoints)
	BIRD.killed.connect(endGame)
	wallTimer.start(0.1)
	BIRD.state = BIRD.STATE.ALIVE

func _process(_delta):
	if(Input.is_action_just_pressed("ui_cancel") && PlayerAlive):
		pause_play()

func incrementPoints():
	if(PlayerAlive):
		Score+=1
		if(ScoreBoard.has_method("process_point")):
			ScoreBoard.process_point(Score)
		print(Score)

#calls all endgame functions for all entities
func endGame():
	print("gameOver")
	PauseMenu.call("setGameStatus", false)
	PlayerAlive = false
	var birdBody = dead_bird.instantiate()
	birdBody.position = BIRD.position
	BIRD.queue_free()
	call_deferred("add_child", birdBody) 
	if(High_Score == null || High_Score < Score):
		setHighScore()

#called whenever the timer for creating a wall ends.
#Decreases the amount of time until the next wall.
func _on_wall_timer_timeout():
	if(PlayerAlive):
		wallControl.call("create_wall", 200)
		if(time > minTimer):
			time-=0.05
		wallTimer.start(time)

func setHighScore():
	_save_score(Score)

func pause_play():
	Paused = !Paused
	wallTimer.paused = Paused
	
