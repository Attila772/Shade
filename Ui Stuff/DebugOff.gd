extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed",self,"_button_pressed")
	pass # Replace with function body.

func _button_pressed():
		var Player = get_parent().get_parent().get_parent().get_node("Test").get_node("Player")
		Player.debug_mode = false
		get_parent().get_parent().remove_child(get_parent())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
