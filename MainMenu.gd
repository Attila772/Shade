extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var masterBus=AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(masterBus,-24)
	pass
func _process(delta):
	if !$Ambient.playing:
		$Ambient.play()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
