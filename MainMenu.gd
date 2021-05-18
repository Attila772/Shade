extends Node2D
var soundlvl=Global.SoundLevel*0.6-60

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var masterBus=AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(masterBus,soundlvl)
	pass
func _process(delta):
	if !$Ambient.playing:
		$Ambient.play()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
