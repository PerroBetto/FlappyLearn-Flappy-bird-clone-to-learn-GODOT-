extends AnimatableBody2D

@onready var Sprite : Sprite2D = $Sprite2D

var Speed : float

# Called when the node enters the scene tree for the first time.
func _ready():
	set_speed(-30)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	Sprite.region_rect.position.x += (Speed * -1) * delta

func set_speed(spd: float) -> void:
	Speed = spd
