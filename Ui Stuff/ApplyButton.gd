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
	print(Global.SoundLevel)
	var VolSet=(value*0.6)-60
	var masterBus=AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(masterBus,VolSet) # Replace with function body.
	var VolGet=AudioServer.get_bus_volume_db(masterBus)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
