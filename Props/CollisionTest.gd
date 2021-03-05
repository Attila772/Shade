extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	if get_parent().get_node("Player").position.y < position.y and get_parent().get_node("Player").position.y > position.y-128 and get_parent().get_node("Player").position.x> position.x-80 and  get_parent().get_node("Player").position.x< position.x+70 :
		$Sprite.modulate.a = 0.5
	else:
		$Sprite.modulate.a = 1
	if get_parent().get_node("Guard").position.y < position.y and get_parent().get_node("Guard").position.y > position.y-128 and get_parent().get_node("Guard").position.x> position.x-80 and  get_parent().get_node("Guard").position.x< position.x+70:
		$Sprite.modulate.a = 0.5
	else:
		$Sprite.modulate.a = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
