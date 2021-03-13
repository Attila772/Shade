extends Node2D
#var Guard_path = PoolVector2Array()
var Guard = [Vector2(44,544),Vector2(414,309),Vector2(586,389),Vector2(821,347),Vector2(1029,370),Vector2(630,718)]
var Guard2 = [Vector2(44,544),Vector2(414,309),Vector2(586,389),Vector2(821,347),Vector2(1029,370),Vector2(630,718)]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.filename)
	Global.path = self.filename
	#var PlayerInstance= Player.instance()
	#add_child(PlayerInstance)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
