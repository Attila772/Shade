extends Line2D
var path = PoolVector2Array()
var guard
var destination =Vector2(0,0)
var index = 1
var timer = 4

func _ready():# path needs to be determined here otherwise it FUKIN DIES
	path=get_parent().get_simple_path(guard.position,destination)
	self.points=path

func _process(delta):#Draws the line to the desination, pathfinding DONT TOUCH
	path=get_parent().get_simple_path(guard.position,destination)
	self.points=path
#	
