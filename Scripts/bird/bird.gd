extends CharacterBody2D
signal pointUP
signal killed

@onready var _jmpsfx : AudioStreamPlayer = $JumpSound
@onready var _pntsfx : AudioStreamPlayer = $PointSound

var JumpHeight : float = -300

var state : int;
enum STATE {
	ALIVE,
	DEAD,
	TITLE
}

var minTitleHeight : float = 999.0

# Called when the node enters the scene tree for the first time.
func _ready():
	state = STATE.TITLE
	set_title_min_height(300)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	if(Globals.Paused):
		return

	if(state == STATE.ALIVE):
		if(!is_on_floor()):
			velocity.y += get_gravity().y * delta
		if(Input.is_action_just_pressed("Jump") && state == STATE.ALIVE):
			_on_jump()
	elif(state == STATE.TITLE):
		if(!is_on_floor()):
			velocity.y += get_gravity().y * delta
		if(position.y > minTitleHeight):
			_on_jump()
	elif(state == STATE.DEAD):
		_on_player_dead()

	move_and_slide()

func _on_point_detect_area_entered(area):
	if(area.name == "PointDetect"):
		_pntsfx.play()
		pointUP.emit()


func _on_point_detect_body_entered(body):
	if(body.name != "PointDetect" && body.name != self.name):
		state = STATE.DEAD

func _on_player_dead():
	killed.emit()
	print("killed")

func _on_jump():
	
	_jmpsfx.play()
	velocity.y = JumpHeight


#For the title screen, there is no player input, but rather the game inputs. We must set a min height to which the bird will jump
func set_title_min_height(MINHEIGHT : float) -> void:
	minTitleHeight = MINHEIGHT
