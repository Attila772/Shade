extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self, "_button_pressed")
	pass # Replace with function body.

func _button_pressed():
	get_tree().paused = false
	get_parent().get_parent().remove_child(get_parent())
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
