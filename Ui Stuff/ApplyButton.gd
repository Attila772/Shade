extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed",self,"_button_pressed")
	pass # Replace with function body.

func _button_pressed():
	var value=get_parent().get_node("VolumeSlider").value
	Global.SoundLevel=value
	print(Global.SoundLevel) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
