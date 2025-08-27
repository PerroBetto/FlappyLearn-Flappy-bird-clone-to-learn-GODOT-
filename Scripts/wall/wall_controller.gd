extends Node2D

var Wall = preload("res://Scenes/wall/wall.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func create_wall(dist: float):
	#create two walls at a distance from eachother that spawn together
	var bottomWall = Wall.instantiate()
	var topWall = Wall.instantiate()
	
	topWall.rotation = PI
	topWall.isMonitoring = true
	topWall.isMonitorable = true
	
	var yPos = randf_range(200, 500)
	var StartPos:Vector2 = Vector2(1350, yPos)
	
	bottomWall.position = StartPos + Vector2(0, dist/2)
	topWall.position = StartPos - Vector2(0, dist/2)
	
	add_sibling(bottomWall)
	add_sibling(topWall)
