extends StaticBody2D

var dudes
var IsBehind = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	dudes = get_tree().get_nodes_in_group("dudes")
	for i in dudes:
		if i.position.y < position.y and i.position.y > position.y-180 and i.position.x> position.x-80 and  i.position.x< position.x+100 :
			IsBehind = true 
	if IsBehind :
		$Sprite.modulate.a = 0.5
	else:
		$Sprite.modulate.a = 1
	IsBehind= false
