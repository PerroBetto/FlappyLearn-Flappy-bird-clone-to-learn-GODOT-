extends AnimatableBody2D

@onready var pointDetect : Area2D = $PointDetect

var Speed: float
var isMonitoring : bool
var isMonitorable : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	set_speed(-300)
	pointDetect.monitorable = isMonitorable
	pointDetect.monitoring = isMonitoring


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#move_and_collide(Vector2(Speed, 0) * delta)
	position.x += Speed * delta
	if(position.x < -100):
		queue_free()


func set_speed(spd: float) -> void:
	Speed = spd
