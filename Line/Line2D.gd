extends Line2D
var path = PoolVector2Array()
var player
var guard
var Patrol_path
var index = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	path=get_parent().get_simple_path(guard.position,Patrol_path[index])
	self.points = path

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dist = (guard.position-Patrol_path[index]).length()
	if dist< 5: 
		index+=1
		if index == Patrol_path.size():
			index = 0
	path=get_parent().get_simple_path(guard.position,Patrol_path[index])
	self.points = path
#	pass
