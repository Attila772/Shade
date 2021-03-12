extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a = 0.1
	connect("pressed",self,"_button_pressed")
	pass # Replace with function body.

func _button_pressed():
	var level = load("res://TestLevel/testLevel.tscn")
	get_tree().change_scene_to(level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
