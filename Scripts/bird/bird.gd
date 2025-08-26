extends CharacterBody2D
signal pointUP
signal killed

var JumpHeight : float = -300
var alive : bool = true

var state : int;
enum STATE {
	ALIVE,
	DEAD,
	TITLE	
}

# Called when the node enters the scene tree for the first time.
func _ready():
	state = STATE.ALIVE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	if(state == STATE.ALIVE):
		if(!is_on_floor()):
			velocity.y += get_gravity().y * delta
		
		if(Input.is_action_just_pressed("ui_accept") && alive):
			velocity.y = JumpHeight
		
		move_and_slide()
	elif(state == STATE.TITLE):
		pass

func _on_point_detect_area_entered(area):
	if(area.name == "PointDetect"):
		pointUP.emit()


func _on_point_detect_body_entered(body):
	if(body.name != "PointDetect" && body.name != self.name):
		state = STATE.DEAD
		killed.emit()
		alive = false
		print("killed")
