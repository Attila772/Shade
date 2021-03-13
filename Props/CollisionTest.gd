extends StaticBody2D

var IsBehind = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	IsBehind=false
	for n in range(0,get_parent().get_parent().get_node("Dudes").get_child_count()):
		if get_parent().get_parent().get_node("Dudes").get_child(n).position.y < position.y and get_parent().get_parent().get_node("Dudes").get_child(n).position.y > position.y-128 and get_parent().get_parent().get_node("Dudes").get_child(n).position.x> position.x-80 and  get_parent().get_parent().get_node("Dudes").get_child(n).position.x< position.x+70 :
			IsBehind = true
	if IsBehind :
		$Sprite.modulate.a = 0.5
	else:
		$Sprite.modulate.a = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
