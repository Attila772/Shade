extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var strarr = str(get_parent().get_parent().get_node("Artifact").dist).split(".")
	text = strarr[0]
	if get_parent().get_parent().get_node("Player").Gadget != "RangeFinder":
		visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
