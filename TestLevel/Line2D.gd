extends Line2D
var path = PoolVector2Array()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	path=get_parent().get_simple_path(get_parent().get_parent().get_node("Test/Guard").position,get_parent().get_parent().get_node("Test/Player").position)
	self.points = path

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	path=get_parent().get_simple_path(get_parent().get_parent().get_node("Test/Guard").position,get_parent().get_parent().get_node("Test/Player").position)
	self.points = path
#	pass
