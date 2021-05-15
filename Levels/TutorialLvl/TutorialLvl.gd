extends Node2D
var dialogbox = load("res://Ui Stuff/Dialogbox.tscn").instance()
var softdialog = load("res://Ui Stuff/SoftDialogBox.tscn").instance()


var dialog = ["Guard",3,"Verem a faszom mert nincsenek \n itthon"]



var dialog2 = ["Guard",2,"verjed a faszod mert nincsenek \n otthon"]



var dialog3 = ["scientist","Amugy eza  tutorial gec \n aaaa"]
var dialog4 = ["thief","Faszfaszfaszfaszfaszfasz \n itthon yeyeyeyeye"]
var dialog5 = ["scientist","GIT GUD  "]
var dialog6 = ["thief","press  SPACE   to dash  \n "]
var dialog7 = ["Scientist","You found the access card! \n Now you can open the locked door"]

var Dialogs = [dialog,dialog2]
var Dialogs2 = [dialog6]
var Dialogs3 = [dialog7]

var dialogcheck = [false,false,false]
var guardlvl = 2
var checklocations=[Vector2(875,-175),Vector2(1450,130),Vector2(1170,-300),Vector2(2110,-175),Vector2(1365,-430),Vector2(2140,-205),Vector2(1650,-530),Vector2(2390,-300),Vector2(1910,-670),Vector2(2650,-450),Vector2(2170,-800),Vector2(3210,-230),Vector2(2530,-1020)]
var Guard = [guardlvl,5,Vector2(2408.226,-706),Vector2(1655,-155)]
var Guard2 = [guardlvl,5,Vector2(2408.226,-706),Vector2(1655,-155)]
var Guard3 = [guardlvl,5,Vector2(2408.226,-706),Vector2(1655,-155)]
var Guard4 = [guardlvl,5,Vector2(2408.226,-706),Vector2(1655,-155)]
var Camera1 = [-180,-90,0]
var Camera2 = [90,180,1]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.path= self.filename
#
#	get_node("Camera2D").add_child(softdialog)
#	softdialog.dialog(Dialogs)
#
	
	
#	

	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#
#	if !dialogcheck[1]:
#		if $Test/Player.position.distance_to(Vector2(1750,-180)) < 100:
#			get_node("Camera2D").add_child(dialogbox)
#			dialogbox.dialog(Dialogs2)
#			dialogcheck[1] = true

#	if !dialogcheck[2]:
#		if $StaticBody2D.visible == false:
#			get_node("Camera2D").add_child(dialogbox)
#			dialogbox.dialog(Dialogs3)
#			dialogcheck[2] = true
#
#w
#
	
	
	pass
