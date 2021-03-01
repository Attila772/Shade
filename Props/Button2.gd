extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a = 0.5
	connect("pressed",self,"_button_pressed")
	pass # Replace with function body.

func _button_pressed():
	get_tree().change_scene("res://Levels/HqLevel.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
