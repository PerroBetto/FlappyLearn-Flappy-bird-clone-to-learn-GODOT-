extends CharacterBody2D
signal pointUP
signal killed

var JumpHeight : float = -300
var alive : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(!is_on_floor()):
		velocity.y += get_gravity().y * delta
	
	if(Input.is_action_just_pressed("ui_accept") && alive):
		velocity.y = JumpHeight
	
	move_and_slide()

func _on_point_detect_area_entered(area):
	if(area.name == "PointDetect"):
		pointUP.emit()


func _on_point_detect_body_entered(body):
	if(body.name != "PointDetect" && body.name != self.name):
		killed.emit()
		alive = false
		print("killed")
