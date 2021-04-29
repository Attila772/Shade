extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed",self,"_button_pressed")
	pass # Replace with function body.

func _button_pressed():
	Global.isinmapselect = false
	var nextlvl = get_parent().get_node("Label").text
	Global.savedlvl  = Global.LevelsDB[nextlvl]
	var level = load("res://Ui Stuff/Control.tscn")
	get_tree().paused = false
	get_tree().change_scene_to(level)
