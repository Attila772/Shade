extends Node2D
var dialogbox = load("res://Ui Stuff/Dialogbox.tscn").instance()
var dialog = ["scientist","Verem a faszom mert nincsenek \n itthon yeyeyeyeye"]
var dialog2 = ["scientist","verjed a faszod mert nincsenek \n otthon"]
var dialog3 = ["scientist","Amugy eza  tutorial gec \n aaaa"]
var dialog4 = ["thief","Faszfaszfaszfaszfaszfasz \n itthon yeyeyeyeye"]
var dialog5 = ["scientist","GIT GUD  "]
var dialog6 = ["thief","press  SPACE   to dash  \n "]
var dialog7 = ["Scientist","You found the access card! \n Now you can open the locked door"]
var Dialogs = [dialog,dialog2,dialog3,dialog4,dialog5]
var Dialogs2 = [dialog6]
var Dialogs3 = [dialog7]
var dialogcheck = [false,false,false]
var Guard = [Vector2(2408.226,-706),Vector2(1655,-155)]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.path= self.filename
	get_node("Camera2D").add_child(dialogbox)
	dialogbox.dialog(Dialogs)
#	get_node("Camera2D").add_child(dialogbox)
#	dialogbox.dialog(dialog2)
#
#	get_node("Camera2D").add_child(dialogbox)
#	dialogbox.dialog(dialog3)
#
#	get_node("Camera2D").add_child(dialogbox)
#	dialogbox.dialog(dialog4)
#
#	get_node("Camera2D").add_child(dialogbox)
#	dialogbox.dialog(dialog5)
	

	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if !dialogcheck[1]:
		if $Test/Player.position.distance_to(Vector2(1750,-180)) < 100:
			get_node("Camera2D").add_child(dialogbox)
			dialogbox.dialog(Dialogs2)
			dialogcheck[1] = true
			
	if !dialogcheck[2]:
		if $StaticBody2D.visible == false:
			get_node("Camera2D").add_child(dialogbox)
			dialogbox.dialog(Dialogs3)
			dialogcheck[2] = true
			
	
	
	
	
	pass
