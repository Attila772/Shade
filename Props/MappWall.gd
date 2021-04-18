extends StaticBody2D
var dudes
var IsBehind = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	if get_parent().get_node("Player").position.distance_to(position) <100:
		$Label.visible= true
		if Input.is_action_pressed("interact"):
			var mapselect = load("res://Ui Stuff/NextMap.tscn").instance()
			get_parent().get_parent().get_node("Camera2D").get_node("CenterContainer").add_child(mapselect)
	else:
		if $Label.visible:
			$Label.visible = false
	pass
