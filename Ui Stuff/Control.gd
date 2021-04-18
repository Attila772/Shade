extends Control

var targetlvl
var timer = 3
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("LoadingAnim")
	targetlvl = Global.savedlvl


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer > 0:
		timer-=delta
	else:
		var temp = load(targetlvl)
		get_tree().change_scene_to(temp)




#	pass
