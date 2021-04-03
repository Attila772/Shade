extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self, "_button_pressed")
	pass # Replace with function body.



func _button_pressed():
	var DebugMenu = load("res://Ui Stuff/DebugMenu.tscn").instance()
	get_parent().add_child(DebugMenu)
	DebugMenu.position += Vector2(-100,-200)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
